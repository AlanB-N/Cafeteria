<?php
// Configuración de la base de datos
$db_host = "localhost";
$db_user = "root";
$db_pass = "123456789";
$db_name = "cafeteria";

// 1. Conexión MySQLi (para compatibilidad tradicional)
$link = @mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if (!$link) {
    die("Error al conectar con la base de datos: " . mysqli_connect_error());
}
mysqli_set_charset($link, "utf8mb4");

// 2. Conexión PDO Singleton / Función reutilizable
function getPDOConnection() {
    global $db_host, $db_name, $db_user, $db_pass;
    static $pdo = null;
    if ($pdo === null) {
        $dsn = "mysql:host={$db_host};dbname={$db_name};charset=utf8mb4";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        try {
            $pdo = new PDO($dsn, $db_user, $db_pass, $options);
        } catch (PDOException $e) {
            die("Error PDO: " . $e->getMessage());
        }
    }
    return $pdo;
}
?>
