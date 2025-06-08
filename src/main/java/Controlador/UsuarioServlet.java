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
import java.util.List;
import org.bson.types.ObjectId;

public class UsuarioServlet extends HttpServlet {
    private UsuarioDao dao = new UsuarioDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");

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
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");

        if ("insertar".equals(accion)) {
            Usuario u = new Usuario();
            u.setNombre(req.getParameter("nombre"));
            u.setCorreo(req.getParameter("correo"));
            dao.insertUsuario(u);
            resp.sendRedirect("UsuarioServlet");

        } else if ("actualizar".equals(accion)) {
            Usuario u = new Usuario();
            u.setId(new ObjectId("id"));
            u.setNombre(req.getParameter("nombre"));
            u.setCorreo(req.getParameter("correo"));
            dao.actualizarUsuario(u);
            resp.sendRedirect("UsuarioServlet");
        }
    }
}
