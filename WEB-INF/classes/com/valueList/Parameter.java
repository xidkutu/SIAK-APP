package com.valueList;

public class Parameter implements java.io.Serializable{
  public String NOPROP=null,NOKAB=null,NOKEC=null,NOKEL=null;
  public String NIK=null,NAMALGKP=null,FRMTGL=null,TOTGL=null,NOAKTA=null;
  public int ROWS=6;
  public String ACT_CODE=null;
  public String PFLAG=null,CFLAG=null;
  public String NO_KK=null;
  /*
   ACT_CODE
   *******
     BIOP4B
     BIOWNI
     BIOWNA
     KTPWNI
     KTPWNA
     KKWNI
     KKWNA
     AKTKLH
     AKTPKN
     AKTCRI
     AKTMTI
      */
 public String genConditionalSQL()
     {
       String sql="";
       if (NOPROP!=null)
       {
         sql=sql+" no_prop=" + NOPROP;
       }
       if (NOKAB!=null)
       {
         sql=sql+" and no_kab=" + NOKAB;
       }
       if (NOKEC!=null)
       {
         sql=sql+" and no_kec=" + NOKEC;
       }
       if (NOKEL!=null)
       {
         sql=sql+" and no_kel=" + NOKEL;
       }

       if (NO_KK!=null)
       {
         sql=sql+" and no_kk in(" + NO_KK + ")";
       }

       if (NIK!=null)
       {
         sql=sql+" and nik=" + NIK;
       }

       if (NAMALGKP!=null)
       {
         if (ACT_CODE.trim().equals("BIOP4B")
             ||
             ACT_CODE.trim().equals("BIOWNI")
             ||
             ACT_CODE.trim().equals("KTPWNI")
             ||
             ACT_CODE.trim().equals("KKWNI")
             ||
             ACT_CODE.trim().equals("AKTKLH")
             ||
             ACT_CODE.trim().equals("AKTPKN")
             ||
             ACT_CODE.trim().equals("AKTCRI")
             ||
             ACT_CODE.trim().equals("AKTMTI")
             )
         {
           try{
             String tmp = "";
             StringBuffer bfr = new StringBuffer(NAMALGKP.toUpperCase().trim());
             StringBuffer tmp_bfr = new StringBuffer(bfr.toString());
             for (int i = 0; i < bfr.length(); i++) {
               tmp = String.valueOf(bfr.charAt(i));
               if (tmp.equals("'")) {
                 tmp_bfr.insert(i + 1, "'");
               }
             }
             NAMALGKP=tmp_bfr.toString();
           }catch(Exception err)
           {

           }
           sql=sql+" and instr(upper(nama_lgkp),'" + NAMALGKP.toUpperCase().trim() + "')>0";
           //sql=sql+" and nama_lgkp like '" + NAMALGKP + "'%";
         }
         if (ACT_CODE.trim().equals("BIOWNA")
             ||
             ACT_CODE.trim().equals("KTPWNA")
             ||
             ACT_CODE.trim().equals("KKWNA")
             )
         {
           sql=sql+" and nama_pertma='" + NAMALGKP + "'";
         }
      }

       if ((FRMTGL!=null) && (TOTGL==null))
       {
         sql=sql+ " and to_date(tgl_entri) between '" + FRMTGL + "' and sysdate";
       }
       if ((FRMTGL==null) && (TOTGL!=null))
       {
         sql=sql+ " and to_date(tgl_entri)<='" + TOTGL + "'";
       }
       if ((FRMTGL!=null) && (TOTGL!=null))
       {
          sql=sql+ " and to_date(tgl_entri) between '" + FRMTGL + "' and '" + TOTGL + "'";
       }
       if (NOAKTA!=null)
       {
         if (ACT_CODE.trim().equals("AKTKLH"))
         sql=sql+ " and no_akta_lahir='" + NOAKTA.trim() + "'";
       if (ACT_CODE.trim().equals("AKTPKN"))
         sql=sql+ " and no_akta_kwn='" + NOAKTA.trim() + "'";
       if (ACT_CODE.trim().equals("AKTCRI"))
         sql=sql+ " and no_akta_crai='" + NOAKTA.trim() + "'";
       if (ACT_CODE.trim().equals("AKTMTI"))
         sql=sql+ " and no_akta_mati='" + NOAKTA.trim() + "'";
       }
       if (PFLAG!=null)
       {
         sql=sql + " and pflag='" + PFLAG + "'";
       }
       if (CFLAG!=null)
       {
         sql=sql + " and cflag='" + CFLAG + "'";
       }
       return sql;
     }
   }