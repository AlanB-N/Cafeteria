<?php
session_name("tienda");
session_start();
session_destroy();
unset($_SESSION["user_id"]);
unset($_SESSION["user_name"]);
unset($_SESSION["nombre_usuario"]);
unset($_SESSION["nivel"]);
unset($_SESSION["nivelTitulo"]);
header("Location:../index.php");
?>

