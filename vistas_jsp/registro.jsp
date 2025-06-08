<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario - Biblioteca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #210F37 0%, #4F1C51 100%);
            --primary-light: #4F1C51;
            --primary-dark: #210F37;
            --accent: #FFF4B7;
        }
        
        body {
            background: var(--primary-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }
        
        .registration-container {
            max-width: 800px;
            width: 100%;
        }
        
        .registration-card {
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            background: #fff;
            display: flex;
            min-height: 550px;
        }
        
        .registration-header {
            background: #1A1A1D;
            padding: 40px;
            color: var(--accent);
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }
        
        .registration-header i {
            font-size: 5rem;
            margin-bottom: 20px;
            display: block;
            color: var(--accent);
        }
        
        .registration-header h2 {
            font-weight: 700;
            margin-bottom: 15px;
            font-size: 2rem;
        }
        
        .registration-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .registration-body {
            padding: 40px;
            width: 60%;
        }
        
        .form-control {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(79, 28, 81, 0.25);
            border-color: var(--primary-light);
        }
        
        .input-group-text {
            background: #f8f9fa;
            border: 1px solid #ddd;
        }
        
        .btn-register {
            background: var(--primary-gradient);
            border: none;
            padding: 12px;
            font-weight: 600;
            transition: all 0.3s;
            border-radius: 8px;
            font-size: 1.1rem;
            margin-top: 10px;
            color: white;
        }
        
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(79, 28, 81, 0.4);
        }
        
        .link-secondary {
            color: #6c757d;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .link-secondary:hover {
            color: var(--primary-light) !important;
        }
        
        .password-toggle {
            cursor: pointer;
            background: #f8f9fa;
            border: 1px solid #ddd;
            border-left: none;
            display: flex;
            align-items: center;
            padding: 0 15px;
            border-radius: 0 8px 8px 0;
        }
        
        .progress {
            height: 8px;
            margin-top: 5px;
        }
        
        .password-strength {
            font-size: 0.85rem;
            margin-top: 5px;
            text-align: right;
        }
        
        .form-text {
            font-size: 0.85rem;
        }
        
        .terms-link {
            color: var(--primary-light);
            text-decoration: none;
        }
        
        .birthdate-container {
            position: relative;
        }
        
        .invalid-feedback {
            display: block;
            margin-top: 5px;
        }
        
        @media (max-width: 768px) {
            .registration-card {
                flex-direction: column;
            }
            
            .registration-header, 
            .registration-body {
                width: 100%;
            }
            
            .registration-header {
                padding: 30px 20px;
            }
            
            .registration-header i {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="registration-card">
            <div class="registration-header">
                <i class="bi bi-person-plus"></i>
                <h2>Crear Cuenta</h2>
                <p>Únete a nuestra gran biblioteca</p>
                <div class="mt-4">
                    <p>¿Ya tienes una cuenta?</p>
                    <a href="#" class="btn btn-outline-light btn-sm">Iniciar Sesión</a>
                </div>
            </div>
            
            <div class="registration-body">
                <h3 class="mb-4">Registro de Nuevo Usuario</h3>
                <form id="registrationForm">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName" class="form-label">Nombre(s)</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person"></i>
                                </span>
                                <input type="text" class="form-control" id="firstName" placeholder="Tu nombre" required>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="paternalSurname" class="form-label">Apellido Paterno</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person"></i>
                                </span>
                                <input type="text" class="form-control" id="paternalSurname" placeholder="Apellido paterno" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="maternalSurname" class="form-label">Apellido Materno</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person"></i>
                                </span>
                                <input type="text" class="form-control" id="maternalSurname" placeholder="Apellido materno" required>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="birthdate" class="form-label">Fecha de Nacimiento</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-calendar"></i>
                                </span>
                                <input type="date" class="form-control" id="birthdate" required>
                            </div>
                            <div class="invalid-feedback" id="birthdateError"></div>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-envelope"></i>
                            </span>
                            <input type="email" class="form-control" id="email" placeholder="usuario@ejemplo.com" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-lock"></i>
                            </span>
                            <input type="password" class="form-control" id="password" placeholder="••••••••" required>
                            <span class="password-toggle" id="togglePassword">
                                <i class="bi bi-eye"></i>
                            </span>
                        </div>
                        <div class="progress mt-2">
                            <div id="passwordStrength" class="progress-bar bg-danger" role="progressbar" style="width: 0%"></div>
                        </div>
                        <div id="passwordText" class="password-strength">Seguridad: baja</div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label">Confirmar Contraseña</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-lock"></i>
                            </span>
                            <input type="password" class="form-control" id="confirmPassword" placeholder="••••••••" required>
                        </div>
                        <div class="invalid-feedback" id="passwordMatchError">Las contraseñas no coinciden</div>
                    </div>
                    
                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-register">
                            <i class="bi bi-person-plus me-2"></i>Registrarse
                        </button>
                    </div>
                    
                    <div class="text-center mt-4">
                        <p class="mb-0">¿Ya tienes una cuenta? <a href="#" class="link-secondary text-decoration-none">Iniciar Sesión</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Mostrar/ocultar contraseña
        document.getElementById('togglePassword').addEventListener('click', function() {
            const password = document.getElementById('password');
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="bi bi-eye"></i>' : '<i class="bi bi-eye-slash"></i>';
        });

        // Validar fortaleza de contraseña
        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.getElementById('passwordStrength');
            const strengthText = document.getElementById('passwordText');
            
            // Medir fortaleza
            let strength = 0;
            if (password.length > 7) strength += 25;
            if (/[A-Z]/.test(password)) strength += 25;
            if (/[0-9]/.test(password)) strength += 25;
            if (/[^A-Za-z0-9]/.test(password)) strength += 25;
            
            strengthBar.style.width = strength + '%';
            
            // Actualizar texto
            if (strength < 50) {
                strengthBar.className = 'progress-bar bg-danger';
                strengthText.textContent = 'Seguridad: baja';
            } else if (strength < 75) {
                strengthBar.className = 'progress-bar bg-warning';
                strengthText.textContent = 'Seguridad: media';
            } else {
                strengthBar.className = 'progress-bar bg-success';
                strengthText.textContent = 'Seguridad: alta';
            }
        });

        // Validar coincidencia de contraseñas
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            const errorElement = document.getElementById('passwordMatchError');
            
            if (password !== confirmPassword && confirmPassword !== '') {
                this.classList.add('is-invalid');
                errorElement.style.display = 'block';
            } else {
                this.classList.remove('is-invalid');
                errorElement.style.display = 'none';
            }
        });

        // Validar fecha de nacimiento
        document.getElementById('birthdate').addEventListener('change', function() {
            const birthdate = new Date(this.value);
            const today = new Date();
            let age = today.getFullYear() - birthdate.getFullYear();
            const monthDiff = today.getMonth() - birthdate.getMonth();
            const errorElement = document.getElementById('birthdateError');
            
            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthdate.getDate())) {
                age--;
            }
            
            // Validar edad mínima y máxima
            if (age < 18) {
                this.setCustomValidity('Debes tener al menos 18 años para registrarte');
                this.classList.add('is-invalid');
                errorElement.textContent = 'Debes tener al menos 18 años para registrarte';
                errorElement.style.display = 'block';
            } else if (age > 100) {
                this.setCustomValidity('Por favor ingresa una fecha de nacimiento válida');
                this.classList.add('is-invalid');
                errorElement.textContent = 'Por favor ingresa una fecha de nacimiento válida';
                errorElement.style.display = 'block';
            } else {
                this.setCustomValidity('');
                this.classList.remove('is-invalid');
                errorElement.style.display = 'none';
            }
        });

        // Validación del formulario
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Validar coincidencia de contraseñas
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                document.getElementById('confirmPassword').classList.add('is-invalid');
                document.getElementById('passwordMatchError').style.display = 'block';
                return;
            }
            
            // Validar fecha de nacimiento
            const birthdate = document.getElementById('birthdate');
            if (birthdate.value === '') {
                birthdate.classList.add('is-invalid');
                document.getElementById('birthdateError').textContent = 'Por favor ingresa tu fecha de nacimiento';
                document.getElementById('birthdateError').style.display = 'block';
                return;
            }
            
            // Simular envío de datos
            const btn = document.querySelector('.btn-register');
            const originalBtnContent = btn.innerHTML;
            btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span> Registrando...';
            btn.disabled = true;
            
            // Obtener datos del formulario
            const formData = {
                firstName: document.getElementById('firstName').value,
                paternalSurname: document.getElementById('paternalSurname').value,
                maternalSurname: document.getElementById('maternalSurname').value,
                birthdate: document.getElementById('birthdate').value,
                email: document.getElementById('email').value,
                password: document.getElementById('password').value
            };
            
            // Simular retraso de registro
            setTimeout(() => {
                alert('¡Registro exitoso!\nBienvenido/a ' + formData.firstName + ' a nuestra biblioteca.');
                btn.innerHTML = originalBtnContent;
                btn.disabled = false;
                this.reset();
                
                // Resetear indicador de fortaleza
                document.getElementById('passwordStrength').style.width = '0%';
                document.getElementById('passwordText').textContent = 'Seguridad: baja';
            }, 2000);
        });
        
        // Configurar límites de fecha para el input de fecha de nacimiento
        const birthdateInput = document.getElementById('birthdate');
        const today = new Date();
        const minDate = new Date();
        minDate.setFullYear(today.getFullYear() - 100); // Máximo 100 años
        const maxDate = new Date();
        maxDate.setFullYear(today.getFullYear() - 18); // Mínimo 18 años
        
        birthdateInput.min = minDate.toISOString().split('T')[0];
        birthdateInput.max = maxDate.toISOString().split('T')[0];
    </script>
</body>
</html>