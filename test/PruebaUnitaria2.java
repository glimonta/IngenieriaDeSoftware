/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class PruebaUnitaria2 {
    
    public PruebaUnitaria2() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
     @Test
     public void primeraconsulta() throws SQLException {
         Prueba2 intento = new Prueba2();
         String esperado = new String();
         esperado = "22382687Reinaldo EnriqueTVCABLE BronceDeco0411233445Jose LuisTVCABLE BronceDeco0320131092Marcos AntonioTVCABLE BronceDeco0312496710Oveja NegraTVCABLE BronceDeco039928313Manuel GomezTVCABLE BronceDeco0219994366Catherine ElenaTVCABLE BronceDeco0120309753John MikelTVCABLE BronceDeco01122334Fernando JavierTVCABLE BronceDeco015232141Eduardo BlancoTVCABLE BronceDeco0119379657Andrea SalcedoTVCABLE PlataDeco0220131092Marcos AntonioTVCABLE PlataDeco0235891247Angela di SerioTVCABLE PlataDeco0221030282Gabriela ClaretTVCABLE PlataDeco01912314Aguacate GuasyTVCABLE PlataDeco011235689Joel OrlandoTVCABLE PlataDeco0112332141Ramon MarquezTVCABLE PlataDeco01";
         assertTrue("Los resultados de la primera consulta corresponden",intento.consulta1().equalsIgnoreCase(esperado));
       
     }
     
     @Test
     public void segundaconsulta() throws SQLException {
         Prueba2 intento = new Prueba2();
         String esperado = new String();
         esperado = "22382687Reinaldo EnriqueTVCABLE Bronce11233445Jose LuisTVCABLE Bronce20131092Marcos AntonioTVCABLE Bronce12496710Oveja NegraTVCABLE Bronce9928313Manuel GomezTVCABLE Bronce19994366Catherine ElenaTVCABLE Bronce20309753John MikelTVCABLE Bronce122334Fernando JavierTVCABLE Bronce5232141Eduardo BlancoTVCABLE Bronce19379657Andrea SalcedoTVCABLE Plata20131092Marcos AntonioTVCABLE Plata35891247Angela di SerioTVCABLE Plata21030282Gabriela ClaretTVCABLE Plata912314Aguacate GuasyTVCABLE Plata1235689Joel OrlandoTVCABLE Plata12332141Ramon MarquezTVCABLE Plata";
         assertTrue("Los resultados de la segunda consulta corresponden",intento.consulta2().equalsIgnoreCase(esperado));
       
     }
     
       @Test
     public void terceraconsulta() throws SQLException {
         Prueba2 intento = new Prueba2();
         String esperado = new String();
         esperado = "7640";
         assertTrue("Los resultados de la tercera consulta corresponden",intento.consulta3().equalsIgnoreCase(esperado));
       
     }
       
         @Test
     public void cuartaconsulta() throws SQLException {
         Prueba2 intento = new Prueba2();
         String esperado = new String();
         esperado = "-6520";
         assertTrue("Los resultados de la cuarta consulta corresponden",intento.consulta4().equalsIgnoreCase(esperado));
       
     }
}