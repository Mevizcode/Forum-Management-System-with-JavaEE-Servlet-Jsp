package com.Util;

import org.apache.log4j.Logger;
import java.sql.*;

public class dbUtil {
  private static Connection con = null;
  private static PreparedStatement ps = null;
  private static final Logger logger = Logger.getLogger(Logger.class);
  private static final String url = "jdbc:mysql://localhost:3306/user_management?useUnicode=true&Encoding=utf8&serverTime=UTC";
  private static final String user = "root";
  private static final String userPass = "123456";

    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            logger.info("mySQL Driver loaded!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            logger.warn("unable to register mySql driver! Please check the error.", new Throwable(e));
        }
    }

    public static Connection getConnection() throws SQLException {
        con = DriverManager.getConnection( url,user,userPass);
        logger.info("connection successful!");
        return con;
    }

    public static ResultSet query(String sql, Object... args) throws SQLException {
        con = getConnection();
        ps = con.prepareStatement(sql);
        for(int i = 0; i < args.length; i++){
            ps.setObject(i + 1, args[i]);
        }
        return ps.executeQuery();
    }

    public static boolean cud(String sql, Object... args) throws SQLException {
        con = getConnection();
        ps = con.prepareStatement(sql);
        for(int i = 0; i < args.length; i++){
            ps.setObject(i + 1, args[i]);
        }
        return ps.executeUpdate() >= 1 ? true : false;
    }

    public static void close(){
        try {
            if (con != null) {
                con.close();
                logger.info("Connection closed");
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.warn("Fail to close connection", new Throwable(e));
        }

        try {
            if (ps != null) {
                ps.close();
                logger.info("Prepared statement closed");
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.warn("Fail to close prepared statement", new Throwable(e));
        }
    }
}
