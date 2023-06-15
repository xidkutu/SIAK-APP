package manage;

import org.apache.poi.poifs.filesystem.POIFSFileSystem;
/*import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell;*/
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.*;

import java.io.*;
import javax.ejb.*;
import java.sql.*;
import com.db.connection.*;
import oracle.jdbc.driver.*;
import siaktools.logwriter.SiakWriter;

import java.util.*;
import laporan.*;
import com.db.connection.ServiceController;
import pendaftaran.*;
import kartukeluarga.DataKelurahan;
import calonpemilih.*;
import com.siak.validate.*;

public class CetakXlsP4B {
  static Vector results=new Vector();
public CetakXlsP4B() {
  }
public static void main(String[] args) {
    System.out.println("Main Function");
    //for (int i=0;i<=3;i++) {
    //buatbuku(i,stProp, stKab, stKec, stKel, noProp, noKab, noKec, noKel);
     //}
    }
    public static void banyakxls(String stProp,String stKab,String stKec,String stKel,
                                    String noProp,String noKab, String noKec,String noKel) {
             //loop for create pdf
             int[] akhpdf={1,2,3,4};
             int tot_rec=0;
             System.out.println("Laporan P4B version XLS");
             System.out.println("Call The EJB");
             ServiceController factoryxls=null;
             NamaCalonPemilihHome homexls=null;
             NamaCalonPemilih remotexls=null;
             int tot_book=0;
             //String cobnoKel="1001";
             try {
                  factoryxls = ServiceController.getInstance();
                  homexls = (NamaCalonPemilihHome) factoryxls.lookup("NamaCalonPemilihBean",
                      NamaCalonPemilihHome.class);
                  remotexls = homexls.create();
                  /* noProp="11";
                                     noKab="74";
                                     noKec="03";
                                     noKel="1001"; */
                  System.out.println("cetak excel wilayah "+noProp+","+ noKab+","+ noKec+","+ noKel);
                  results = remotexls.getDataCalonPemilihFor(noProp, noKab, noKec, noKel);
                  if(results.isEmpty())
                    { //dosomething
                      System.out.println("data untuk wilayah ini kosong");
                    } else {
                      tot_rec=results.size();
                      //satu buku 400 record
                      System.out.println("Jumlah record: " + tot_rec);
                      tot_book = (int) Math.ceil( (double) tot_rec / 400);
                      System.out.println("Jumlah buku: " + tot_book);
                      //ada dua loop, satu loop buku
                      // loop record
                    for (int ibuku = 1; ibuku <= tot_book; ibuku++) {
                      System.out.println("buku ke-" + String.valueOf(ibuku));
                      System.out.println("buat buku -->"+ ibuku + "="+stProp+ "="+stKab+ "="+stKec+ "="+stKel);
                      System.out.println("buat buku -->"+noProp+ "="+noKab+ "="+noKec+ "="+noKel);

                      buatbuku(ibuku, stProp, stKab, stKec, stKel, noProp, noKab, noKec, noKel,tot_rec);

                    }


                    }

             } catch(Exception err) {
               err.printStackTrace();
             }
    }
public static void mainke(String[] args) {
    HSSFWorkbook wb = new HSSFWorkbook();
    HSSFSheet sheet = wb.createSheet("new sheet");
    HSSFRow row = sheet.createRow((short)2);
    row.createCell((short) 0).setCellValue(1.1);
    row.createCell((short) 1).setCellValue("07/09/06");
    row.createCell((short) 2).setCellValue("a string");
    row.createCell((short) 3).setCellValue(true);
    row.createCell((short) 4).setCellType(HSSFCell.CELL_TYPE_ERROR);

    // Write the output to a file
    try {
    FileOutputStream fileOut = new FileOutputStream("workbook.xls");
    wb.write(fileOut);
    fileOut.close();
    } catch (IOException ie) {

        }
    }
    public static void buatbuku(int bukuke,String stProp,String stKab,String stKec,String stKel,
                                 String noProp,String noKab, String noKec,String noKel,int tot_rec) {
  try {
  HSSFWorkbook wb = new HSSFWorkbook();
  //panggil buat halaman
  String tulisbuku = "C:\\bea\\logs\\DT"+noProp+noKab+noKec+noKel+"KE"+String.valueOf(bukuke)+".xls";
  halamanke(wb,bukuke,tot_rec);

  // Write the output to a file
    FileOutputStream fileOut = new FileOutputStream(tulisbuku);
    wb.write(fileOut);
    fileOut.close();
  } catch(Exception ed) {
    ed.printStackTrace();
  }
 }
public static void halamanke(HSSFWorkbook wb,int bukuke,int tot_rec){
   for (int hl=0; hl<=0;hl++) {
   HSSFSheet sheet = wb.createSheet("siakhal"+String.valueOf(hl));
   isidata(sheet,wb,bukuke,tot_rec);
   }
  }

public static void isidata(HSSFSheet sheet,HSSFWorkbook wb,int bukuke,int tot_rec) {
    headersatu(sheet,wb);
    headerdua(sheet,wb);
    headertiga(sheet,wb);
    headerempat(sheet,wb);
    gariskosong(sheet,wb);
    headerdata(sheet,wb);

    //loop for data   mulai dari ke 7
    //HSSFRow row = sheet.createRow((short)10);
    //row.createCell((short) 0).setCellValue("1.1");
    //loop untuk record
    int enddata=0,begindata=0;
    if (bukuke==1) {
      begindata=0;
      enddata=399;
    } else {
      begindata=(bukuke-1)*400;
      enddata=bukuke*400-1;
      if (tot_rec<=enddata) {
        enddata=tot_rec;
      }
    }
    System.out.println("record dari "+begindata+" ke "+enddata);
    for (int bariske=begindata;bariske<=enddata;bariske++) {
     //System.out.println("record dari "+bariske+" ke "+enddata);
     if (bariske<=tot_rec-1) {
       isidatadetail(sheet, wb, bariske, begindata);
     }
    }

  }
  public static void isidatadetail(HSSFSheet sheet,HSSFWorkbook wb,int bariske,int begindata) {
    int bariskejadi=0;
    bariskejadi = bariske-begindata+7;
    //-
    NamaCalonPemilihObject obj = (NamaCalonPemilihObject) results.elementAt(
                            bariske);

    HSSFRow row = sheet.createRow((short)bariskejadi);
    HSSFCell cell = row.createCell((short)0);
    cell.setCellValue(String.valueOf(bariske+1));
    HSSFCellStyle cellStyle = wb.createCellStyle();
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)1);
    cell.setCellValue(obj.getNik());
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)2);
    cell.setCellValue(obj.getNama_lgkp().toUpperCase());
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    String deAlamat = obj.getTmptgllhr().toString();
    deAlamat = deAlamat.replaceFirst("/", ",");
    cell = row.createCell((short)3);
    cell.setCellValue(deAlamat);
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)4);
    cell.setCellValue(obj.getUmur_usia().toUpperCase());
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)5);
    cell.setCellValue(obj.getNikah().toUpperCase());
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)6);
    if (obj.getKlmin_de().toUpperCase().equals("LK")) {
      cell.setCellValue("LK");
    } else {
      cell.setCellValue(" ");
    }
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)7);
    if (obj.getKlmin_de().toUpperCase().equals("PR")) {
      cell.setCellValue("PR");
    } else {
      cell.setCellValue(" ");
    }

    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)8);
    cell.setCellValue(obj.getAlamat().toUpperCase());
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //
    cell = row.createCell((short)9);
    cell.setCellValue(" ");
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    //cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
   }
  public static void headersatu(HSSFSheet sheet,HSSFWorkbook wb) {
    //baris
    HSSFRow row = sheet.createRow((short)0);
    //kolom
    HSSFCell cell = row.createCell((short)0);
    cell.setCellValue("DAFTAR PENDUDUK POTENSI PEMILIH PILKADA (DP4)");
    //font
    HSSFFont dfont = wb.createFont();
    dfont.setFontHeightInPoints((short)18);
    dfont.setFontName("Arial");
    dfont.setBoldweight((short)2);
    HSSFCellStyle cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    cellStyle.setFont(dfont);
    cell.setCellStyle(cellStyle);
    row.createCell((short) 1).setCellValue(" ");
    row.createCell((short) 2).setCellValue(" ");
    row.createCell((short) 3).setCellValue(" ");
    row.createCell((short) 4).setCellValue(" ");
    row.createCell((short) 5).setCellValue(" ");
    row.createCell((short) 6).setCellValue(" ");
    row.createCell((short) 7).setCellValue(" ");
    row.createCell((short) 8).setCellValue(" ");
    row.createCell((short) 9).setCellValue(" ");
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)1));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)2));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)3));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)4));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)5));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)6));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)7));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)8));
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)9));
    //HSSFCell
    cell = row.createCell((short)1);
    cell.setCellValue(" ");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    cell.setCellStyle(cellStyle);
    row.createCell((short) 1).setCellValue(" ");
    row.createCell((short) 2).setCellValue(" ");
    row.createCell((short) 3).setCellValue(" ");
    row.createCell((short) 4).setCellValue(" ");
    row.createCell((short) 5).setCellValue(" ");
    row.createCell((short) 6).setCellValue(" ");
    row.createCell((short) 7).setCellValue(" ");
    row.createCell((short) 8).setCellValue(" ");
    row.createCell((short) 9).setCellValue(" ");
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)1));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)2));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)3));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)4));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)5));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)6));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)7));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)8));
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)9));
  }
  public static void headerdua(HSSFSheet sheet,HSSFWorkbook wb) {
    //baris
    HSSFRow row = sheet.createRow((short)2);
    //kolom
    HSSFCell cell = row.createCell((short)0);
    cell.setCellValue(" ");
    HSSFCellStyle cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    cell.setCellStyle(cellStyle);
    row.createCell((short) 1).setCellValue("TPS ");
    row.createCell((short) 2).setCellValue(" ");
    row.createCell((short) 3).setCellValue(":  ");
    row.createCell((short) 4).setCellValue(" ");
    row.createCell((short) 5).setCellValue("PROVINSI ");
    row.createCell((short) 6).setCellValue(" ");
    row.createCell((short) 7).setCellValue(": JAWA BARAT ");
    row.createCell((short) 8).setCellValue(" ");
    row.createCell((short) 9).setCellValue(" ");
    sheet.addMergedRegion(new Region(2,(short)1,2,(short)2));
    sheet.addMergedRegion(new Region(2,(short)3,2,(short)4));
    sheet.addMergedRegion(new Region(2,(short)5,2,(short)6));
    sheet.addMergedRegion(new Region(2,(short)7,2,(short)8));

   }
   public static void headertiga(HSSFSheet sheet,HSSFWorkbook wb) {
    //baris
    HSSFRow row = sheet.createRow((short)3);
    //kolom
    HSSFCell cell = row.createCell((short)0);
    cell.setCellValue(" ");
    HSSFCellStyle cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    cell.setCellStyle(cellStyle);
    row.createCell((short) 1).setCellValue("DESA/KELURAHAN");
    row.createCell((short) 2).setCellValue(" ");
    row.createCell((short) 3).setCellValue(": JATIASIH");
    row.createCell((short) 4).setCellValue(" ");
    row.createCell((short) 5).setCellValue("KOTA");
    row.createCell((short) 6).setCellValue(" ");
    row.createCell((short) 7).setCellValue(": KOTA BEKASI");
    row.createCell((short) 8).setCellValue(" ");
    row.createCell((short) 9).setCellValue(" ");
    sheet.addMergedRegion(new Region(3,(short)1,3,(short)2));
    sheet.addMergedRegion(new Region(3,(short)3,3,(short)4));
    sheet.addMergedRegion(new Region(3,(short)5,3,(short)6));
    sheet.addMergedRegion(new Region(3,(short)7,3,(short)8));

   }
   public static void headerempat(HSSFSheet sheet,HSSFWorkbook wb) {
    //baris
    HSSFRow row = sheet.createRow((short)4);
    //kolom
    HSSFCell cell = row.createCell((short)0);
    cell.setCellValue(" ");
    HSSFCellStyle cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    cell.setCellStyle(cellStyle);
    row.createCell((short) 1).setCellValue("KECAMATAN");
    row.createCell((short) 2).setCellValue(" ");
    row.createCell((short) 3).setCellValue(": JATIASIH");
    row.createCell((short) 4).setCellValue(" ");
    row.createCell((short) 5).setCellValue(" ");
    row.createCell((short) 6).setCellValue(" ");
    row.createCell((short) 7).setCellValue(" ");
    row.createCell((short) 8).setCellValue(" ");
    row.createCell((short) 9).setCellValue(" ");
    sheet.addMergedRegion(new Region(4,(short)1,4,(short)2));
    sheet.addMergedRegion(new Region(4,(short)3,4,(short)4));
    sheet.addMergedRegion(new Region(4,(short)5,4,(short)6));
    sheet.addMergedRegion(new Region(4,(short)7,4,(short)8));

   }
   public static void gariskosong(HSSFSheet sheet,HSSFWorkbook wb) {
    HSSFRow row = sheet.createRow((short)5);
    HSSFCell cell = row.createCell((short)0);
    cell.setCellValue(" ");
    HSSFCellStyle cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    cell.setCellStyle(cellStyle);
    row.createCell((short) 1).setCellValue(" ");
    row.createCell((short) 2).setCellValue(" ");
    row.createCell((short) 3).setCellValue(" ");
    row.createCell((short) 4).setCellValue(" ");
    row.createCell((short) 5).setCellValue(" ");
    row.createCell((short) 6).setCellValue(" ");
    row.createCell((short) 7).setCellValue(" ");
    row.createCell((short) 8).setCellValue(" ");
    row.createCell((short) 9).setCellValue(" ");
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)1));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)2));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)3));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)4));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)5));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)6));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)7));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)8));
    sheet.addMergedRegion(new Region(5,(short)0,5,(short)9));

   }
   public static void setpinggir(HSSFCellStyle cellStyle) {
    cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    cellStyle.setBottomBorderColor(HSSFColor.BLACK.index);
    cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    cellStyle.setLeftBorderColor(HSSFColor.BLACK.index);
    cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
    cellStyle.setRightBorderColor(HSSFColor.BLACK.index);
    cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
    cellStyle.setTopBorderColor(HSSFColor.BLACK.index);
   }
   public static void headerdata(HSSFSheet sheet,HSSFWorkbook wb) {
    HSSFRow row = sheet.createRow((short)6);
    HSSFCell cell = row.createCell((short)0);
    cell.setCellValue("No.");
    HSSFCellStyle cellStyle = wb.createCellStyle();
    //cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    sheet.setColumnWidth( (short) 0, (short) (1300 ) );
    //row.createCell((short) 1).setCellValue("NIK");
    cell = row.createCell((short)1);
    cell.setCellValue("NIK");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 2).setCellValue("Nama Pemilih");
    cell = row.createCell((short)2);
    cell.setCellValue("Nama Pemilih");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 2).setCellValue("Nama Pemilih");
    //row.createCell((short) 3).setCellValue(" Tempat dan Tanggal \n      Lahir ");
    //HSSFCell
    cell = row.createCell((short)3);
    cell.setCellValue(" Tempat dan Tanggal \n     Lahir");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 4).setCellValue(" Umur/Usia");
    cell = row.createCell((short)4);
    cell.setCellValue(" Umur/Usia");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 5).setCellValue("Status Perkawinan \n (B/S/P)");
    cell = row.createCell((short)5);
    cell.setCellValue("  Status \n Perkawinan \n   (B/S/P)");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 6).setCellValue(" Jenis \nKelamin \n LK | PR ");
    cell = row.createCell((short)6);
    cell.setCellValue(" Jenis \nKelamin \n LK | PR");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 7).setCellValue(" ");
    cell = row.createCell((short)7);
    cell.setCellValue(" ");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 8).setCellValue("   Alamat/Tempat \n     Tinggal");
    cell = row.createCell((short)8);
    cell.setCellValue("  Alamat/Tempat \n     Tinggal");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //row.createCell((short) 9).setCellValue("Keterangan");
    cell = row.createCell((short)9);
    cell.setCellValue("Keterangan");
    //HSSFCellStyle
    cellStyle = wb.createCellStyle();
    cellStyle.setWrapText(true);
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
    setpinggir(cellStyle);
    cell.setCellStyle(cellStyle);
    //-
    sheet.addMergedRegion(new Region(6,(short)6,6,(short)7));
    sheet.setColumnWidth( (short) 1, (short) (800*5.5 ) );
    sheet.setColumnWidth( (short) 2, (short) (800*7 ) );
    sheet.setColumnWidth( (short) 3, (short) (800*6 ) );
    sheet.setColumnWidth( (short) 4, (short) (800*4 ) );
    sheet.setColumnWidth( (short) 5, (short) (800*4 ) );
    sheet.setColumnWidth( (short) 6, (short) (1000 ) );
    sheet.setColumnWidth( (short) 7, (short) (1000 ) );
    sheet.setColumnWidth( (short) 8, (short) (800*11 ) );
    sheet.setColumnWidth( (short) 9, (short) (800*4 ) );

   }
}
