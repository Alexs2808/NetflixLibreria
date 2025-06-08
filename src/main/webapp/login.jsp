<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistema</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Iconos Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #210F37 0%, #4F1C51 100%);
            height: 100vh;
        }
        .login-card {
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }
        .login-header {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            text-align: center;
            color: #FFF4B7;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .login-body {
            padding: 30px;
            background: white;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(37, 117, 252, 0.25);
            border-color: #146ebd;
        }
        .btn-login {
            background: linear-gradient(to right, #210F37, #4F1C51);
            border: none;
            transition: all 0.3s;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(37, 117, 252, 0.4);
        }
        .link-secondary {
            transition: all 0.3s;
        }
        .link-secondary:hover {
            color: #2575fc !important;
        }
    </style>
</head>
<body>
<a href="index.jsp"></a>
<div class="container">
    <div class="form-container sign-up">
        <form action="MongoServlet" method="get">

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br><br>

            <label for="apellidoPaterno">Apellido paterno:</label>
            <input type="text" id="apellidoPaterno" name="apellidoPaterno" required><br><br>

            <label for="apellidoMaterno">Apellido materno:</label>
            <input type="text" id="apellidoMaterno" name="apellidoMaterno" required><br><br>

            <label>Fecha de nacimiento:</label>
            <input type="datetime-local" name="fechaNacimiento" required>

            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" required><br><br>

            <label for="contrasenia">Contrase&ntilde;a:</label>
            <input type="password" id="contrasenia" name="contrasenia" required><br><br>

            <input type="hidden" name="action" value="CrearUsuario">
            <input type="submit" value="Registrarse">
        </form>
    </div>
</div>

    <div class="form-container sign-in">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-5">
                <div class="login-card">
                    <div class="login-header">
                        <i class="bi bi-person-circle display-1 mb-3"></i>
                        <h2>Iniciar Sesión</h2>
                        <p class="mb-0">Ingrese sus Datos</p>
                    </div>
                    <div class="login-body">
                        <form>
                            <div class="mb-3">
                                <label for="emaillogin" class="form-label">Correo Electrónico</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-envelope"></i>
                                    </span>
                                    <input type="email" class="form-control" id="emaillogin" placeholder="usuario@ejemplo.com" required>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="password" class="form-label">Contraseña</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                    <input type="password" class="form-control" id="password" placeholder="••••••••" required>
                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="d-grid mb-3">
                                <button type="submit" class="btn btn-primary btn-login btn-lg">Iniciar Sesión</button>
                            </div>
                            <div class="text-center mt-3">
                                <a href="#" class="link-secondary text-decoration-none">Registrarse</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script para mostrar/ocultar contraseña -->
    <script>
        document.getElementById('togglePassword').addEventListener('click', function() {
            const password = document.getElementById('password');
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="bi bi-eye"></i>' : '<i class="bi bi-eye-slash"></i>';
        });
    </script>
</body>
</html>