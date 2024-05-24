/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author piero
 */

    public class Autos {
        private int idAutos;
        private Categoria categoria;
        private Marca marca;
        private String nombre;
        private String año;
        private String placa;
        private String color;
        private String kilometraje;
        private double precio_dia;
        private String ubicacion;
        private int stock;
        private String descripcion;
        private String imagen;
        private String estado;

        public Autos() {
        }

        public Autos(int idAutos, Categoria categoria, Marca marca, String nombre, String año, String placa, String color, String kilometraje, double precio_dia, String ubicacion, int stock, String descripcion, String imagen, String estado) {
            this.idAutos = idAutos;
            this.categoria = categoria;
            this.marca = marca;
            this.nombre = nombre;
            this.año = año;
            this.placa = placa;
            this.color = color;
            this.kilometraje = kilometraje;
            this.precio_dia = precio_dia;
            this.ubicacion = ubicacion;
            this.stock = stock;
            this.descripcion = descripcion;
            this.imagen = imagen;
            this.estado = estado;
        }

        public int getIdAutos() {
            return idAutos;
        }

        public void setIdAutos(int idAutos) {
            this.idAutos = idAutos;
        }

        public Categoria getCategoria() {
            return categoria;
        }

        public void setCategoria(Categoria categoria) {
            this.categoria = categoria;
        }

        public Marca getMarca() {
            return marca;
        }

        public void setMarca(Marca marca) {
            this.marca = marca;
        }

        public String getNombre() {
            return nombre;
        }

        public void setNombre(String nombre) {
            this.nombre = nombre;
        }

        public String getAño() {
            return año;
        }

        public void setAño(String año) {
            this.año = año;
        }

        public String getPlaca() {
            return placa;
        }

        public void setPlaca(String placa) {
            this.placa = placa;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }

        public String getKilometraje() {
            return kilometraje;
        }

        public void setKilometraje(String kilometraje) {
            this.kilometraje = kilometraje;
        }

        public double getPrecio_Dia() {
            return precio_dia;
        }

        public void setPrecio_Dia(double precio_dia) {
            this.precio_dia = precio_dia;
        }

        public String getUbicacion() {
            return ubicacion;
        }

        public void setUbicacion(String ubicacion) {
            this.ubicacion = ubicacion;
        }

        public int getStock() {
            return stock;
        }

        public void setStock(int stock) {
            this.stock = stock;
        }

        public String getDescripcion() {
            return descripcion;
        }

        public void setDescripcion(String descripcion) {
            this.descripcion = descripcion;
        }

        public String getImagen() {
            return imagen;
        }

        public void setImagen(String imagen) {
            this.imagen = imagen;
        }

        public String getEstado() {
            return estado;
        }

        public void setEstado(String estado) {
            this.estado = estado;
        }
        
    } 

