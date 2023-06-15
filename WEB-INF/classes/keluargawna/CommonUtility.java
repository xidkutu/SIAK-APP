package keluargawna;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class CommonUtility implements java.io.Serializable{

  public CommonUtility() {
  }

public static int getHbKel(String data)    //Function Moved from Bean Keluarga_WNA
        {
    java.util.Vector vt=new java.util.Vector();

    vt.addElement("Kepala Keluarga");
    vt.addElement("Suami");
    vt.addElement("Istri");
    vt.addElement("Anak");
    vt.addElement("Menantu");
    vt.addElement("Cucu");
    vt.addElement("OrangTua");
    vt.addElement("Mertua");
    vt.addElement("Famili Lain");
    vt.addElement("Pembantu");
    vt.addElement("Lainnya");

    vt.addElement("Kepala Keluarga/Head of Family");
    vt.addElement("Suami/Husband");
    vt.addElement("Istri/Wife");
    vt.addElement("Anak/Child");
    vt.addElement("Menantu/Child in Law");
    vt.addElement("Cucu/Grand Child");
    vt.addElement("OrangTua/Parent");
    vt.addElement("Mertua/Parent in Law");
    vt.addElement("Famili Lain/Relative");
    vt.addElement("Pembantu/Housemade");
    vt.addElement("Lain/Others");

  for(int i=0;i<=vt.size()-1;i++)
  {
    if (data.trim().equals(vt.elementAt(i).toString().trim()))
    {
                   if ((i+1)>11)
                   {
                     return ((i+1)-11);
                   }
                   else
                   {
                           return(i+1);
                   }

       }
  }
return (0);
 }
}