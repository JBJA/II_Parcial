/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Juárez Arevalo
 */
public class Producto extends Objeto {
    private int id_marca;
    private Conexion  cn;

    public Producto() {}
    public Producto(int id_marca, int id, String producto, String descripcion, String precio_costo, String precio_venta, String existencia) {
        super(id, producto, descripcion, precio_costo, precio_venta, existencia);
        this.id_marca = id_marca;
    }
    
    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion ();
            cn.abrir_conexion();
            String query = "SELECT p.id_producto as id,p.producto,m.marca,m.id_marca,p.descripcion,p.precio_costo,p.precio_venta,p.existencia FROM productos as p inner join marcas as m on p.id_marca = m.id_marca;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","producto","marca","id marca","descripcion","precio costo","precio venta","existencia"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[8];
            while (consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("producto");
                datos[2] = consulta.getString("marca");
                datos[3] = consulta.getString("id_marca");
                datos[4] = consulta.getString("descripcion");
                datos[5] = consulta.getString("precio_costo");
                datos[6] = consulta.getString("precio_venta");
                datos[7] = consulta.getString("existencia");
                
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return tabla;
    }
    
    @Override
    public int agregar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query="INSERT INTO productos(producto,id_marca,descripcion,precio_costo,precio_venta,existencia) VALUES(?,?,?,?,?,?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getProducto());
        parametro.setInt(2, getId_marca());
        parametro.setString(3, getDescripcion());
        parametro.setString(4, getPrecio_costo());
        parametro.setString(5, getPrecio_venta());
        parametro.setString(6, getExistencia());
        
        retorno = parametro.executeUpdate();
        
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
    
    return retorno;
    }
    
}
