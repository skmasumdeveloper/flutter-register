<?php
	$db = mysqli_connect('localhost','root','','userdata');
	if (!$db) {
		echo "Database connection faild";
	}

	$username = $_POST['username'];
	$password = $_POST['password'];

	$sql = "SELECT username FROM login WHERE username = '".$username."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

        if ($count == 1) {
		echo json_encode(array("msg1"=>"success", "msg2"=>"User Already Exist" ));
	}else{
		$insert = "INSERT INTO login(username,password)VALUES('".$username."','".$password."')";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode(array("msg1"=>"success", "msg2"=>"hoye gache" ));
		}
	}

?>
