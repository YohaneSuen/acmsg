<?php

define('ACC', true);
require('init.php');
userModel::isLogin()||exit;
if (empty($_POST['oldpass'])||empty($_POST['newpass'])) {
	exit;
}
$data = array();
$hashed_oldpass = hash('sha256',$_POST['oldpass']);
$hashed_newpass = hash('sha256',$_POST['newpass']);
if ($hashed_oldpass==$_SESSION['hashed_password']) {
	if (mb_strlen($_POST['newpass'],'UTF8')<5||mb_strlen($_POST['newpass'], 'UTF8')>16) {
		exit;
	}
	if ($hashed_newpass==$_SESSION['hashed_password']) {
		exit('success');
	} else {
		$UM = new userModel();
		$data['hashed_password'] = $hashed_newpass;
		if ($UM->update($_SESSION['uid'], $data)) {
			$_SESSION['hashed_password'] = $hashed_newpass;
			exit('success');
		}
	}
}
