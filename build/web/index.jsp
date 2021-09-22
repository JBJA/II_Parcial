<%-- 
    Document   : index
    Created on : 21/09/2021, 13:56:45
    Author     : Juárez Arevalo
--%>
<%@page import="modelo.Marca" %>
<%@page import="modelo.Producto" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>II Parcial</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>
    <body>
        <h1>| ° ° ° INGRESO DE PRODUCTOS ° ° ° |</h1
        <div class="container">
            <form action="sr_producto" method="post" class="form-group">
                <label for="lbl_producto"><b>Producto</b></label>
                  <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: Producto . . ." required>
                 
                  <label for="lbl_marca"><b>Marca</b></label>
                  <select name="drop_marca" id="drop_marca" class="form-control">
                      <%
                          Marca marca = new Marca();      
                          HashMap<String,String> drop = marca.drop_marca();
                          for (String i: drop.keySet()){
                              out.println("<option value='" + i +"' >" +drop.get(i) +"</option>");
                          }
                      %>
                  </select>
                  
                  <label for="lbl_descripcion"><b>Descripcion</b></label>
                  <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo: Descripcion . . ." required>
                  
                  <label for="lbl_precio_costo"><b>Precio Costo</b></label>
                  <input type="number" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo: Precio Costo . . ." required>
                  
                  <label for="lbl_precio_venta"><b>Precio Venta</b></label>
                  <input type="number" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: Precio Venta . . ." required>
                  
                  <label for="lbl_existencia"><b>Existencia</b></label>
                  <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo: Existencia . . ." required>
                  
                  <br>
                  <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-success btn-lg" >Agregar</button>
                  <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-primary btn-lg" >Modificar</button>
                  <button name="btn_eliminar" id="btn_eliminar"  value="eliminar" class="btn btn-danger btn-lg" >Eliminar</button>
                
            </form>
                  <br>
    <table class="table table-hover">
    <thead>
      <tr>
        <th>Producto</th>
        <th>Marca</th>
        <th>Descripcion</th>
        <th>Precio Costo</th>
        <th>Precio Venta</th>
        <th>Existencia</th>
      </tr>
    </thead>
    <tbody id="tbl_productos">
        <%
            Producto producto = new Producto();
            DefaultTableModel tabla = new DefaultTableModel();
            tabla = producto.leer();
            for (int t=0;t<tabla.getRowCount();t++){
                out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_m=" + tabla.getValueAt(t, 3) + ">");
                out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                out.println("</tr>");
            }
        %>
    </tbody>
  </table>
        </div>
        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </body>
</html>
