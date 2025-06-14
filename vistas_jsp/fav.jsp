<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookFlix - Tus libros favoritos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        /* Todo el CSS original permanece igual */
        :root {
            --bookflix-primary: #210F37;
            --bookflix-secondary: #4F1C51;
            --bookflix-dark: #1a1a2e;
            --bookflix-light: #C8ACD6;
        }
        
        body {
            background-color: #1A1A1D;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .bookflix-bg {
            background: linear-gradient(135deg, var(--bookflix-primary), var(--bookflix-secondary));
        }
        
        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: -0.5px;
        }
        
        .sidebar {
            background-color: #3B1C32;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
            padding: 20px 0;
            height: calc(100vh - 90px);
            position: sticky;
            top: 85px;
        }
        
        .main-content {
            background-color: #3B1C32;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
            min-height: calc(100vh - 90px);
        }
        
        .sidebar .nav-link {
            padding: 12px 25px;
            color: white;
            font-weight: 500;
            border-left: 4px solid transparent;
            transition: all 0.3s;
            margin: 5px 15px;
            border-radius: 4px;
        }
        
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: #DCA06D;
            color: var(--bookflix-primary);
            border-left: 4px solid var(--bookflix-primary);
        }
        
        .sidebar .nav-link i {
            margin-right: 10px;
            font-size: 1.1rem;
            width: 24px;
            text-align: center;
        }
        
        .book-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            height: 100%;
            background: linear-gradient(135deg, #3B1C32, #4F1C51);
        }
        
        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        
        .book-cover {
            height: 220px;
            background-size: cover;
            background-position: center;
            position: relative;
        }
        
        .book-actions {
            position: absolute;
            bottom: 10px;
            right: 10px;
            display: flex;
            gap: 5px;
        }
        
        .action-btn {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(255, 255, 255, 0.9);
            border: none;
            color: white;
            transition: all 0.3s;
        }
        
        .action-btn:hover {
            background-color: #A64D79;
            color: white;
        }
        
        .action-btn.active {
            background-color: #A64D79;
            color: white;
        }
        
        .search-bar {
            background-color: #A64D79;
            border-radius: 50px;
            padding: 8px 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        
        .status-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 0.75rem;
            padding: 5px 10px;
            border-radius: 20px;
        }
        
        .badge-favorite {
            background-color: #8C3061;
        }
        
        .badge-finished {
            background-color: #4ecdc4;
        }
        
        .badge-to-read {
            background-color: #ffd166;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--bookflix-primary), var(--bookflix-secondary));
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 18px;
        }
        
        .stats-card {
            border-radius: 10px;
            padding: 20px;
            color: white;
            margin-bottom: 20px;
        }
        
        .stats-favorites {
            background: linear-gradient(135deg, #8C3061, #C63C51);
        }
        
        .book-details {
            padding: 15px;
            color: #f0f0f0;
        }
        
        .section-title {
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 25px;
            color: white;
        }
        
        .section-title:after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 4px;
            background: var(--bookflix-primary);
            border-radius: 2px;
        }
        
        .welcome-message {
            background: linear-gradient(135deg, var(--bookflix-primary), var(--bookflix-secondary));
            color: white;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .genre-badge {
            background-color: #A55B4B;
            color: white;
            font-weight: 500;
        }
        
        .cover-placeholder {
            background: linear-gradient(135deg, white 0%, #A64D79 100%);
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.5rem;
        }
        
        .favorite-heart {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 1.5rem;
            color: #e74c3c;
            text-shadow: 0 0 5px white;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #C8ACD6;
        }
        
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #A64D79;
        }
    </style>
</head>
<body>
    <!-- Barra de navegación superior -->
    <nav class="navbar navbar-expand-lg navbar-dark bookflix-bg shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="logo.png" alt="BookFlix Logo" height="50" class="me-2">
                BookFlix
            </a>

            <div class="d-flex align-items-center">
                <div class="input-group search-bar me-3">
                    <input type="text" class="form-control border-0" placeholder="Buscar en favoritos..." id="searchInput">
                    <button class="btn" type="button" id="searchButton"><i class="bi bi-search"></i></button>
                </div>
                
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle text-white d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                        <div class="user-avatar me-2">
                            <!-- Primera letra del nombre de usuario -->
                            ${not empty sessionScope.usuario ? sessionScope.usuario.charAt(0) : 'U'}
                        </div>
                        <span>${sessionScope.usuario != null ? sessionScope.usuario : 'Usuario'}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2"></i>Perfil</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Configuración</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-box-arrow-right me-2"></i>Cerrar sesión</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="container-fluid py-4">
        <div class="row">
            <!-- Menú lateral -->
            <div class="col-lg-2">
                <div class="sidebar">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-house-door"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-person"></i> Perfil
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-check-circle"></i> Terminados
                                <span class="badge bg-primary float-end mt-1">${librosTerminados}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#" id="favoritesLink">
                                <i class="bi bi-heart-fill"></i> Favoritos
                                <span class="badge bg-danger float-end mt-1">${totalFavoritos}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-bookmark"></i> Por Leer
                                <span class="badge bg-warning float-end mt-1">${porLeer}</span>
                            </a>
                        </li>
                        <li class="nav-item mt-4">
                            <a class="nav-link" href="#">
                                <i class="bi bi-gear"></i> Configuración
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="#">
                                <i class="bi bi-box-arrow-right"></i> Cerrar Sesión
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- Contenido principal - Vista de Favoritos -->
            <div class="col-lg-10">
                <div class="main-content">
                    <div class="welcome-message">
                        <h2><i class="bi bi-heart-fill me-2"></i> Tus Libros Favoritos</h2>
                        <p class="mb-0">Estos son los libros que has marcado como favoritos. ¡Disfrútalos!</p>
                    </div>
                    
                    <!-- Estadísticas de favoritos -->
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="stats-card stats-favorites">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h5>Total de Favoritos</h5>
                                        <h2>${totalFavoritos}</h2>
                                    </div>
                                    <i class="bi bi-heart-fill" style="font-size: 2.5rem;"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stats-card" style="background: linear-gradient(135deg, #4F1C51, #824D74);">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h5>Autores Favoritos</h5>
                                        <h2>${autoresFavoritos}</h2>
                                    </div>
                                    <i class="bi bi-person-heart" style="font-size: 2.5rem;"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stats-card" style="background: linear-gradient(135deg, #8C3061, #C63C51);">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h5>Género Predominante</h5>
                                        <h2>${generoPredominante}</h2>
                                    </div>
                                    <i class="bi bi-bookmark-heart" style="font-size: 2.5rem;"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <h3 class="section-title">Tu Colección de Favoritos</h3>
                    
                    <!-- Grid de libros favoritos -->
                    <div class="row g-4" id="favoritesGrid">
                        <c:forEach items="${librosFavoritos}" var="libro">
                            <div class="col-lg-4 col-md-6">
                                <div class="book-card">
                                    <div class="book-cover" style="background-color: ${libro.color};">
                                        <div class="cover-placeholder">${fn:substring(libro.titulo, 0, 2)}</div>
                                        <i class="bi bi-heart-fill favorite-heart"></i>
                                        <div class="book-actions">
                                            <button class="action-btn" title="Quitar de favoritos">
                                                <i class="bi bi-heart-fill text-danger"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="book-details">
                                        <h5>${libro.titulo}</h5>
                                        <p class="text-muted">${libro.autor}</p>
                                        <div>
                                            <c:forEach items="${libro.generos}" var="genero">
                                                <span class="badge genre-badge">${genero}</span>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <!-- Estado vacío (oculto por defecto) -->
                    <div class="empty-state text-center d-none" id="emptyState">
                        <i class="bi bi-heartbreak" style="font-size: 3rem;"></i>
                        <h3>No tienes libros favoritos aún</h3>
                        <p class="text-white">Explora nuestra biblioteca y marca los libros que más te gusten con el ícono de corazón.</p>
                        <button class="btn btn-primary mt-3">Explorar libros</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Funciones para manejar acciones
        document.getElementById('searchButton').addEventListener('click', function() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const books = document.querySelectorAll('.book-card');
            let found = false;
            
            books.forEach(book => {
                const title = book.querySelector('h5').textContent.toLowerCase();
                const author = book.querySelector('.book-details p').textContent.toLowerCase();
                
                if (title.includes(searchTerm) || author.includes(searchTerm)) {
                    book.closest('.col-lg-4').classList.remove('d-none');
                    found = true;
                } else {
                    book.closest('.col-lg-4').classList.add('d-none');
                }
            });
            
            // Mostrar estado vacío si no se encontraron resultados
            if (!found && searchTerm !== '') {
                document.getElementById('emptyState').classList.remove('d-none');
            } else {
                document.getElementById('emptyState').classList.add('d-none');
            }
        });
        
        // Simular eliminación de favoritos
        document.querySelectorAll('.favorite-heart').forEach(heart => {
            heart.addEventListener('click', function() {
                const bookCard = this.closest('.book-card');
                const bookTitle = bookCard.querySelector('h5').textContent;
                
                if (confirm(`¿Quitar "${bookTitle}" de tus favoritos?`)) {
                    bookCard.closest('.col-lg-4').remove();
                    
                    // Actualizar contadores
                    const countElements = document.querySelectorAll('#favoritesLink .badge, .stats-favorites h2');
                    let count = parseInt(countElements[0].textContent);
                    count--;
                    
                    countElements.forEach(el => el.textContent = count);
                    
                    // Mostrar estado vacío si no quedan favoritos
                    if (count === 0) {
                        document.getElementById('emptyState').classList.remove('d-none');
                    }
                }
            });
        });
        
        // Mostrar estado vacío si no hay libros favoritos
        document.addEventListener('DOMContentLoaded', function() {
            if (document.querySelectorAll('.book-card').length === 0) {
                document.getElementById('emptyState').classList.remove('d-none');
            }
        });
    </script>
</body>
</html>