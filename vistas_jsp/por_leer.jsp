<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookFlix - Libros por Leer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        /* Todo el CSS original se mantiene igual */
        :root {
            --bookflix-primary: #210F37;
            --bookflix-secondary: #4F1C51;
            --bookflix-dark: #1a1a2e;
            --bookflix-light: #C8ACD6;
            --bookflix-to-read: #ffd166;
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
            color: #555;
            transition: all 0.3s;
        }
        
        .action-btn:hover {
            background-color: var(--bookflix-primary);
            color: white;
        }
        
        .action-btn.active {
            background-color: var(--bookflix-primary);
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
        
        .badge-to-read {
            background-color: var(--bookflix-to-read);
            color: var(--bookflix-primary);
        }
        
        .badge-favorite {
            background-color: #8C3061;
        }
        
        .badge-finished {
            background-color: #4ecdc4;
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
        
        .stats-to-read {
            background: linear-gradient(135deg, #824D74, #BE7B72);
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
            background: linear-gradient(135deg, #210F37 0%, #2575fc 100%);
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.5rem;
        }
        
        .to-read-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 1.5rem;
            color: var(--bookflix-to-read);
            text-shadow: 0 0 5px rgba(0,0,0,0.5);
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #C8ACD6;
        }
        
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: var(--bookflix-to-read);
        }
        
        .priority-label {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .priority-high {
            background-color: #e74c3c;
            color: white;
        }
        
        .priority-medium {
            background-color: #f39c12;
            color: white;
        }
        
        .priority-low {
            background-color: #2ecc71;
            color: white;
        }
        
        .progress-container {
            margin-top: 10px;
        }
        
        .progress-text {
            font-size: 0.85rem;
            margin-bottom: 5px;
        }
        
        .progress {
            height: 8px;
            background-color: #3B1C32;
            border-radius: 4px;
            overflow: hidden;
        }
        
        .progress-bar-custom {
            background: linear-gradient(90deg, var(--bookflix-to-read), #ff9e1b);
        }
        
        .reading-goal {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .reading-goal h5 {
            margin-bottom: 15px;
        }
        
        .btn-mark-read {
            background: var(--bookflix-to-read);
            color: var(--bookflix-primary);
            font-weight: 600;
            border: none;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn-mark-read:hover {
            background: #ffc107;
        }
    </style>
</head>
<body>
    <!-- Barra de navegación superior -->
    <nav class="navbar navbar-expand-lg navbar-dark bookflix-bg shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/logo.png" alt="BookFlix Logo" height="50" class="me-2">
                BookFlix
            </a>

            <div class="d-flex align-items-center">
                <div class="input-group search-bar me-3">
                    <input type="text" class="form-control border-0" placeholder="Buscar en por leer..." id="searchInput">
                    <button class="btn" type="button" id="searchButton"><i class="bi bi-search"></i></button>
                </div>
                
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle text-white d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                        <img class="user-avatar me-2" src="${pageContext.request.contextPath}/perfil.png" alt="Foto de perfil">
                        <span>${sessionScope.usuario.nombre}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2"></i>Perfil</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Configuración</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="logout.jsp"><i class="bi bi-box-arrow-right me-2"></i>Cerrar sesión</a></li>
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
                            <a class="nav-link" href="home.jsp">
                                <i class="bi bi-house-door"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="perfil.jsp">
                                <i class="bi bi-person"></i> Perfil
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="terminados.jsp">
                                <i class="bi bi-check-circle"></i> Terminados
                                <span class="badge bg-primary float-end mt-1">${terminadosCount}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="favoritos.jsp">
                                <i class="bi bi-heart"></i> Favoritos
                                <span class="badge bg-danger float-end mt-1">${favoritosCount}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="porLeer.jsp">
                                <i class="bi bi-bookmark-fill"></i> Por Leer
                                <span class="badge bg-warning float-end mt-1">${porLeerCount}</span>
                            </a>
                        </li>
                        <li class="nav-item mt-4">
                            <a class="nav-link" href="configuracion.jsp">
                                <i class="bi bi-gear"></i> Configuración
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="logout.jsp">
                                <i class="bi bi-box-arrow-right"></i> Cerrar Sesión
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- Contenido principal - Vista de Por Leer -->
            <div class="col-lg-10">
                <div class="main-content">
                    <div class="welcome-message">
                        <h2><i class="bi bi-bookmark-fill me-2"></i> Tu Lista de Libros por Leer</h2>
                        <p class="mb-0">Estos son los libros que planeas leer próximamente. ¡Comienza tu próxima aventura literaria!</p>
                    </div>
                    
                    <!-- Estadísticas de por leer -->
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="stats-card stats-to-read">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h5>Total por Leer</h5>
                                        <h2>${porLeerCount}</h2>
                                    </div>
                                    <i class="bi bi-bookmark-fill" style="font-size: 2.5rem;"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stats-card" style="background: linear-gradient(135deg, #4F1C51, #824D74);">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h5>Páginas Estimadas</h5>
                                        <h2>${paginasEstimadas}</h2>
                                    </div>
                                    <i class="bi bi-journal-bookmark" style="font-size: 2.5rem;"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                                   <!-- Objetivo de lectura CORREGIDO -->
                    <div class="row mb-4">
                        <div class="col-md-8">
                            <div class="reading-goal">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="mb-0">Tu objetivo de lectura mensual</h5>
                                    <span class="badge bg-warning">Activo</span>
                                </div>
                                <div class="progress-container">
                                    <div class="d-flex justify-content-between progress-text">
                                        <span>Progreso: ${librosLeidos}/10 libros</span>
                                        <span>${porcentajeCompletado}% completado</span>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-custom" role="progressbar" 
                                             style="width: ${porcentajeCompletado}%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h3 class="section-title mb-0">Tu Lista de Lectura</h3>
                        <div class="d-flex gap-2">
                            <button class="btn btn-sm btn-outline-light"><i class="bi bi-sort-down"></i> Ordenar</button>
                            <button class="btn btn-sm btn-outline-light"><i class="bi bi-funnel"></i> Filtrar</button>
                        </div>
                    </div>
                    
                    <!-- Grid de libros por leer -->
                    <div class="row g-4" id="toReadGrid">
                        <c:choose>
                            <c:when test="${empty libros}">
                                <!-- Estado vacío -->
                                <div class="col-12">
                                    <div class="empty-state" id="emptyState">
                                        <i class="bi bi-book"></i>
                                        <h3>Tu lista de lectura está vacía</h3>
                                        <p class="text-white">Añade libros que te interesen para comenzar a construir tu lista de próximas lecturas.</p>
                                        <a href="buscarLibros.jsp" class="btn btn-warning mt-3">
                                            <i class="bi bi-plus-circle me-1"></i> Añadir libros
                                        </a>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${libros}" var="libro">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="book-card">
                                            <div class="book-cover" style="background-image: url('${libro.imagenUrl}');">
                                                <span class="status-badge badge-to-read">POR LEER</span>
                                                <div class="book-actions">
                                                    <button class="action-btn" data-libro-id="${libro.id}">
                                                        <i class="bi ${libro.favorito ? 'bi-heart-fill' : 'bi-heart'}"></i>
                                                    </button>
                                                    <button class="action-btn" data-bs-toggle="modal" data-bs-target="#infoModal" data-libro-id="${libro.id}">
                                                        <i class="bi bi-info-circle"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="book-details">
                                                <h5>${libro.titulo}</h5>
                                                <p>${libro.autor}</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <span class="genre-badge badge">${libro.genero}</span>
                                                        <span class="priority-label priority-${libro.prioridad}">${libro.prioridad}</span>
                                                    </div>
                                                    <span class="text-white"><i class="bi bi-book"></i> ${libro.paginas} págs</span>
                                                </div>
                                                <button class="btn btn-mark-read mt-2" data-libro-id="${libro.id}">
                                                    <i class="bi bi-check-circle me-1"></i> Marcar como leído
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para información del libro -->
    <div class="modal fade" id="infoModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <img id="modalCover" src="" class="img-fluid rounded" alt="Portada del libro">
                        </div>
                        <div class="col-md-8">
                            <p><strong>Autor:</strong> <span id="modalAuthor"></span></p>
                            <p><strong>Género:</strong> <span id="modalGenre"></span></p>
                            <p><strong>Páginas:</strong> <span id="modalPages"></span></p>
                            <p><strong>Descripción:</strong> <span id="modalDescription"></span></p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
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
        
        // Alternar favoritos
        document.querySelectorAll('.action-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const libroId = this.getAttribute('data-libro-id');
                const icon = this.querySelector('i');
                
                // Hacer una petición AJAX para actualizar el estado de favorito
                fetch('actualizarFavorito.jsp?libroId=' + libroId)
                    .then(response => response.json())
                    .then(data => {
                        if(data.success) {
                            if(icon.classList.contains('bi-heart')) {
                                icon.className = 'bi bi-heart-fill';
                                this.classList.add('active');
                            } else {
                                icon.className = 'bi bi-heart';
                                this.classList.remove('active');
                            }
                        }
                    });
            });
        });
        
        // Marcar libro como leído
        document.querySelectorAll('.btn-mark-read').forEach(btn => {
            btn.addEventListener('click', function() {
                const libroId = this.getAttribute('data-libro-id');
                const bookCard = this.closest('.book-card');
                const bookTitle = bookCard.querySelector('h5').textContent;
                
                if (confirm(`¿Marcar "${bookTitle}" como leído?`)) {
                    // Hacer una petición AJAX para marcar como leído
                    fetch('marcarLeido.jsp?libroId=' + libroId)
                        .then(response => response.json())
                        .then(data => {
                            if(data.success) {
                                bookCard.closest('.col-lg-4').remove();
                                
                                // Actualizar contadores
                                const countElements = document.querySelectorAll('.nav-link.active .badge, .stats-to-read h2');
                                let count = parseInt(countElements[0].textContent);
                                count--;
                                
                                countElements.forEach(el => el.textContent = count);
                                
                                // Actualizar progreso de lectura
                                const progressText = document.querySelector('.progress-text span:first-child');
                                const progressBar = document.querySelector('.progress-bar');
                                
                                let currentProgress = parseInt(progressText.textContent.split('/')[0].split(': ')[1]);
                                currentProgress++;
                                
                                progressText.textContent = `Progreso: ${currentProgress}/10 libros`;
                                const newWidth = (currentProgress / 10) * 100;
                                progressBar.style.width = `${newWidth}%`;
                                
                                // Mostrar estado vacío si no quedan libros
                                if (count === 0) {
                                    document.getElementById('emptyState').classList.remove('d-none');
                                }
                                
                                alert(`¡Felicidades! Has completado "${bookTitle}"`);
                            }
                        });
                }
            });
        });
        
        // Configurar modal de información del libro
        const infoModal = document.getElementById('infoModal');
        infoModal.addEventListener('show.bs.modal', function(event) {
            const button = event.relatedTarget;
            const libroId = button.getAttribute('data-libro-id');
            
            // Obtener detalles del libro (en un caso real, esto sería una petición AJAX)
            // Aquí simulamos datos
            const libro = {
                titulo: 'Cien años de soledad',
                autor: 'Gabriel García Márquez',
                genero: 'Realismo mágico',
                paginas: 432,
                descripcion: 'Una obra maestra de la literatura hispanoamericana que narra la historia de la familia Buendía en el pueblo ficticio de Macondo.',
                imagenUrl: 'https://m.media-amazon.com/images/I/81XSN3hA5gL._AC_UF1000,1000_QL80_.jpg'
            };
            
            document.getElementById('modalTitle').textContent = libro.titulo;
            document.getElementById('modalAuthor').textContent = libro.autor;
            document.getElementById('modalGenre').textContent = libro.genero;
            document.getElementById('modalPages').textContent = libro.paginas;
            document.getElementById('modalDescription').textContent = libro.descripcion;
            document.getElementById('modalCover').src = libro.imagenUrl;
        });
    </script>
</body>
</html>