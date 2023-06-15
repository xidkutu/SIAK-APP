package com.valueList;
import java.util.*;
import com.db.connection.*;
import com.P4B.P4BList;
import com.P4B.P4BListHome;
import com.list.*;

public class ListDelegate implements java.io.Serializable
{
  static P4BList  p4bremote=null;
  static P4BListHome p4bhome=null;
  static BioWNIList  biowniremote=null;
  static BioWNIListHome biownihome=null;
  public String TOTAL_CNT="0";
  public Parameter prm_tmp=null;

  public ListDelegate(String ocrflg,Parameter prm)
  {
    if ((ocrflg!=null)
        && ocrflg.trim().equals("EXEC"))
    {
      executeSearch(prm);
      prm_tmp=prm;
    }
  }

  public  void executeSearch(Parameter prm)
  {
    try
    {
      if (prm.ACT_CODE.equals("BIOP4B"))
      {
        p4bremote=(P4BList)getNewRemotes(prm.ACT_CODE);
        TOTAL_CNT=p4bremote.executeSelect(prm);
      }

      if (prm.ACT_CODE.equals("BIOWNI"))
      {
        biowniremote=(BioWNIList)getNewRemotes(prm.ACT_CODE);
        TOTAL_CNT=biowniremote.executeSelect(prm);
      }

    }catch(Exception e)
    {
      e.printStackTrace();
    }
  }

  public Collection getClientList(){
    Collection lst=null;
    try{
      if (prm_tmp.ACT_CODE.equals("BIOP4B"))
      {
        if (p4bremote!=null)
          lst=p4bremote.getList();
          System.out.println("LIST SIZE=" + lst.size());
        }

        if (prm_tmp.ACT_CODE.equals("BIOWNI"))
        {
          if (biowniremote!=null)
            lst=biowniremote.getList();
          System.out.println("LIST SIZE=" + lst.size());
        }
}catch(Exception erp)
    {
      return null;
    }
    return lst;
 }

 public int getListSize()
 {
   int size=0;
   try{
     if (prm_tmp.ACT_CODE.equals("BIOP4B"))
     {
       if (p4bremote!=null)
         size=p4bremote.getSize();
     }
     if (prm_tmp.ACT_CODE.equals("BIOWNI"))
     {
       if (biowniremote!=null)
         size=biowniremote.getSize();
     }
   }catch(Exception erp1)
   {
     size=0;
   }
   return size;
 }

 public Object getListCurrentElement()
 {
   Object obj=null;
   try{
     if (prm_tmp.ACT_CODE.equals("BIOP4B"))
     {
       if (p4bremote != null)
         obj = p4bremote.getCurrentElement();
     }
     if (prm_tmp.ACT_CODE.equals("BIOWNI"))
     {
       if (biowniremote != null)
         obj = biowniremote.getCurrentElement();
     }

   }catch(Exception erp2)
   {
     obj=null;
   }
return obj;
 }

 public  List getListPreviousElements(int count)
  {
    List lst=null;

    try{
      if (prm_tmp.ACT_CODE.equals("BIOP4B"))
      {
        if (p4bremote!=null)
        {
          lst = p4bremote.getPreviousElements(count);
        }
      }
      if (prm_tmp.ACT_CODE.equals("BIOWNI"))
      {
        if (biowniremote!=null)
        {
          lst=biowniremote.getPreviousElements(count);
        }
      }

    }catch(Exception erp3)
    {
      lst=null;
    }
    return lst;
  }
  public  List getListNextElements(int count)
  {
    List lst=null;
    try{
      if (prm_tmp.ACT_CODE.equals("BIOP4B"))
      {
        if (p4bremote!=null)
        {
          lst=p4bremote.getNextElements(count);
        }
        if (lst.size()==0)
        {
          p4bremote.executeSelectPaging(prm_tmp);
          lst=p4bremote.getNextElements(count);
          }
        }
      if (prm_tmp.ACT_CODE.equals("BIOWNI"))
      {
        if (biowniremote!=null)
        {
          lst=biowniremote.getNextElements(count);
        }
        if (lst.size()==0)
        {
          biowniremote.executeSelectPaging(prm_tmp);
          lst=biowniremote.getNextElements(count);
        }
      }


    }catch(Exception erp4)
    {
      lst=null;
    }
    return lst;
  }

  public  void resetListIndex()
  {
    try
     {
       if (prm_tmp.ACT_CODE.equals("BIOP4B"))
       {
         if (p4bremote!=null)
         {
           p4bremote.resetIndex();
         }
       }
       if (prm_tmp.ACT_CODE.equals("BIOWNI"))
       {
         if (biowniremote!=null)
         {
           biowniremote.resetIndex();
         }
       }
     }catch(Exception erp4)
     {

     }
   }
   public  boolean releaseMem()
   {
     boolean flag=false;
     try{
       if (prm_tmp.ACT_CODE.equals("BIOP4B"))
       {
         p4bremote.remove();
         System.gc();
         flag = true;
       }
       if (prm_tmp.ACT_CODE.equals("BIOWNI"))
       {
         biowniremote.remove();
         System.gc();
         flag = true;
      }

    }catch(Exception rmp)
     {
       flag=false;
     }
     return flag;
   }
   public boolean updatePrintStatus(Vector vt_niks)
   {
     boolean recs=false;
     try{
       if (prm_tmp.ACT_CODE.equals("BIOP4B"))
        {
          if (p4bremote!=null)
          {
            if ((p4bremote.updatePrintStatusP4B(vt_niks)).length>0)
            {
              recs=true;
            }
          }
        }
        if (prm_tmp.ACT_CODE.equals("BIOWNI"))
        {
          if (biowniremote!=null)
          {
            if ((biowniremote.updatePrintStatusBio(vt_niks)).length>0)
            {
              recs=true;
            }
          }
        }
      }catch(Exception erp4)
      {
        recs=false;
      }
      return recs;
    }

    private  Object getNewRemotes(String ACT_CODE)
    {
      ServiceController factory=null;
      P4BList  p4brm=null;
      P4BListHome p4bhm=null;
      BioWNIList  biownirm=null;
      BioWNIListHome biownihm=null;

      Object obj_tmp=null;
      if (ACT_CODE.equals("BIOP4B"))
      {
        try{
          factory=ServiceController.getInstance();
          p4bhm=(P4BListHome)factory.lookup("P4BList",P4BListHome.class);
          p4brm=p4bhm.create();
          obj_tmp=p4brm;
        }catch(Exception lp1)
        {
          obj_tmp=null;
        }
      }

      if (ACT_CODE.equals("BIOWNI"))
      {
        try{
          factory=ServiceController.getInstance();
          biownihm=(BioWNIListHome)factory.lookup("BioWNIList",BioWNIListHome.class);
          biownirm=biownihm.create();
          obj_tmp=biownirm;
        }catch(Exception lp2)
        {
          obj_tmp=null;
        }
      }

      return obj_tmp;
    }
  }
