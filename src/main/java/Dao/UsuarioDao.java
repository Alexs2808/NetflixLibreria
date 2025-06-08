package Dao;

import Modelo.Usuario;
import com.mongodb.client.*;
import org.bson.Document;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.time.LocalDate;
import org.bson.types.ObjectId;


public class UsuarioDao {

    private final MongoCollection<Document> coleccion;

    public UsuarioDao() {
        MongoClient mongoClient = MongoClients.create("mongodb+srv://alexs:root@cluster0.ujl8fuq.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0");
        MongoDatabase db = mongoClient.getDatabase("NetflixLibreria");
        this.coleccion = db.getCollection("Usuario");
    }

    //Creacion de usuario
    public void insertUsuario(Usuario usuario) {
        Date fecha = Date.from(usuario.getFechaNacimiento().atZone(ZoneId.systemDefault()).toInstant());


        Document doc = new Document("nombre", usuario.getNombre()).append("apellidoPaterno", usuario.getApellidoPaterno()).append("apellidoMaterno", usuario.getApellidoMaterno()).append("" +
                "fechaNacimiento", usuario.getFechaNacimiento()).append("correo", usuario.getCorreo()).append("nombreUsuario", usuario.getNombreUsusario()).append("contrasenia", usuario.getContrasenia());
        coleccion.insertOne(doc);
    }

    //Listado de usuarios
    public List<Usuario> listarUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        for (Document doc : coleccion.find()) {

            Date fecha = doc.getDate("fechaNacimiento");

            LocalDateTime fechaNacimiento = null;
            if (fecha != null) {
                fechaNacimiento = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            }

            Usuario usuario = new Usuario(doc.getString("nombre"), doc.getString("apellidoPaterno"), doc.getString("apellidoMaterno"),
                    fechaNacimiento, doc.getString("correo"), doc.getString("nombreUsuario"), doc.getString("contrasenia"));
            usuario.setId(doc.getObjectId("_id"));
            lista.add(usuario);
        }
        return lista;
    }


    //actualizar

    public void actualizarUsuario(Usuario usuario) {
        Document filtro = new Document("nombre", usuario.getNombre());
        Document nuevo = new Document("$set", new Document("nombre", usuario.getNombre()).append("apelleidoPaterno", usuario.getApellidoPaterno()).append("apellidoMaterno", usuario.getApellidoMaterno()).append("" +
                "fechaNacimiento", usuario.getFechaNacimiento()).append("correo", usuario.getCorreo()).append("nombreUsusario", usuario.getNombreUsusario()).append("contrasenia", usuario.getContrasenia()));
        coleccion.updateOne(filtro, nuevo);
    }

public Usuario obtenerUsuarioPorId(String id) {
    /*Document filtro = new Document("_id", new ObjectId(id));
    Document doc = coleccion.find(filtro).first();

    if (doc != null) {
        Usuario usuario = new Usuario(
            doc.getString("nombre"),
            doc.getString("apellidoPaterno"), // <- corregido
            doc.getString("apellidoMaterno"),
            doc.getDate("fechaNacimiento").toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate(),
            doc.getString("correo"),
            doc.getString("nombreUsuario"), // <- corregido
            doc.getString("contrasenia")
        );
        usuario.setId(doc.getObjectId("_id"));
        return usuario;
    } else {*/
        return null;
    }
}

