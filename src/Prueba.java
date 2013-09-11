
import java.util.Properties;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.*;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gabriela
 */
public class Prueba {

    public void main(String[] args) throws SQLException, IOException, InterruptedException {
    }
    public String consulta1() throws SQLException{
         String url = "jdbc:postgresql:mocel";
        Properties props = new Properties();
        props.setProperty("user","gabriela");
        props.setProperty("password","gekommenumzubleiben");
        props.setProperty("ssl","true");
        String resultado = new String();
        Connection conn = null;
        
        try {
            conn = DriverManager.getConnection(url, props);
        } catch (SQLException ex) {
            Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
        }
          
       
        Statement st;
        st = conn.createStatement();
        
        ResultSet rs = st.executeQuery("select Cliente.cedula, Cliente.nombre, "
		+ "Plan.nombre_plan, Producto.tipo from Contrata natural join "
		+ "Producto natural join Cliente natural join Plan;");

        while (rs.next()) {
            resultado = resultado + rs.getString(1) + rs.getString(2) +rs.getString(3) + rs.getString(4);    
        }
             
        rs.close();
        st.close();
        
    return resultado;
}    
    public String consulta2() throws SQLException{
         String url = "jdbc:postgresql:mocel";
        Properties props = new Properties();
        props.setProperty("user","gabriela");
        props.setProperty("password","gekommenumzubleiben");
        props.setProperty("ssl","true");
        String resultado = new String();
        Connection conn = null;
        
        try {
            conn = DriverManager.getConnection(url, props);
        } catch (SQLException ex) {
            Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
        }
          
       
        Statement st;
        st = conn.createStatement();
        ResultSet rs =  st.executeQuery("select Cliente.cedula, Cliente.nombre, Plan.nombre_plan"
                + " from Plan natural join Cliente natural join Contrata;");
    while (rs.next()) {
            resultado = resultado + rs.getString(1) + rs.getString(2) +rs.getString(3);
        }
             
        rs.close();
        st.close();
        
    return resultado;
}
    public String consulta3() throws SQLException{
         String url = "jdbc:postgresql:mocel";
        Properties props = new Properties();
        props.setProperty("user","gabriela");
        props.setProperty("password","gekommenumzubleiben");
        props.setProperty("ssl","true");
        String resultado = new String();
        Connection conn = null;
        
        try {
            conn = DriverManager.getConnection(url, props);
        } catch (SQLException ex) {
            Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
        }
          
       
        Statement st;
        st = conn.createStatement();
        ResultSet rs =  st.executeQuery("select sum(c.cantidad * s.tarifa) + sum(p.renta_basica)"
                + " from consume c natural join servicio s, postpago p"
                + " where c.fecha_consumo > ( select max(fecha) from factura)"
                + " and"
                + " c.nro_cliente in (select nro_cliente from contrata z where codigo_plan = p.codigo_plan"
                + " and z.nro_serie = c.nro_serie);");
        while (rs.next()) {
            resultado = resultado + rs.getString(1);
        }
             
        rs.close();
        st.close();
        
    return resultado;
}
    public String consulta4() throws SQLException{
         String url = "jdbc:postgresql:mocel";
        Properties props = new Properties();
        props.setProperty("user","gabriela");
        props.setProperty("password","gekommenumzubleiben");
        props.setProperty("ssl","true");
        String resultado = new String();
        Connection conn = null;
        
        try {
            conn = DriverManager.getConnection(url, props);
        } catch (SQLException ex) {
            Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
        }
          
       
        Statement st;
        st = conn.createStatement();
        ResultSet rs =  st.executeQuery("select sum(p.monto) - sum(c.cantidad * s.tarifa)"
                + "from consume c natural join servicio s, prepago p"
                + " where c.fecha_consumo > (select max(fecha) from factura)"
                + " and"
                + " c.nro_cliente in ( select nro_cliente from contrata where codigo_plan = p.codigo_plan"
                + " and"
                + " nro_serie = c.nro_serie);");
        while (rs.next()) {
            resultado = resultado + rs.getString(1);
        }
             
        rs.close();
        st.close();
        
    return resultado;
}
}
    


    
    

