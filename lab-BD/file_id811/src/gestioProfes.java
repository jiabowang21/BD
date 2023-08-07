import java.sql.*;
import java.util.Properties;

public class gestioProfes
   {
   public static void main (String args[])
     {
	try
	   {
	   // carregar el driver al controlador
	   Class.forName ("org.postgresql.Driver");
           System.out.println ();
	   System.out.println ("Driver de PostgreSQL carregat correctament.");
           System.out.println ();


	   // connectar a la base de dades
	   // cal modificar el username, password i el nom de la base de dades
	   // en el servidor postgresfib, SEMPRE el SSL ha de ser true
	   Properties props = new Properties();
	   props.setProperty("user","ElVostreUsername");
	   props.setProperty("password","ElVostrePassword");
	   props.setProperty("ssl","true");
	   props.setProperty("sslfactory", "org.postgresql.ssl.NonValidatingFactory"); 
	   Connection c = DriverManager.getConnection("jdbc:postgresql://postgresfib.fib.upc.es:6433/LaVostraBD", props);
	   c.setAutoCommit(false);
	   System.out.println ("Connexio realitzada correctament.");
	   System.out.println ();


	   // canvi de l'esquema per defecte a un altre esquema
		 Statement s = c.createStatement();
		 s.executeUpdate("set search_path to ElVostreEsquema;");
		 s.close();					
	   System.out.println ("Canvi d'esquema realitzat correctament.");
           System.out.println ();

	   // inserir un Professor
       String dni = "555";
       String nom = "nina";
       String telf = "3555";
       int sou = 1000;
	   String nouProfe = "insert into Professors values ('"+dni+"','"+nom+"','"+telf+"',"+sou+")";
	   Statement st = c.createStatement();
	   st.executeUpdate(nouProfe);
	   System.out.println ("Insercio realitzada");
           System.out.println ();
		   
	   // IMPLEMENTAR
       // printar el dni i el nom dels professors que tenen els tel�fons amb n�mero inferior al que s'indica en la variable buscaTelf
       // en cas que no hi hagi cap professor amb aquest tel�fon printar "NO TROBAT"     
       String buscaTelf="3334";    

       
	   // Rollback i desconnexio de la base de dades
	   c.rollback();
	   c.close();
	   System.out.println ("Rollback i desconnexio realitzats correctament.");
	   }
	
	catch (ClassNotFoundException ce)
	   {
	   System.out.println ("Error al carregar el driver");
	   }	
	catch (SQLException se)
	   {
           System.out.println ("Excepcio: ");System.out.println ();
	   System.out.println ("El getSQLState es: " + se.getSQLState());
           System.out.println ();
	   System.out.println ("El getMessage es: " + se.getMessage());	   
	   }
  }
}