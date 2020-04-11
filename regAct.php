<?php
define('ACC', true);
require('init.php');

if(empty($_POST['username'])||empty($_POST['password'])||empty($_POST['nickname'])) {
	exit('ACC Denied');
}
userModel::isLogin()&&showMsg('请先退出登陆！', true, './');
$user_re = '/^[a-zA-Z][\w]{4,15}$/';
//$email_re = '/^[\\w-]+(\\.\\w+)*@[\\w-]+((\\.\\w{2,3}){1,3})$/';
$UM = new userModel();

$username = $_POST['username'];
if (!preg_match($user_re, $username)) {
	showMsg('用户名输入错误！');
}

if ($UM->exists_uname($username)) {
	showMsg('用户名已存在！');
}

$nickname = $_POST['nickname'];
if (mb_strlen($nickname,'UTF8')<2||mb_strlen($nickname,'UTF8')>10) {
	showMsg('昵称输入错误！');
}

$password = $_POST['password'];
if (mb_strlen($password)<5||mb_strlen($password)>16) {
	showMsg('请输入5-16位密码！');
}
$hashed_pass = hash('sha256',$password);
if ($UM->add($username, $nickname, $hashed_pass, '', 0)) {
	showMsg('注册成功！将去往主页！',true, './');
} else {
	showMsg('添加用户失败！');
}
