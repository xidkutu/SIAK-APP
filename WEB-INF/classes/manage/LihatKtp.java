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

/* import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter; */

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * A very simple PdfPTable example.
 */
public final class LihatKtp extends
weblogic.servlet.jsp.JspBase
implements weblogic.servlet.jsp.StaleIndicator
 {

        /**
         * A very simple PdfPTable example.
         *
         * @param args
         *            no arguments needed
         */
        public static void main(String[] args) {

                System.out.println("My First PdfPTable");

                // step 1: creation of a document-object
                Document document = new Document();

                try {
                        // step 2:
                        // we create a writer that listens to the document
                        // and directs a PDF-stream to a file
                        PdfWriter.getInstance(document, new FileOutputStream("MyFirstTable.pdf"));

                        // step 3: we open the document
                        document.open();
                        Font fonts = new Font(Font.COURIER,14,Font.BOLD);
                        PdfPTable table = new PdfPTable(3);
                        PdfPCell cell = new PdfPCell(new Paragraph("header with colspan 3"));
                        cell.setColspan(3);
                        //cell.setPaddingLeft("");
                        table.addCell(cell);
                        //table.setHorizontalAlignment(Element.ALIGN_CENTER);
                        table.addCell("1.1");
                        table.addCell("2.1");
                        table.addCell("3.1");
                        table.addCell("1.2");
                        table.addCell("2.2");
                        table.addCell("3.2");

                        cell = new PdfPCell(new Paragraph("cell test1"));
                        cell.setBorderColor(new Color(255, 0, 0));
                        table.addCell(cell);
                        cell = new PdfPCell(new Paragraph("cell test2"));
                        cell.setColspan(2);
                        cell.setBackgroundColor(new Color(0xC0, 0xC0, 0xC0));
                        //table.setTotalWidth(800);

                        table.addCell(cell);
                        document.add(table);
                } catch (DocumentException de) {
                        System.err.println(de.getMessage());
                } catch (IOException ioe) {
                        System.err.println(ioe.getMessage());
                }

                // step 5: we close the document
                document.close();
        }
        public boolean _isStale() {
        weblogic.servlet.jsp.StaleChecker sci =(weblogic.servlet.jsp.StaleChecker)(getServletConfig().getServletContext());
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/Pinview", 1082781024109L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        //if (sci.isResourceStale("/Global.jsp", 1083660285609L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }

    public static boolean _staticIsStale(weblogic.servlet.jsp.StaleChecker sci) {
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/Pinview", 1082781024109L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        //if (sci.isResourceStale("/Global.jsp", 1083660285609L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }

  public void _jspService(HttpServletRequest httpServletRequest,
                          HttpServletResponse httpServletResponse) {
    //do proses here
  }
}
