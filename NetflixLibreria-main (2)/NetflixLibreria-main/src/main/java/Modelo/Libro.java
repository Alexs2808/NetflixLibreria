package Modelo;

import java.time.LocalDate;

public class Libro {

    private String nombreLibro;
    private String autor;
    private String editorial;
    private String categoria;
    private LocalDate fechaPublicacion;
    private String estado; //leido, no leido

    public Libro() {

    }

    public Libro(String nombreLibro, String autor, String editorial,
                 String categoria, LocalDate fechaPublicacion, String estado) {
        this.nombreLibro = nombreLibro;
        this.autor = autor;
        this.editorial = editorial;
        this.categoria = categoria;
        this.fechaPublicacion = fechaPublicacion;
        this.estado = estado;
    }

    public String getNombreLibro() {
        return nombreLibro;
    }

    public void setNombreLibro(String nombreLibro) {
        this.nombreLibro = nombreLibro;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public LocalDate getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(LocalDate fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Libro{" +
                "nombreLibro='" + nombreLibro + '\'' +
                ", autor='" + autor + '\'' +
                ", editorial='" + editorial + '\'' +
                ", categoria='" + categoria + '\'' +
                ", fechaPublicacion=" + fechaPublicacion +
                ", estado='" + estado + '\'' +
                '}';
    }
}
