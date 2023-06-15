package com.list;
import javax.ejb.*;
import com.valueList.ValueListHandler;
import com.valueList.Parameter;
import com.valueList.IteratorException;
import com.db.connection.ConnectorDB;
import java.util.List;
import java.util.ArrayList;
import java.util.Collection;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import biodata.BiodataWNIObject;
import java.sql.Statement;
import java.util.Vector;

public class BioWNIListBean extends ValueListHandler implements SessionBean,java.io.Serializable {
  SessionContext sessionContext;
  ArrayList list = null;
   int N=0;
   int MIN_ROW=0;
   int MAX_ROW=0;
   public void ejbCreate() throws CreateException {
     list=new ArrayList();
      N=500;
      MIN_ROW=1;
      MAX_ROW=N;
   }

  public void ejbRemove() {
    list.clear();
    list=null;
    System.out.println("Ejb Session Removed->" + sessionContext);

  }
  public void ejbActivate() {
    /**@todo Complete this method*/
  }
  public void ejbPassivate() {
    /**@todo Complete this method*/
  }
  public void setSessionContext(SessionContext sessionContext) {
    this.sessionContext = sessionContext;
  }

  public String executeSelect(Parameter prm)
 {
   String no_kk="", nik="", nama_lgkp="", jenis_klmin="", alamat="", pflag="", cflag="";
   String query="SELECT nik,no_kk,nama_lgkp,JENIS_KLMIN,getAlamat(no_kk) ALAMAT,";
   query=query+" pflag,cflag from biodata_wni ";
   query=query+" where " +  prm.genConditionalSQL() + " and rownum<="+ String.valueOf(MAX_ROW);
   ResultSet rs = null;
   ResultSet rscnt=null;
   Connection con=null;
   String total_cnt="0";

   list.clear();
try{
     System.out.println(query);
     PreparedStatement stmt = null;
     ConnectorDB con_db = null;
     con_db = new ConnectorDB();
     con = con_db.getConnection();
     rs = con.prepareStatement(query).executeQuery();
     while (rs.next()) {
       nik = rs.getString("nik");
       no_kk = rs.getString("no_kk");
       nama_lgkp = rs.getString("nama_lgkp");
       jenis_klmin = rs.getString("jenis_klmin");
       alamat = rs.getString("alamat");
       pflag = rs.getString("pflag");
       cflag = rs.getString("cflag");
       if (alamat!=null && !alamat.trim().equals(""))
       {
         BiodataWNIObject obj = new BiodataWNIObject
             (no_kk, nik, nama_lgkp, jenis_klmin, alamat, pflag, cflag);
         list.add(obj);
       }
     }
     setList(list);
     if (list.size()>1)
     {
       rscnt=con.prepareStatement("select count(nik) cnt from biodata_wni where " + prm.genConditionalSQL()).executeQuery();

       while(rscnt.next())
       {
         total_cnt=rscnt.getString("cnt");
       }
     }

     MAX_ROW=MAX_ROW+N;
     MIN_ROW=MIN_ROW+N;
    System.out.println(MIN_ROW +"-" + MAX_ROW);

   }    catch(Exception err)
   {   }
   finally{
     try{
       if (rs != null)
         rs.close();
     }catch(Exception err)
     {

     }
     try{
  if (rscnt != null)
    rscnt.close();
}catch(Exception err11)
{

}
     try{
       if (con!=null) con.close();
     }catch(Exception err1){}
   }
   return  total_cnt;
}

public void executeSelectPaging(Parameter prm)
   {
     String no_kk="", nik="", nama_lgkp="", jenis_klmin="", alamat="", pflag="", cflag="";
     String query="select * from(";
     query=query+" select p.*,rownum rnum from";
     query=query+"(SELECT a.nik,a.no_kk,a.nama_lgkp,a.jenis_klmin,getAlamat(a.no_kk) alamat,";
     query=query+" a.pflag,a.cflag  FROM  biodata_wni a where ";
     query=query + prm.genConditionalSQL() +")p where rownum<=" + String.valueOf(MAX_ROW)+") where rnum>="+String.valueOf(MIN_ROW);
     ResultSet rs = null;
     Connection con=null;
     try{
       PreparedStatement stmt = null;
       ConnectorDB con_db = null;
       con_db = new ConnectorDB();
       con = con_db.getConnection();
       rs = con.prepareStatement(query).executeQuery();
       while (rs.next()) {
         nik=rs.getString("nik");
         no_kk=rs.getString("no_kk");
         nama_lgkp=rs.getString("nama_lgkp");
         jenis_klmin=rs.getString("jenis_klmin");
         alamat=rs.getString("alamat");
         pflag=rs.getString("pflag");
         cflag=rs.getString("cflag");
         BiodataWNIObject obj = new BiodataWNIObject
             (no_kk, nik, nama_lgkp, jenis_klmin, alamat, pflag, cflag);
         list.add(obj);
       }
       setList(list);
       MAX_ROW=MAX_ROW+N;
       MIN_ROW=MIN_ROW+N;
       System.out.println(MIN_ROW +"-" + MAX_ROW);
     }    catch(Exception err)
     {   }
     finally{
       try{
         if (rs != null)
           rs.close();
       }catch(Exception err)
       {

       }
       try{
         if (con!=null) con.close();
       }catch(Exception err1){}
     }
   }


public int[] updatePrintStatusBio(Vector vNik)
 {
      ConnectorDB connectorDb = new ConnectorDB();
      Connection conn=null;
      Statement stmt = null;
      int result[] = new int[vNik.size()];
      String update="";

 try
       {
        conn=connectorDb.getConnection();
        stmt = conn.createStatement();

   for(int i=0;i<vNik.size();i++)
        {
          update = "UPDATE BIODATA_WNI SET PFLAG='Y' WHERE NIK=" + vNik.elementAt(i).toString();
          System.out.println(update);
          stmt.addBatch(update.trim());
        }
        result = stmt.executeBatch();


        if(vNik.size()>0)    vNik.removeAllElements();

        stmt.close();
        stmt = null;
        conn.close();
        conn=null;
      }
      catch(Exception ex)
      {
        ex.printStackTrace();
      }
      finally
      {
           try
           {
             if (stmt != null)
               stmt.close();
           }
           catch (Exception e1)
           {

           }
           try
           {
              if (conn != null)
                conn.close();
            }
            catch (Exception e2)
            {

            }
  }
  return result;
 }




 public Collection getList()
 {
   return super.getList();
 }

 public int getSize() throws IteratorException
 {
 return super.getSize();
 }
  public Object getCurrentElement() throws IteratorException
  {
    return super.getCurrentElement();
  }

public List getPreviousElements(int count) throws IteratorException
{
  return super.getPreviousElements(count);
}

public List getNextElements(int count) throws IteratorException
{
 return super.getNextElements(count);
}

public void resetIndex() throws IteratorException
{
   super.resetIndex();
}
}