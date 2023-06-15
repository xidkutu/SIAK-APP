package siaktools.logwriter;

import java.io.FileReader;
import java.io.Serializable;
import java.io.BufferedReader;
import java.util.*;

public class PropertyReader implements Serializable{
  String jsp_path = null, bean_path = null;
String prop_path;

    public PropertyReader()
    {
       readall();
    }

private String getpropPath()
    {
      try {
        String os = System.getProperty("os.name");
        System.out.println("OS NAME: "+os);
        if (os.trim().equals("Windows 2000"))
          prop_path = "c:\\bea\\logs\\siakinit\\siaklog.properties";
        else
          prop_path = "/usr/local/bea/logs/siakinit/siaklog.properties";
      }catch(Exception perr)
      {
        System.out.println("perr: "+perr.toString());
        prop_path="invalid";
      }
      return(prop_path);
   }

  private void readall()
  {
    String line = "";
try{
      System.out.println("READALL 1 first");
      SiakBuffer reader=new SiakBuffer(new SiakFileReader(getpropPath()));
//      BufferedReader reader = new BufferedReader(new FileReader(getpropPath()));
      line=reader.readLine();
      jsp_path = line.trim().substring("JSP_PATH=".length(),line.length());
      line=reader.readLine();
       bean_path=line.trim().substring("BEAN_PATH=".length(),line.length());
   }catch(Exception err)
    {
      System.out.println("err: "+err.toString() );
      jsp_path="invalid";
      bean_path="invalid";
    }
}

     public  String readJspPath()
    {
       return(jsp_path);
    }
    public  String readBeanPath()
   {
      return(bean_path);
   }

  }