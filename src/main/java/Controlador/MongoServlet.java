package Controlador;

import Dao.UsuarioDao;
import Modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

public class MongoServlet extends HttpServlet {
    private UsuarioDao usuarioDao;

    @Override
    public void init() {
        usuarioDao = new UsuarioDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);

        String emaillogin = req.getParameter("emaillogin");
        String password = req.getParameter("password");

        if (emaillogin != null && password != null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Estos campos son obligatorios");
            return;
        }

        boolean valido = usuarioDao.validarInicio(emaillogin, password);

        if (valido) {
            req.getSession().setAttribute("emaillogin", emaillogin);
            resp.sendRedirect("UsuarioServlet");
        }else{
            req.setAttribute("errorMessage", "Credenciales incorrectas");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("crearUsuario".equals(action)) {
            String nombre = req.getParameter("nombre");
            String apellidoPaterno = req.getParameter("apellidoPaterno");
            String apellidoMaterno = req.getParameter("apellidoMaterno");
            String fechaNacimientoStr = req.getParameter("fechaNacimiento");
            String correo = req.getParameter("correo");
            String contrasenia = req.getParameter("contrasenia");

            if (nombre != null && apellidoPaterno != null && apellidoMaterno != null &&
                    fechaNacimientoStr != null && correo != null && contrasenia != null) {
                try {
                    // Convertir String a LocalDateTime
                    LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoStr);
                    Usuario usuario = new Usuario(nombre, apellidoPaterno, apellidoMaterno,
                            fechaNacimiento.atStartOfDay(), correo, contrasenia);
                    usuarioDao.insertUsuario(usuario);
                    resp.sendRedirect("login.jsp");
                } catch (Exception e) {
                    resp.getWriter().write("Error al crear usuario: " + e.getMessage());
                }
            } else {
                resp.getWriter().write("Por favor, complete todos los campos");
            }
        } else {
            resp.getWriter().write("Acción no válida o no especificada");
        }
    }


}
