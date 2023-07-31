package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO004 {
	public static Connection con;
	public DAO004(){
		if(con == null){
		String dbUrl = "jdbc:mysql://localhost:3306/lenlichthidau";
		String dbClass = "com.mysql.jdbc.Driver";
		try {
		Class.forName(dbClass);
		con = DriverManager.getConnection (dbUrl, "root","12345678");
		}catch(Exception e) {
		e.printStackTrace();
		}
		}
}
}
