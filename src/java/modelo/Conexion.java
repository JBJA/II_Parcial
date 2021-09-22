/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Juárez Arevalo
 */
public class Conexion {
    public Connection conexionBD;
    public final String bd = "db_iiparcial";
    public final String urlConexion = "jdbc:mysql://localhost:3306/db_iiparcial";
    public final String usuario = "root";
    public final String contra = "programer1";
    public final String jdbc = "com.mysql.cj.jdbc.Driver";
    
    public void abrir_conexion(){
    try{
        Class.forName(jdbc);
        conexionBD = DriverManager.getConnection(urlConexion,usuario,contra);
        /* Mensaje de conexion */
      //  JOptionPane.showMessageDialog(null,"Conexion Exitosa . . .","Exito",JOptionPane.INFORMATION_MESSAGE);
        
    } catch(ClassNotFoundException | SQLException ex){
        System.out.println("Error . . ." + ex.getMessage());
    }
    }
    public void cerrar_conexion(){
        try{
            conexionBD.close();
            
        }catch(SQLException ex){
             System.out.println("Error . . ." + ex.getMessage());
        }       
    }
    
}
