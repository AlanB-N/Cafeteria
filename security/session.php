<?php
include("connection.php");

session_name("tienda");
session_start();

$message = "";
$status = 1;

			if(count($_POST) > 0) {
					$sql = "SELECT * FROM usuarios 
					WHERE usuario = '" . addslashes($_POST["user_name"]) . "' 
					AND contrasena = '". addslashes($_POST["password"]) . "'
					AND estado = '".$status."'";

					$result = mysqli_query($link,$sql);
					$row  = mysqli_fetch_array($result);

					if(is_array($row)) {
						$_SESSION["user_id"] = $row['idUsuario'];
						$_SESSION["user_name"] = $row['usuario'];
						$_SESSION["nombre_usuario"] = $row['nombreUsuarios'];
						$_SESSION["nivel"] = $row['nivel'];

						if ($row['nivel'] == 1) {
							$_SESSION["nivelTitulo"] = 'Administrador';
						}else if($row['nivel'] == 2){
								$_SESSION["nivelTitulo"] = 'Cajero';
						}else{
								$_SESSION["nivelTitulo"] = 'Encargado';
						}
					} else {
								$message = "<div class='alert alert-danger'>
											<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
											<strong>Usuario y/o Contraseña incorrectos | verifica tus datos.</strong>
											</div>";
							}
							
						}
 
$time = 36000000; // una hora en mili-segundos

if(isset($_SESSION["user_id"])) {
	header("Location:sistema/principal.php");
	// verificamos si existe la sesión que se encarga del tiempo
    // si existe, y el tiempo es mayor que una hora, expiramos la sesión 
	if(isset($_SESSION["expire"]) && time() > $_SESSION["expire"] + $time){
		unset($_SESSION["expire"]);
		unset($_SESSION["session_name"]);
	} else {// si no existe la creamos
		$_SESSION["expire"] = time();
	}
}


?>