<?php
require_once(__DIR__ . "/connection.php");

if (session_status() === PHP_SESSION_NONE) {
    session_name("cafeteria_session");
    session_start();
}

$message = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST["user_name"]) && isset($_POST["password"])) {
    $username = trim($_POST["user_name"]);
    $password = trim($_POST["password"]);

    if (!empty($username) && !empty($password)) {
        try {
            $pdo = getPDOConnection();
            $stmt = $pdo->prepare("SELECT * FROM staff_users WHERE usuario = :usuario AND activo = 1 LIMIT 1");
            $stmt->execute([':usuario' => $username]);
            $user = $stmt->fetch();

            if ($user && (password_verify($password, $user['contrasena']) || $password === $user['contrasena'])) {
                $_SESSION["user_id"] = $user['id'];
                $_SESSION["user_name"] = $user['usuario'];
                $_SESSION["nombre_usuario"] = $user['nombre'];
                $_SESSION["rol"] = $user['rol'];
                $_SESSION["foto"] = !empty($user['foto']) ? $user['foto'] : 'user.png';

                // Título legible según el rol
                switch ($user['rol']) {
                    case 'administrador':
                        $_SESSION["nivelTitulo"] = 'Administrador General';
                        break;
                    case 'encargado':
                        $_SESSION["nivelTitulo"] = 'Encargado de Pedidos';
                        break;
                    case 'cocina':
                        $_SESSION["nivelTitulo"] = 'Personal de Cocina';
                        break;
                    default:
                        $_SESSION["nivelTitulo"] = ucfirst($user['rol']);
                }

                $_SESSION["expire"] = time();

                // Redirigir según el rol
                if ($user['rol'] === 'cocina') {
                    header("Location: sistema/cocina/cocina.php");
                } else {
                    header("Location: sistema/principal.php");
                }
                exit;
            } else {
                $message = "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
                    <i class='fas fa-exclamation-triangle mr-2'></i> Usuario o contraseña incorrectos.
                    <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                        <span aria-hidden='true'>&times;</span>
                    </button>
                </div>";
            }
        } catch (Exception $e) {
            $message = "<div class='alert alert-danger'>Error en el servidor: " . htmlspecialchars($e->getMessage()) . "</div>";
        }
    } else {
        $message = "<div class='alert alert-warning'>Por favor ingresa usuario y contraseña.</div>";
    }
}

// Comprobación de expiración de sesión (12 horas)
$sessionTimeout = 43200;
if (isset($_SESSION["user_id"])) {
    if (isset($_SESSION["expire"]) && (time() - $_SESSION["expire"] > $sessionTimeout)) {
        session_unset();
        session_destroy();
        header("Location: index.php?expired=1");
        exit;
    } else {
        $_SESSION["expire"] = time();
    }
}
?>
