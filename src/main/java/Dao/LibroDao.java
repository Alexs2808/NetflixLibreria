package Dao;

import Modelo.Libro;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LibroDao {

    private final MongoCollection<Document> coleccion;

    public LibroDao(){
        MongoClient mongoClient = MongoClients.create("mongodb+srv://alexs:root@cluster0.ujl8fuq.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0");
        MongoDatabase db = mongoClient.getDatabase("NetflixLibreria");
        this.coleccion = db.getCollection("Libro");
    }

    private void insertarLibro(Libro libro) {

        Document doc = new Document("nombreLibro", libro.getNombreLibro()).append("autor", libro.getAutor()).append("editorial" +
                "", libro.getEditorial()). append("categoria", libro.getCategoria()).append("fechaPublicacion" +
                "", libro.getFechaPublicacion()).append("estado", libro.getEstado());
        coleccion.insertOne(doc);

    }

    public List<Libro> listarLibro() {
        List<Libro> lista = new ArrayList<Libro>();
        for (Document doc : coleccion.find()) {
            Date fecha = doc.getDate("fechaPubliacacion");

            LocalDateTime fechaPublicacion = null;
            if (fecha != null) {
                fechaPublicacion = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            }
            Libro libro = new Libro(doc.getString("nombreLibro"), doc.getString("autor"),
                    doc.getString("editorial"), doc.getString("categoria"), fechaPublicacion, doc.getString("estado"));
            lista.add(libro);
        }
        return lista;
    }

    public void actualizarLibro(Libro libro) {
        Document filtro = new Document("nombreLibro", libro.getNombreLibro());
        Document nueevo = new Document("$set", new Document("nombreLibro", libro.getNombreLibro()).append("autor", libro.getAutor()).append("editorial" +
                "", libro.getEditorial()). append("categoria", libro.getCategoria()).append("fechaPublicacion" +
                "", libro.getFechaPublicacion()).append("estado", libro.getEstado()));
        coleccion.updateOne(filtro, nueevo);
    }

    public Libro obtetnerLibroPorId(String id){
        Document filtro = new Document("_id", new ObjectId(id));
        Document doc = coleccion.find(filtro).first();

        Date fecha = doc.getDate("fechaPublicacion");

        LocalDateTime fechaPublicacion = null;
        if (fecha != null) {
            fechaPublicacion = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        }

        if(doc != null){
            Libro libro = new Libro(
                    doc.getString("nombreLibro"),
                    doc.getString("autor"),
                    doc.getString("editorial"),
                    doc.getString("categoria"),
                    fechaPublicacion,
                    doc.getString("estado")
            );
            libro.setId(doc.getObjectId("id"));
            return libro;
        }else{
            return null;
        }
    }

    public void eliminarLibro(String id) {
        Document filtro = new Document("_id", new ObjectId(id));
        coleccion.deleteOne(filtro);
    }

}
