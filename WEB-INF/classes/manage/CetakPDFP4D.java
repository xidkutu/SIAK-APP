package manage;
/*
 * $Id: MyFirstTable.java,v 1.4 2005/05/09 11:52:47 blowagie Exp $
 * $Name:  $
 *
 * This code is part of the 'iText Tutorial'.
 * You can find the complete tutorial at the following address:
 * http://itextdocs.lowagie.com/tutorial/
 *
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * itext-questions@lists.sourceforge.net
 */
//package com.lowagie.examples.objects.tables;

import java.awt.Color;
import java.io.FileOutputStream;
import java.io.IOException;

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

/* import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter; */

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

/**
 * A very simple PdfPTable example.
 */
public class CetakPDFP4D {

        /**
         * A very simple PdfPTable example.
         *
         * @param args
         *            no arguments needed
         */
        String datret="CetakPDFP4D";
        static Vector results=new Vector();

        public CetakPDFP4D() {

        }

        public static void cetak(String stProp,String stKab,String stKec,String stKel,
                                 String noProp,String noKab, String noKec,String noKel) {

                System.out.println("Laporan P4B");
                System.out.println("Call The EJB");
                ServiceController factory=null;
                NamaCalonPemilihHome home=null;
                NamaCalonPemilih remote=null;
                Vector results=new Vector();
                //String stProp=null,stKab=null,stKec=null,stKel=null;
                //String noProp=null,noKab=null,noKec=null,noKel=null;
                int tot_rec=0,sno=0,start=0,end=0,tot_page=0,index=0;
                String nilaiData=null;
                String filetuj="";
                if (stKel==null) {
                  System.out.println("data kelurahan kosong");
                } else {
                try {
                  factory = ServiceController.getInstance();
                  home = (NamaCalonPemilihHome) factory.lookup("NamaCalonPemilihBean", NamaCalonPemilihHome.class);
                  remote = home.create();
                  /* noProp="11";
                  noKab="74";
                  noKec="03";
                  noKel="1001"; */
                  filetuj = "C:\\bea\\logs\\siak"+noProp+noKab+noKec+noKel+".pdf";
                  results = remote.getDataCalonPemilihFor(noProp, noKab, noKec, noKel);
                  /*
                  stProp = "NANGGROE ACEH DARUSSALAM";
                  stKab = "KOTA LANGSA";
                  stKec = "LANGSA KOTA";
                  stKel = "GAMPONG TEUNGOH"; */
                  //contoh header

                  // step 1: creation of a document-object
                  //Document document = new Document();
                  //kiri, kanan, g, g
                  //Document document = new Document(PageSize.A4.rotate(), 50, 50, 50, 50);
                  //Document document = new Document(PageSize.A4.rotate(), 0, 0, 50, 50);
                  System.out.println("Buat PDF");
                  Document document = new Document(PageSize.A4.rotate(), 0, 0, 50, 50);

                  try {
                    // step 2:
                    // we create a writer that listens to the document
                    // and directs a PDF-stream to a file
                    PdfWriter writer = PdfWriter.getInstance(document,
                                                             new FileOutputStream(filetuj));

                    // step 3: we open the document
                    //looping banyaknya halaman
                    Font fonts = new Font(Font.COURIER, 14, Font.BOLD);
                    //check howmany data

                    if(results.isEmpty())
                    { //dosomething
                      System.out.println("data untuk wilayah ini kosong");
                    } else {
                      tot_rec=results.size();
                      sno = 1;
                      start = 0;
                      end = 10;
                      tot_page = (int) Math.ceil( (double) tot_rec / 10);

                      if (end > tot_rec)
                        end = tot_rec;
                    }

                    for(int cntr=1;cntr<=tot_page;cntr++) {
                    if (cntr==1 ) {
                      System.out.println("Hal 1");
                     document.open();
                    } else {
                     System.out.println("Hal berikutnya ...");
                     document.newPage();
                    }
                    System.out.println("cntr "+cntr);
                    System.out.println("tot_page "+tot_page);
                    System.out.println("isi data ...");
                    PdfPTable table1 = new PdfPTable(1);
                    PdfPCell cell1 = new PdfPCell(new Paragraph("  "));
                    cell1.setColspan(1);
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(
                        "DAFTAR PENDUDUK POTENSI PEMILIH PILKADA (DP4)", fonts));
                    cell1.setColspan(1);
                    cell1.setBorderColor(new Color(255, 255, 255));
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table1.addCell(cell1);
                    table1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell1 = new PdfPCell(new Paragraph("  "));
                    cell1.setColspan(1);
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    table1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    //table1.setTotalWidth(900);
                    table1.setWidthPercentage(95);
                    document.add(table1);
                    //---header kedua, 8 colom , 3 baris
                    float[] widths = {
                        0.05f, 0.21f, 0.03f, 0.21f, 0.21f, 0.03f, 0.21f, 0.05f};
                    table1 = new PdfPTable(widths);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("TPS"));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(": "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("PROVINSI"));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(": "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(stProp));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    //--
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("DESA/KELURAHAN"));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(": "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(stKel));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("KOTA"));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(": "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(stKab));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    //--
                    //--
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("KECAMATAN"));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(": "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(stKec));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph(" "));
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    //--
                    cell1 = new PdfPCell(new Paragraph("  "));
                    cell1.setColspan(8);
                    cell1.setBorderColor(new Color(255, 255, 255));
                    table1.addCell(cell1);
                    document.add(table1);
                    //--
                    float[] widths2 = {
                        0.04f, 0.1f, 0.1f, 0.15f, 0.1f, 0.1f, 0.1f, 0.16f, 0.15f};
                    PdfPTable table2 = new PdfPTable(widths2);
                    table2.addCell("NO.");
                    table2.addCell("NIK");
                    table2.addCell("Nama Pemilih");
                    cell1 = new PdfPCell(new Paragraph("Tempat dan Tanggal Lahir"));
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table2.addCell(cell1);
                    //table2.addCell("Tempat dan Tanggal Lahir");
                    cell1 = new PdfPCell(new Paragraph("Umur/Usia"));
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table2.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("Status Perkawinan (B/S/P)"));
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table2.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("Jenis Kelamin LK | PR"));
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table2.addCell(cell1);
                    cell1 = new PdfPCell(new Paragraph("Alamat/Tempat Tinggal"));
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table2.addCell(cell1);
                    table2.addCell("Keterangan");
                    table2.setWidthPercentage(95);
                    document.add(table2);
                    //--
                    PdfPTable table;
                    //for (int k = 1; k < 11; ++k) {
                    String deAlamat="";
                    for(index=start;index<end;index++)
                    {   NamaCalonPemilihObject obj = (NamaCalonPemilihObject)results.elementAt(index);

                      table = new PdfPTable(widths2);
                      table.addCell(String.valueOf(sno));
                      table.addCell(obj.getNik());
                      table.addCell(obj.getNama_lgkp().toUpperCase());
                      deAlamat=obj.getTmptgllhr().toString();
                      deAlamat=deAlamat.replaceFirst("/",",");
                      table.addCell(deAlamat);
                      /* cell1 = new PdfPCell(new Paragraph("30"));
                           cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                               table.addCell(cell1);
                                               cell1 = new PdfPCell(new Paragraph("B"));
                           cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                               table.addCell(cell1);
                                               cell1 = new PdfPCell(new Paragraph("LK"));
                           cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                               table.addCell("JL. Matahari No.1 "); */
                      //table.addCell(" ");
                      nilaiData = obj.getUmur_usia().toUpperCase();
                      cell1 = new PdfPCell(new Paragraph(nilaiData));
                      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                      table.addCell(cell1);
                      cell1 = new PdfPCell(new Paragraph(obj.getNikah().toUpperCase()));
                      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                      table.addCell(cell1);
                      //table.addCell(" ");
                      cell1 = new PdfPCell(new Paragraph(obj.getKlmin_de().toUpperCase()));
                      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                      table.addCell(cell1);
                      //table.addCell("LK");
                      cell1 = new PdfPCell(new Paragraph(obj.getAlamat().toUpperCase()));
                      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                      table.addCell(cell1);
                      //table.addCell(" ");
                      table.addCell(" ");
                      table.setTotalWidth(800);
                      table.setWidthPercentage(95);
                      document.add(table);
                      //--

                      sno++;
                     } //--akhir looping isi halaman
                     start=index;
                     if (start>=tot_rec) start=tot_rec;
                     end=end+10;
                     if (end>tot_rec) end=tot_rec;
                     //akhir catatan
                     if (cntr==tot_page) {
                        System.out.println("cetak catatan");
                        document.newPage();
                        table1 = new PdfPTable(1);
                        cell1 = new PdfPCell(new Paragraph("  "));
                        cell1.setColspan(1);
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(
                            "DAFTAR PENDUDUK POTENSI PEMILIH PILKADA (DP4)", fonts));
                        cell1.setColspan(1);
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table1.addCell(cell1);
                        table1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        cell1 = new PdfPCell(new Paragraph("  "));
                        cell1.setColspan(1);
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        table1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        //table1.setTotalWidth(900);
                        table1.setWidthPercentage(95);
                        document.add(table1);
                        //--header2
                        //---header kedua, 8 colom , 3 baris
                        float[] widthsct = {
                        0.05f, 0.21f, 0.03f, 0.21f, 0.21f, 0.03f, 0.21f, 0.05f};
                        table1 = new PdfPTable(widthsct);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph("TPS"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(": "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph("PROVINSI"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(": "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(stProp));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        //--
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph("DESA/KELURAHAN"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(": "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(stKel));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph("KOTA"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(": "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(stKab));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        //--
                        //--
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph("KECAMATAN"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(": "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(stKec));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        //--
                        cell1 = new PdfPCell(new Paragraph("  "));
                        cell1.setColspan(8);
                        cell1.setBorderColor(new Color(255, 255, 255));
                        table1.addCell(cell1);
                        document.add(table1);

                        //---
                        table1 = new PdfPTable(1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" ");
                        cell1 = new PdfPCell(new Paragraph(" Catatan :"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" Catatan :");
                        cell1 = new PdfPCell(new Paragraph(" Status Perkawinan :"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" Status Perkawinan :");
                        cell1 = new PdfPCell(new Paragraph(" B = Belum Menikah"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" B = Belum Menikah");
                        cell1 = new PdfPCell(new Paragraph(" S = Sudah Menikah"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" S = Sudah Menikah");
                        cell1 = new PdfPCell(new Paragraph(" P = Pernah Menikah"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" P = Pernah Menikah");
                        cell1 = new PdfPCell(new Paragraph(" "));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" ");
                        cell1 = new PdfPCell(new Paragraph("Jenis Kelamin"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell("Jenis Kelamin");
                        cell1 = new PdfPCell(new Paragraph(" Lk = Laki-laki"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" Lk = Laki-laki");
                        cell1 = new PdfPCell(new Paragraph(" Pr = Perempuan"));
                        cell1.setBorderColor(new Color(255, 255, 255));
                        cell1.setColspan(1);
                        table1.addCell(cell1);
                        //table.addCell(" Pr = Perempuan");
                        table1.setTotalWidth(800);
                        table1.setWidthPercentage(95);
                        document.add(table1);

                      }

                    } //looping per hal
                    //

                  }
                  catch (DocumentException de) {
                    System.err.println(de.getMessage());
                  }
                  catch (IOException ioe) {
                    System.err.println(ioe.getMessage());
                  }

                  // step 5: we close the document
                  document.close();
         } //ejb
         catch(Exception err) {
           err.printStackTrace();
         }
        }//kelurahan tdk null
        }
        public static void banyakpdf(String stProp,String stKab,String stKec,String stKel,
                                 String noProp,String noKab, String noKec,String noKel) {
          //loop for create pdf
          int[] akhpdf={1,2,3,4};
          int tot_buku=0;
          int tot_rec=0;
          System.out.println("Laporan P4B");
          System.out.println("Call The EJB");
          ServiceController factory=null;
          NamaCalonPemilihHome home=null;
          NamaCalonPemilih remote=null;
          String cobnoKel="1001";
          //Vector results=new Vector();
          try {
            if (ValidateLicense.validateLicense("C:\\bea\\logs\\siaklogre\\" +
                                                "siak.lic")) {
              /*satu buku 200 hal, 1 hal 10 data, data perbuku 2000
               jika datajum=3000
               jumbuku=bulat(3000/2000)=2
               looping 2 kali
               */
              if (stKel == null) {
                System.out.println("data kelurahan kosong");
              }
              else {
                //dapatkan data
                try {
                  factory = ServiceController.getInstance();
                  home = (NamaCalonPemilihHome) factory.lookup("NamaCalonPemilihBean",
                      NamaCalonPemilihHome.class);
                  remote = home.create();
                  /* noProp="11";
                                     noKab="74";
                                     noKec="03";
                                     noKel="1001"; */

                  results = remote.getDataCalonPemilihFor(noProp, noKab, noKec, noKel);
                  //results = remote.getDataCalonPemilihFor(noProp, noKab, noKec, cobnoKel);

                  if (results.isEmpty()) { //dosomething
                    System.out.println("data untuk wilayah ini kosong");

                  }
                  else {

                    tot_rec = results.size();
                    System.out.println("Jumlah data: " + tot_rec);
                    tot_buku = (int) Math.ceil( (double) tot_rec / 2000);
                    //tot_buku = 1;
                    System.out.println("Jumlah buku: " + tot_buku);
                    for (int ibuku = 1; ibuku <= tot_buku; ibuku++) {
                      System.out.println("buku ke-" + String.valueOf(ibuku));
                      System.out.println("buat buku -->"+ ibuku + "="+stProp+ "="+stKab+ "="+stKec+ "="+stKel);
                      System.out.println("buat buku -->"+noProp+ "="+noKab+ "="+noKec+ "="+noKel);
                      Document document = createbukupdf(ibuku, stProp, stKab, stKec, stKel, noProp, noKab, noKec, noKel);
                      //Document document = createbukupdf(ibuku, stProp, stKab, stKec, stKel, noProp, noKab, noKec, cobnoKel);
                      //kemudian isi cobnoKel
                      //isidatatable(document, ibuku, tot_rec, tot_buku, stProp,  stKab, stKec, stKel);
                      isidatatable(document, ibuku, tot_rec, tot_buku, stProp,  stKab, stKec, stKel);
                      document.close();
                    }
                  }

                } //ejb
                catch (Exception err) {
                  err.printStackTrace();
                }

              } //else skel
            }
            else {
              System.out.println("-------------------No License--------------------");
            }
          } catch(Exception eer) {
            eer.printStackTrace();
          }
        }
        public static void tunggalpdf(String stProp,String stKab,String stKec,String stKel,
                                 String noProp,String noKab, String noKec,String noKel) {
          //loop for create pdf
          int[] akhpdf={1,2,3,4};
          int tot_buku=0;
          int tot_rec=0;
          System.out.println("Laporan P4B");
          System.out.println("Call The EJB");
          ServiceController factory=null;
          NamaCalonPemilihHome home=null;
          NamaCalonPemilih remote=null;
          String cobnoKel="1001";
          //Vector results=new Vector();
          try {
            if (ValidateLicense.validateLicense("C:\\bea\\logs\\siaklogre\\" +
                                                "siak.lic")) {
              /*satu buku 200 hal, 1 hal 10 data, data perbuku 2000
               jika datajum=3000
               jumbuku=bulat(3000/2000)=2
               looping 2 kali
               */
              if (stKel == null) {
                System.out.println("data kelurahan kosong");
              }
              else {
                //dapatkan data
                try {
                  factory = ServiceController.getInstance();
                  home = (NamaCalonPemilihHome) factory.lookup("NamaCalonPemilihBean",
                      NamaCalonPemilihHome.class);
                  remote = home.create();
                  /* noProp="11";
                                     noKab="74";
                                     noKec="03";
                                     noKel="1001"; */

                  results = remote.getDataCalonPemilihFor(noProp, noKab, noKec, noKel);
                  //results = remote.getDataCalonPemilihFor(noProp, noKab, noKec, cobnoKel);

                  if (results.isEmpty()) { //dosomething
                    System.out.println("data untuk wilayah ini kosong");

                  }
                  else {

                    tot_rec = results.size();
                    System.out.println("Jumlah data: " + tot_rec);
                    //tot_buku = (int) Math.ceil( (double) tot_rec / 2000);
                    tot_buku = 1;
                    System.out.println("Jumlah buku: " + tot_buku);
                    for (int ibuku = 1; ibuku <= tot_buku; ibuku++) {
                      System.out.println("buku ke-" + String.valueOf(ibuku));
                      System.out.println("buat buku -->"+ ibuku + "="+stProp+ "="+stKab+ "="+stKec+ "="+stKel);
                      System.out.println("buat buku -->"+noProp+ "="+noKab+ "="+noKec+ "="+noKel);
                      Document document = createbukupdf(ibuku, stProp, stKab, stKec, stKel, noProp, noKab, noKec, noKel);
                      //Document document = createbukupdf(ibuku, stProp, stKab, stKec, stKel, noProp, noKab, noKec, cobnoKel);
                      //kemudian isi cobnoKel
                      //isidatatable(document, ibuku, tot_rec, tot_buku, stProp,  stKab, stKec, stKel);
                      isidatatablesatu(document, ibuku, tot_rec, tot_buku, stProp,  stKab, stKec, stKel);
                      document.close();
                    }
                  }

                } //ejb
                catch (Exception err) {
                  err.printStackTrace();
                }

              } //else skel
            }
            else {
              System.out.println("-------------------No License--------------------");
            }
          } catch(Exception eer) {
            eer.printStackTrace();
          }
        }

        public static Document createbukupdf(int bukuke,String stProp,String stKab,String stKec,String stKel,
                                 String noProp,String noKab, String noKec,String noKel) {
          System.out.println("Buat PDF");
          Document document = new Document(PageSize.A4.rotate(), 0, 0, 50, 50);
          String filetuj = "C:\\bea\\logs\\siak"+noProp+noKab+noKec+noKel+
              "ke"+String.valueOf(bukuke)+".pdf";
          //String filetuj="c:\\datake"+String.valueOf(bukuke)+".pdf";
          try {
                    // step 2:
                    // we create a writer that listens to the document
                    // and directs a PDF-stream to a file
                    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filetuj));
                    /*looping banyaknya halaman [3a]
                     jika hal 1, tdk perlu new page
                     200 hal kali 10 data brt 2.000 data
                        */
                    document.open();
                    //langkah 3 buat header
                    buatheader(document,stProp,stKab,stKec,stKel);
                    judulKolom(document);
                    //looping banyaknya data [3b], 10 data perhalaman

                    // --[3b]
                    // --[3a]
                    //LANGKAH 4 TUTUP DOC
                    //document.close();

                  }
                  catch (DocumentException de) {
                    System.err.println(de.getMessage());
                  }
                  catch (IOException ioe) {
                    System.err.println(ioe.getMessage());
                  }
            return document;
        }
        public static void buatheader(Document document,String stProp,
          String stKab,String stKec,String stKel) {
          //==
          Font fonts = new Font(Font.COURIER, 14, Font.BOLD);
          try {
            PdfPTable table1 = new PdfPTable(1);
            PdfPCell cell1 = new PdfPCell(new Paragraph("  "));
            cell1.setColspan(1);
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(
                "DAFTAR PENDUDUK POTENSI PEMILIH PILKADA (DP4)", fonts));
            cell1.setColspan(1);
            cell1.setBorderColor(new Color(255, 255, 255));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table1.addCell(cell1);
            table1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell1 = new PdfPCell(new Paragraph("  "));
            cell1.setColspan(1);
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            table1.setHorizontalAlignment(Element.ALIGN_CENTER);
            //table1.setTotalWidth(900);
            table1.setWidthPercentage(95);
            document.add(table1);
            //---header kedua, 8 colom , 3 baris
            float[] widths = {
                0.05f, 0.21f, 0.03f, 0.21f, 0.21f, 0.03f, 0.21f, 0.05f};
            table1 = new PdfPTable(widths);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("TPS"));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(": "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("PROVINSI"));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(": "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(stProp));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            //--
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("DESA/KELURAHAN"));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(": "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(stKel));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("KOTA"));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(": "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(stKab));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            //--
            //--
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("KECAMATAN"));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(": "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(stKec));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(" "));
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            //--
            cell1 = new PdfPCell(new Paragraph("  "));
            cell1.setColspan(8);
            cell1.setBorderColor(new Color(255, 255, 255));
            table1.addCell(cell1);
            document.add(table1);
          }
                  catch (DocumentException de) {
                    System.err.println(de.getMessage());
                  }



        }
        public static void judulKolom(Document document) {
          //--
          try {
            float[] widths2 = {
                0.04f, 0.15f, 0.15f, 0.15f, 0.09f, 0.09f, 0.04f, 0.04f, 0.15f, 0.1f};
            PdfPTable table2 = new PdfPTable(widths2);
            table2.addCell("NO.");
            table2.addCell("NIK");
            table2.addCell("Nama Pemilih");
            PdfPCell cell1 = new PdfPCell(new Paragraph("Tempat dan Tanggal Lahir"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table2.addCell(cell1);
            //table2.addCell("Tempat dan Tanggal Lahir");
            cell1 = new PdfPCell(new Paragraph("Umur/Usia"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table2.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("Status Perkawinan (B/S/P)"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table2.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("Jenis Kelamin LK | PR"));
            cell1.setColspan(2);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table2.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph("Alamat/Tempat Tinggal"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table2.addCell(cell1);
            table2.addCell("Keterangan");
            table2.setWidthPercentage(95);
            document.add(table2);
          }  catch (DocumentException de) {
                    System.err.println(de.getMessage());
                  }


        }
        public static void isidatatable(Document document,int rec_awal,int tot_rec,int tot_buku,
                                        String stProp,String stKab,String stKec,String stKel) {
          //Vector results
          //jika satu maka record dari awal 0-2000
          //jika dua mulai dari 2001
          System.out.println("total_rec : "+tot_rec);
          int start=0,end=0,index=0,sno=1;
          int halstart=0;
          if (rec_awal==1) {
            start=0;
            halstart=0;
            end=10;
          } else {
            start=2000*(rec_awal-1);
            halstart=200*(rec_awal-1)+1;
            end=start+10;
            sno=2000*(rec_awal-1)+1;
          }
          //end=2000*rec_awal;
          //end skr 10 aja
          //end=10;
          if (end>=tot_rec) {
            end=tot_rec;
          }
          float[] widths2 = {
              0.04f, 0.15f, 0.15f, 0.15f, 0.09f, 0.09f, 0.04f, 0.04f, 0.15f, 0.1f};
              //0.04f, 0.15f, 0.15f, 0.15f, 0.09f, 0.09f, 0.04f,0.04f, 0.16f, 0.9f};
          PdfPTable table;
                    //for (int k = 1; k < 11; ++k) {
                    String deAlamat="";
                    String nilaiData="";
                    PdfPCell cell1;
                    try {
                      /*loop untuk halaman
                       deawal deakhir
                       */
                      int deawal=0,deakhir=0;
                      int desisa=0,sblmax=0;

                      if (rec_awal<tot_buku) {
                        deakhir=200;
                      } else {
                        sblmax=tot_buku-1;
                        desisa=tot_rec-(sblmax*2000);
                        deakhir=(int) Math.ceil( (double) desisa / 10);
                      }
                      for (deawal=0;deawal < deakhir;deawal++) {
                        //loop untuk buku
                        if (deawal==0) {
                          //==
                        } else {
                          System.out.println("Hal berikutnya ..."+deawal);
                          System.out.println("record ke..."+start);
                          System.out.println("akhir ke..."+end);
                          document.newPage();
                          buatheader(document,stProp,stKab,stKec,stKel);
                          judulKolom(document);
                        }
                      for (index = start; index < end; index++) {
                        NamaCalonPemilihObject obj = (NamaCalonPemilihObject) results.elementAt(
                            index);

                        table = new PdfPTable(widths2);
                        table.addCell(String.valueOf(sno));
                        table.addCell(obj.getNik());
                        if (obj.getNama_lgkp()!=null) {
                          table.addCell(obj.getNama_lgkp().toUpperCase());
                        } else {
                          table.addCell(" ");
                        }
                        if (obj.getTmptgllhr()!=null) {
                          deAlamat = obj.getTmptgllhr().toString();
                          deAlamat = deAlamat.replaceFirst("/", ",");
                          table.addCell(deAlamat);
                        } else {
                          table.addCell(" ");
                        }
                        /* cell1 = new PdfPCell(new Paragraph("30"));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                                 table.addCell(cell1);
                                                 cell1 = new PdfPCell(new Paragraph("B"));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                                 table.addCell(cell1);
                                                 cell1 = new PdfPCell(new Paragraph("LK"));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                                 table.addCell("JL. Matahari No.1 "); */
                        //table.addCell(" ");
                        if (obj.getUmur_usia()!=null) {
                          nilaiData = obj.getUmur_usia().toUpperCase();
                          cell1 = new PdfPCell(new Paragraph(nilaiData));
                        } else {
                          cell1 = new PdfPCell(new Paragraph(""));
                        }
                        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table.addCell(cell1);
                        if(obj.getNikah()!=null) {
                          cell1 = new PdfPCell(new Paragraph(obj.getNikah().toUpperCase()));
                        } else {
                          cell1 = new PdfPCell(new Paragraph(""));
                        }
                        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table.addCell(cell1);
                        //table.addCell(" ");
                        if(obj.getKlmin_de()!=null) {
                          if (obj.getKlmin_de().toUpperCase().equals("LK")) {
                            cell1 = new PdfPCell(new Paragraph(obj.getKlmin_de().toUpperCase()));
                            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                          }
                          else {
                            cell1 = new PdfPCell(new Paragraph(" "));
                            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                          }
                        }
                        else {
                          cell1 = new PdfPCell(new Paragraph(" "));
                          cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                         }
                        table.addCell(cell1);
                        //
                         if(obj.getKlmin_de()!=null) {
                           if (obj.getKlmin_de().toUpperCase().equals("PR")) {
                             cell1 = new PdfPCell(new Paragraph(obj.getKlmin_de().toUpperCase()));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                           }
                           else {
                             cell1 = new PdfPCell(new Paragraph(" "));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                           }
                         }
                         else {
                           cell1 = new PdfPCell(new Paragraph(" "));
                           cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                         }

                        table.addCell(cell1);
                        //table.addCell("LK");
                        if(obj.getAlamat()!=null) {
                          cell1 = new PdfPCell(new Paragraph(obj.getAlamat().toUpperCase()));
                        } else {
                          cell1 = new PdfPCell(new Paragraph(" "));
                        }
                        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table.addCell(cell1);
                        //table.addCell(" ");
                        table.addCell(" ");
                        table.setTotalWidth(800);
                        table.setWidthPercentage(95);
                        document.add(table);
                        //--

                        sno++;
                      } //--akhir looping isi halaman

                      start = index;
                      if (start >= tot_rec)
                        start = tot_rec;
                      end = end + 10;
                      if (end > tot_rec)
                        end = tot_rec;
                      } //loop halaman
                    }
                  catch (DocumentException de) {
                    System.err.println(de.getMessage());
                  }


        }
        public static void isidatatablesatu(Document document,int rec_awal,int tot_rec,int tot_buku,
                                        String stProp,String stKab,String stKec,String stKel) {
          //Vector results
          //jika satu maka record dari awal 0-2000
          //jika dua mulai dari 2001
          System.out.println("total_rec : "+tot_rec);
          int start=0,end=0,index=0,sno=1;
          int halstart=0;
          if (rec_awal==1) {
            start=0;
            halstart=0;
            end=10;
          } else {
            start=2000*(rec_awal-1);
            halstart=200*(rec_awal-1)+1;
            end=start+10;
            sno=2000*(rec_awal-1)+1;
          }
          //end=2000*rec_awal;
          //end skr 10 aja
          //end=10;
          if (end>=tot_rec) {
            end=tot_rec;
          }
          float[] widths2 = {
              0.04f, 0.15f, 0.15f, 0.15f, 0.09f, 0.09f, 0.04f, 0.04f, 0.15f, 0.1f};
              //0.04f, 0.15f, 0.15f, 0.15f, 0.09f, 0.09f, 0.04f,0.04f, 0.16f, 0.9f};
          PdfPTable table;
                    //for (int k = 1; k < 11; ++k) {
                    String deAlamat="";
                    String nilaiData="";
                    PdfPCell cell1;
                    try {
                      /*loop untuk halaman
                       deawal deakhir
                       */
                      int deawal=0,deakhir=0;
                      int desisa=0,sblmax=0;

                      if (rec_awal<tot_buku) {
                        //deakhir=200;
                        deakhir=4;
                      } else {
                        sblmax=tot_buku-1;
                        desisa=tot_rec-(sblmax*2000);
                        //deakhir=(int) Math.ceil( (double) desisa / 10);
                        deakhir=4;
                      }
                      for (deawal=0;deawal < deakhir;deawal++) {
                        //loop untuk buku
                        if (deawal==0) {
                          //==
                        } else {
                          System.out.println("Hal berikutnya ..."+deawal);
                          System.out.println("record ke..."+start);
                          System.out.println("akhir ke..."+end);
                          document.newPage();
                          buatheader(document,stProp,stKab,stKec,stKel);
                          judulKolom(document);
                        }
                      for (index = start; index < end; index++) {
                        NamaCalonPemilihObject obj = (NamaCalonPemilihObject) results.elementAt(
                            index);

                        table = new PdfPTable(widths2);
                        table.addCell(String.valueOf(sno));
                        table.addCell(obj.getNik());
                        if (obj.getNama_lgkp()!=null) {
                          table.addCell(obj.getNama_lgkp().toUpperCase());
                        } else {
                          table.addCell(" ");
                        }
                        if (obj.getTmptgllhr()!=null) {
                          deAlamat = obj.getTmptgllhr().toString();
                          deAlamat = deAlamat.replaceFirst("/", ",");
                          table.addCell(deAlamat);
                        } else {
                          table.addCell(" ");
                        }
                        /* cell1 = new PdfPCell(new Paragraph("30"));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                                 table.addCell(cell1);
                                                 cell1 = new PdfPCell(new Paragraph("B"));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                                 table.addCell(cell1);
                                                 cell1 = new PdfPCell(new Paragraph("LK"));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                                                 table.addCell("JL. Matahari No.1 "); */
                        //table.addCell(" ");
                        if (obj.getUmur_usia()!=null) {
                          nilaiData = obj.getUmur_usia().toUpperCase();
                          cell1 = new PdfPCell(new Paragraph(nilaiData));
                        } else {
                          cell1 = new PdfPCell(new Paragraph(""));
                        }
                        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table.addCell(cell1);
                        cell1 = new PdfPCell(new Paragraph(obj.getNikah().toUpperCase()));
                        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table.addCell(cell1);
                        //table.addCell(" ");
                        if(obj.getKlmin_de()!=null) {
                          if (obj.getKlmin_de().toUpperCase().equals("LK")) {
                            cell1 = new PdfPCell(new Paragraph(obj.getKlmin_de().toUpperCase()));
                            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                          }
                          else {
                            cell1 = new PdfPCell(new Paragraph(" "));
                            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                          }
                        }
                        else {
                          cell1 = new PdfPCell(new Paragraph(" "));
                          cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                         }
                        table.addCell(cell1);
                        //
                         if(obj.getKlmin_de()!=null) {
                           if (obj.getKlmin_de().toUpperCase().equals("PR")) {
                             cell1 = new PdfPCell(new Paragraph(obj.getKlmin_de().toUpperCase()));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                           }
                           else {
                             cell1 = new PdfPCell(new Paragraph(" "));
                             cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                           }
                         }
                         else {
                           cell1 = new PdfPCell(new Paragraph(" "));
                           cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                         }

                        table.addCell(cell1);
                        //table.addCell("LK");
                        cell1 = new PdfPCell(new Paragraph(obj.getAlamat().toUpperCase()));
                        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table.addCell(cell1);
                        //table.addCell(" ");
                        table.addCell(" ");
                        table.setTotalWidth(800);
                        table.setWidthPercentage(95);
                        document.add(table);
                        //--

                        sno++;
                      } //--akhir looping isi halaman

                      start = index;
                      if (start >= tot_rec)
                        start = tot_rec;
                      end = end + 10;
                      if (end > tot_rec)
                        end = tot_rec;
                      } //loop halaman
                    }
                  catch (DocumentException de) {
                    System.err.println(de.getMessage());
                  }


        }

}
