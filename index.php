<?php 
require_once("security/session.php");

// Si ya está logueado, redirigir
if (isset($_SESSION["user_id"])) {
    if (isset($_SESSION["rol"]) && $_SESSION["rol"] === 'cocina') {
        header("Location: sistema/cocina/cocina.php");
    } else {
        header("Location: sistema/principal.php");
    }
    exit;
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Cafetería Universitaria | Acceso al Sistema</title>
  <link rel="shortcut icon" href="dist/img/logo-icon.png">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="dist/css/fuentegoogle.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <style>
    body {
      background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: 'Source Sans Pro', sans-serif;
    }
    .login-box {
      width: 420px;
      max-width: 95%;
      margin: 20px auto;
    }
    .card {
      border-radius: 16px;
      box-shadow: 0 15px 35px rgba(0,0,0,0.25);
      border: none;
      overflow: hidden;
    }
    .card-header {
      background: #ffffff;
      border-bottom: 2px solid #f1f5f9;
      padding: 24px 20px 16px;
    }
    .brand-title {
      font-size: 1.5rem;
      font-weight: 700;
      color: #1e3c72;
      margin: 0;
    }
    .brand-subtitle {
      font-size: 0.88rem;
      color: #64748b;
      margin-top: 4px;
    }
    .btn-primary {
      background-color: #1e3c72;
      border-color: #1e3c72;
      padding: 10px;
      font-weight: 600;
      border-radius: 8px;
    }
    .btn-primary:hover {
      background-color: #152c54;
      border-color: #152c54;
    }
    .quick-roles {
      background-color: #f8fafc;
      border-radius: 8px;
      padding: 10px 14px;
      font-size: 0.82rem;
      color: #475569;
    }
    .quick-role-badge {
      cursor: pointer;
      padding: 4px 8px;
      border-radius: 4px;
      background: #e2e8f0;
      display: inline-block;
      margin: 2px;
      transition: all 0.2s;
    }
    .quick-role-badge:hover {
      background: #cbd5e1;
      color: #0f172a;
    }
  </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card">
    <div class="card-header text-center">
      <div class="mb-2">
        <i class="fas fa-coffee text-primary" style="font-size: 40px; color: #1e3c72 !important;"></i>
      </div>
      <h1 class="brand-title">Cafetería Universitaria</h1>
      <p class="brand-subtitle">Panel de Control & Gestión de Pedidos</p>
    </div>
    <div class="card-body login-card-body p-4">
      <p class="login-box-msg text-muted mb-3" style="font-size: 0.95rem;">Ingresa tus credenciales para acceder</p>

      <?php if (!empty($message)): ?>
        <?php echo $message; ?>
      <?php endif; ?>

      <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <div class="input-group mb-3">
          <input type="text" name="user_name" id="user_name" class="form-control" placeholder="Usuario" required autofocus>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>

        <div class="input-group mb-3">
          <input type="password" name="password" id="password" class="form-control" placeholder="Contraseña" required>
          <div class="input-group-append">
            <div class="input-group-text" style="cursor: pointer;" onclick="togglePassword()">
              <span id="passIcon" class="fas fa-eye-slash"></span>
            </div>
          </div>
        </div>

        <div class="row mt-4">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">
              <i class="fas fa-sign-in-alt mr-2"></i> Iniciar Sesión
            </button>
          </div>
        </div>
      </form>

      <div class="mt-4 pt-3 border-top">
        <div class="quick-roles">
          <strong><i class="fas fa-info-circle mr-1"></i> Cuentas de demostración:</strong>
          <div class="mt-2">
            <span class="quick-role-badge" onclick="fillCredentials('admin', 'admin123')">
              <strong>Admin:</strong> admin / admin123
            </span>
            <span class="quick-role-badge" onclick="fillCredentials('encargado', 'encargado123')">
              <strong>Encargado:</strong> encargado / encargado123
            </span>
            <span class="quick-role-badge" onclick="fillCredentials('cocina', 'cocina123')">
              <strong>Cocina:</strong> cocina / cocina123
            </span>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<!-- Scripts -->
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>
<script>
  function togglePassword() {
    const passInput = document.getElementById("password");
    const icon = document.getElementById("passIcon");
    if (passInput.type === "password") {
      passInput.type = "text";
      icon.classList.remove("fa-eye-slash");
      icon.classList.add("fa-eye");
    } else {
      passInput.type = "password";
      icon.classList.remove("fa-eye");
      icon.classList.add("fa-eye-slash");
    }
  }

  function fillCredentials(u, p) {
    document.getElementById("user_name").value = u;
    document.getElementById("password").value = p;
  }
</script>
</body>
</html>
