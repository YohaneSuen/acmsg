<?php
/*
file userModel.class.php
用户管理类
*/
defined('ACC')||exit('ACC Denied');

class userModel extends model {
	protected $table = 'user';

	public function add($username, $nickname, $hashed_pass, $email, $type=0){
		$arr = array();
		$arr['regip'] = $_SERVER['REMOTE_ADDR'];
		$arr['regtime'] = time();
		$arr['username'] = $username;
		$arr['nickname'] = $nickname;
		$arr['hashed_password'] = $hashed_pass;
		$arr['email'] = $email;
		$arr['type'] = $type;
		$re = $this->db->autoExecute($this->table, $arr);
		if ($re) {
			$this->login($username, $hashed_pass);
		}
		return $re;
	}

	public function exists_uname($uname){
		$sql = 'select count(*) from '.$this->table.' where username=\''.$uname.'\'';
		return $this->db->getOne($sql)!=0;
	}

	public function exists_email($email){
		$sql = 'select count(*) from '.$this->table.' where email=\''.$email.'\'';
		return $this->db->getOne($sql)!=0;
	}

	public static function getUsername($uid){
		$conf = conf::getInstance();
		if ($conf->use_mysqli) {
			$db = mysql_::getInstance();
		} else {
			$db = mysql::getInstance();
		}
		$sql = 'select username from user where uid='.$uid;
		return $db->getOne($sql);
	}

	public function login($user, $hashed_pass){
		$isLogin = false;
		$sql = 'select uid,type,username,nickname,email,hashed_password,regtime,lastlogin from '.$this->table.' where username=\''.$user.'\'';
		$row = $this->db->getRow($sql);
		if (count($row)>0) {
			if ($row['username']===$user&&$row['hashed_password']===$hashed_pass) {
				$isLogin = true;
				$_SESSION = $row;
				$_SESSION['nickname'] = htmlspecialchars($_SESSION['nickname']);
				$upsql = 'update '.$this->table.
				' set lastip=\''.$_SERVER['REMOTE_ADDR'].
				'\',lastlogin=\''.time().
				'\' where uid='.$row['uid'];
				$this->db->query($upsql);
			}
		}
		$isLogin||$this->logout();
		return $isLogin;
	}

	public function update($uid, $data) {
		return $this->db->autoexecute($this->table, $data, 'update', 'uid='.$uid);
	}

	public static function isLogin() {
		return isset($_SESSION['username']);
	}

	public static function logout() {
		$temp = isset($_SESSION['template'])?$_SESSION['template']:'default';
		$_SESSION = array();
		$_SESSION['template'] = $temp;
	}


}
