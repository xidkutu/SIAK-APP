package siaktools.logwriter;

import java.io.*;

import java.util.Date;
import java.text.SimpleDateFormat;


public  class SiakWriter extends FileWriter implements Serializable
{
  private String filename;
  private String classname;

public SiakWriter(String filename, String classname) throws Exception
  {
       super(filename, true);
       this.filename = filename;
       this.classname = classname;
  }

 public SiakWriter(String filename) throws Exception
    {
         super(filename, true);
         this.filename = filename;
    }

public void writeFile(Exception eobj)
  {
    if( new File(filename.trim()).exists() )
    {
      System.out.println("FILE IS EXISTED");
    }

    PrintWriter writer =new PrintWriter(this);

    SimpleDateFormat formatter = new SimpleDateFormat ();
    formatter.applyPattern("dd-MM-yyyy");
    Date currentDate = new Date();
    String dateString = formatter.format(currentDate);

    formatter.applyPattern("hh:mm:ss");
    Date currentTime = new Date();
    String timeString = formatter.format(currentTime);

      String header = "SIAK 2003 System Log Information";
      writer.println("\t\t\t\t\t\t"+header);
      String dash="";
      for(int i=0;i<header.length()+15;i++)
      {
        dash = dash+"_";
      }
      writer.println("\t\t\t\t\t"+dash);

    writer.println("");
    writer.println("Bean Name: "+classname.trim());
    writer.println("Date: "+dateString);
    writer.println("Time: "+timeString);
    writer.println("Error Message: ");
    eobj.printStackTrace(writer);

    writer.println("*****************************************************************************************************************************");
    if(writer!=null)
    {
      writer.flush();
      writer.close();
    }
  }

public void writeFile(String newkk,String newnik)
    {
        PrintWriter writer = new PrintWriter(this);
      try{
        SimpleDateFormat formatter = new SimpleDateFormat();
        formatter.applyPattern("dd-MM-yyyy");
        Date currentDate = new Date();
        String dateString = formatter.format(currentDate);
        formatter.applyPattern("hh:mm:ss");
        Date currentTime = new Date();
        String timeString = formatter.format(currentTime);
        writer.println(dateString  + "," + timeString + "," + newkk + "," + newnik);
      }catch(Exception err)
      {

      }
      finally{
        writer.close();
      }
    }

public void writeFile(Exception eobj,String jspname)
      {
           PrintWriter writer =new PrintWriter(this);
        try{
        SimpleDateFormat formatter = new SimpleDateFormat ();
        formatter.applyPattern("dd-MM-yyyy");
        Date currentDate = new Date();
        String dateString = formatter.format(currentDate);
        formatter.applyPattern("hh:mm:ss");
        Date currentTime = new Date();
        String timeString = formatter.format(currentTime);
        writer.println("JSP Name: "+jspname);
        writer.println("Date: "+dateString);
        writer.println("Time: "+timeString);
        writer.println("Error Message: ");
        eobj.printStackTrace(writer);
        writer.println("*****************************************************************************************************************************");
        }catch(Exception err)
        {


        }
        finally{
          writer.close();
        }
      }
}



