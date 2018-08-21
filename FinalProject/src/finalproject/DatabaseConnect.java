/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalproject;

import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import javax.swing.JOptionPane;

public class DatabaseConnect {
    Connection conn = null;
    public static Connection ConnectToDatabase(){
        try{         

         Class.forName("org.postgresql.Driver");
         Properties properties=new Properties();
         properties.setProperty("user","postgres");
         properties.setProperty("password","12345");
         properties.setProperty("useUnicode","true");
         properties.setProperty("","UTF-8");
         Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/finalproject", properties);
         System.out.println("Succesfully connected to database");
         return conn;
        }

    catch (ClassNotFoundException | SQLException | HeadlessException e){
    JOptionPane.showMessageDialog(null, e);
    return null;
    }
        
    }
    
}