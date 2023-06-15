package com.penan;

import javax.ejb.*;
import java.sql.*;
import com.db.connection.*;
import oracle.jdbc.driver.*;
import siaktools.logwriter.SiakWriter;


public class ViewTtd {
  String datret="ViewTtd";
  public ViewTtd() {
  }
  public String getFileTandaTangan(String deprop,String dekab,String dekec,String dekel) {
   String kembali="";
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement stmt = null;
    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      String query = "select FILE_TTD from setup_kel where no_prop=" + deprop + "and no_kab=" +
      dekab + "and no_kec=" + dekec + "and no_kel=" + dekel;

      rs = stmt.executeQuery(query.trim());
      while (rs.next()) {
       kembali = rs.getString("FILE_TTD");
       }

       if(rs!=null) {rs.close();}

       if(stmt!=null) {stmt.close();}

    }
    catch(Exception e) {
      e.printStackTrace();
      //siakWriter.writeFile(e);
    }


    return kembali;

 }

}