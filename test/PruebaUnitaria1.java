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
public class PruebaUnitaria1 {
    
    public PruebaUnitaria1() {
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
         Prueba intento = new Prueba();
         String esperado = new String();
         esperado = "11233445Jose LuisPlan Mocel 2000Nokia N99912496710Oveja Negra" + 
                 "Plan Mocel 2000Nokia N9999928313Manuel GomezPlan Mocel 2000Blackberry" + 
                 "20309753John MikelPlan Mocel 2000Iphone 9GS19994366Catherine Elena" +
                 "Plan Mocel 2000Iphone 9GS122334Fernando JavierPlan Mocel 2000Iphone 9GS5232141" +
                 "Eduardo BlancoPlan Mocel 2000Iphone 9GS20131092Marcos AntonioPlan Mixto Plus" +
                 "Nokia N99919379657Andrea SalcedoPlan Mixto PlusBlackberry20131092Marcos Antonio" +
                 "Plan Mixto PlusBlackberry35891247Angela di SerioPlan Mixto PlusBlackberry21030282" +
                 "Gabriela ClaretPlan Mixto PlusIphone 9GS1235689Joel OrlandoPlan Mixto PlusIphone 9GS" +
                 "12332141Ramon MarquezPlan Mixto PlusIphone 9GS912314Aguacate Guasy"+
                 "Plan Mixto PlusIphone 9GS";
         assertTrue("Los resultados de la primera consulta corresponden",esperado.equalsIgnoreCase(intento.consulta1()));
       
     }
     
     @Test
     public void segundaconsulta() throws SQLException {
         Prueba intento = new Prueba();
         String esperado = new String();
         esperado = "11233445Jose LuisPlan Mocel 200012496710Oveja Negra"+
                 "Plan Mocel 20009928313Manuel GomezPlan Mocel 200020309753John Mikel"+
                 "Plan Mocel 200019994366Catherine ElenaPlan Mocel 2000122334Fernando Javier"+
                 "Plan Mocel 20005232141Eduardo BlancoPlan Mocel 200020131092Marcos Antonio"+
                 "Plan Mixto Plus19379657Andrea SalcedoPlan Mixto Plus20131092Marcos Antonio"+
                 "Plan Mixto Plus35891247Angela di SerioPlan Mixto Plus21030282Gabriela Claret"+
                 "Plan Mixto Plus1235689Joel OrlandoPlan Mixto Plus12332141Ramon Marquez"+
                 "Plan Mixto Plus912314Aguacate GuasyPlan Mixto Plus";
         assertTrue("Los resultados de la primera consulta corresponden",intento.consulta2().equalsIgnoreCase(esperado));
       
     }
     
       @Test
     public void terceraconsulta() throws SQLException {
         Prueba intento = new Prueba();
         String esperado = new String();
         esperado = "1055";
         assertTrue("Los resultados de la primera consulta corresponden",intento.consulta3().equalsIgnoreCase(esperado));
       
     }
       
         @Test
     public void cuartaconsulta() throws SQLException {
         Prueba intento = new Prueba();
         String esperado = new String();
         esperado = "null";
         assertTrue("Los resultados de la primera consulta corresponden",intento.consulta4().equalsIgnoreCase(esperado));
       
     }
}