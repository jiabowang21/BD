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
	   props.setProperty("user","jiabo.wang");
	   props.setProperty("password","DB130701");
	   props.setProperty("ssl","true");
	   props.setProperty("sslfactory", "org.postgresql.ssl.NonValidatingFactory"); 
	   Connection c = DriverManager.getConnection("jdbc:postgresql://postgresfib.fib.upc.es:6433/DBjiabo.wang", props);
	   c.setAutoCommit(false);
	   System.out.println ("Connexio realitzada correctament.");
	   System.out.println ();


	   // canvi de l'esquema per defecte a un altre esquema
		 Statement s = c.createStatement();
		 s.executeUpdate("set search_path to public;");
		 s.close();					
	   System.out.println ("Canvi d'esquema realitzat correctament.");
           System.out.println ();

           
	   // IMPLEMENTAR CONSULTA
       /*PreparedStatement ps = c.prepareStatement("select p.dni, p.nomProf "+
    		   									 "from professors p "+
    		   									 "where p.telefon = ? ;"); */
       //String[] telfsProf = {"3111", "3222", "3333", "4444"};
      /* String dni = null;
       String nomProf = null;
       String telefon = null;
       ResultSet rs;
       int size = telfsProf.length;
       for (int i = 0; i < size; ++i) {
    	   telefon = telfsProf[i];
    	   ps.setString(1, telefon);
    	   rs = ps.executeQuery();
    	   if (rs.next()) {
    	   	   nomProf = rs.getString("nomProf");
    	   	   dni = rs.getString("dni");
    		   System.out.println (" dni "+dni+" i nom "+nomProf); 
    	   }
    	   else {
    		   System.out.println (" NO TROBAT");
    	   }
       }
       ps.close();   */
	   // IMPLEMENTAR CANVI BD       
       Statement ps = c.createStatement();
       String modul = "omega";
       int numFilesModificades = ps.executeUpdate ("update despatxos "+
    		   									   "set superficie = superficie + 3 "+
    		   									   "where modul = '"+modul+"' and not exists( select * from assignacions a where a.modul = despatxos.modul and a.numero = despatxos.numero and a.instantFi is null)    ;");
       System.out.println("Número de files modificades "+ numFilesModificades); 
       s.close();

	   // Commit i desconnexio de la base de dades
	   c.commit();
	   c.close();
	   System.out.println ("Commit i desconnexio realitzats correctament.");
	   }
	
	catch (ClassNotFoundException ce)
	   {
	   System.out.println ("Error al carregar el driver");
	   }	
	catch (SQLException se)
	   {
	   System.out.println ("Excepcio: ");System.out.println ();
	   if (se.getSQLState().equals("23514")) System.out.println("Algún despatx passaria a tenir superfície superior o igual a 25");
	   else {    
		   System.out.println ("El getSQLState es: " + se.getSQLState());
           System.out.println ();
           System.out.println ("El getMessage es: " + se.getMessage());	   
	   }
	  }
  }
}