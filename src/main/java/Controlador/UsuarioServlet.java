/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;


import Dao.UsuarioDao;
import Modelo.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.bson.types.ObjectId;

public class UsuarioServlet extends HttpServlet {
    private UsuarioDao dao = new UsuarioDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       /* String accion = req.getParameter("accion");

        if ("ver".equals(accion)) {
            String id = req.getParameter("id");
            Usuario u = dao.obtenerUsuarioPorId(id);
            req.setAttribute("usuario", u);
            req.getRequestDispatcher("/verUsuario.jsp").forward(req, resp);

        } else if ("editar".equals(accion)) {
            String id = req.getParameter("id");
            Usuario u = dao.obtenerUsuarioPorId(id);
            req.setAttribute("usuario", u);
            req.getRequestDispatcher("/editarUsuario.jsp").forward(req, resp);

        } else {
            List<Usuario> lista = dao.listarUsuarios();
            req.setAttribute("usuarios", lista);
            req.getRequestDispatcher("/listarUsuarios.jsp").forward(req, resp);
        }*/
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fechaStr = req.getParameter("fechaNacimiento");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime fechaNacimiento = LocalDateTime.parse(fechaStr, formatter);

        String accion = req.getParameter("accion");

        if ("insertar".equals(accion)) {
            Usuario u = new Usuario();
            u.setNombre(req.getParameter("nombre"));
            u.setApellidoPaterno(req.getParameter("apellidoPaterno"));
            u.setApellidoMaterno(req.getParameter("apellidoMaterno"));
            u.setFechaNacimiento(fechaNacimiento);
            u.setCorreo(req.getParameter("correo"));
            u.setNombreUsusario(req.getParameter("nombreUsusario"));
            u.setContrasenia(req.getParameter("contrasenia"));
            dao.insertUsuario(u);
            resp.sendRedirect("UsuarioServlet");

        } else if ("actualizar".equals(accion)) {
            Usuario u = new Usuario();
            u.setId(new ObjectId("id"));
            u.setNombre(req.getParameter("nombre"));
            u.setApellidoPaterno(req.getParameter("apellidoPaterno"));
            u.setApellidoMaterno(req.getParameter("apellidoMaterno"));
            u.setFechaNacimiento(fechaNacimiento);
            u.setCorreo(req.getParameter("correo"));
            u.setNombreUsusario(req.getParameter("nombreUsusario"));
            u.setContrasenia(req.getParameter("contrasenia"));
            dao.actualizarUsuario(u);
            resp.sendRedirect("UsuarioServlet");
        }
    }
}
