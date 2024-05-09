package Modelo;

import java.sql.Timestamp;

public class Usuario {

    private int idUsuario;
    private String usuario;
    private String clave;
    private String token;
    private Timestamp expiracion;

    public Usuario() {
    }

    public Usuario(int idUsuario, String usuario, String clave, String token, Timestamp expiracion) {
        this.idUsuario = idUsuario;
        this.usuario = usuario;
        this.clave = clave;
        this.token = token;
        this.expiracion = expiracion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Timestamp getExpiracion() {
        return expiracion;
    }

    public void setExpiracion(Timestamp expiracion) {
        this.expiracion = expiracion;
    }

}
