package com.Info;

public abstract class Acknowledge implements java.io.Serializable{
   private String error=null;

   public void setAcknowldge(String err_flag)
   {
       error=err_flag;
   }
   public String getAcknowldge()
    {
      return error;
    }
}