/*
 * $Id: RtfInfoElement.java,v 1.1 2004/09/24 15:15:25 hallm Exp $
 * $Name:  $
 *
 * Copyright 2003, 2004 by Mark Hall
 *
 * The contents of this file are subject to the Mozilla Public License Version 1.1
 * (the "License"); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the License.
 *
 * The Original Code is 'iText, a free JAVA-PDF library'.
 *
 * The Initial Developer of the Original Code is Bruno Lowagie. Portions created by
 * the Initial Developer are Copyright (C) 1999, 2000, 2001, 2002 by Bruno Lowagie.
 * All Rights Reserved.
 * Co-Developer of the code is Paulo Soares. Portions created by the Co-Developer
 * are Copyright (C) 2000, 2001, 2002 by Paulo Soares. All Rights Reserved.
 *
 * Contributor(s): all the names of the contributors are added in the source code
 * where applicable.
 *
 * Alternatively, the contents of this file may be used under the terms of the
 * LGPL license (the ?GNU LIBRARY GENERAL PUBLIC LICENSE?), in which case the
 * provisions of LGPL are applicable instead of those above.  If you wish to
 * allow use of your version of this file only under the terms of the LGPL
 * License and not to allow others to use your version of this file under
 * the MPL, indicate your decision by deleting the provisions above and
 * replace them with the notice and other provisions required by the LGPL.
 * If you do not delete the provisions above, a recipient may use your version
 * of this file under either the MPL or the GNU LIBRARY GENERAL PUBLIC LICENSE.
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the MPL as stated above or under the terms of the GNU
 * Library General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Library general Public License for more
 * details.
 *
 * If you didn't download this code from the following link, you should check if
 * you aren't using an obsolete version:
 * http://www.lowagie.com/iText/
 */

package com.lowagie.text.rtf.document;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.lowagie.text.Meta;
import com.lowagie.text.rtf.RtfElement;


/**
 * Stores one information group element. Valid elements are
 * author, title, subject, keywords, producer and creationdate.
 * 
 * @version $Version:$
 * @author Mark Hall (mhall@edu.uni-klu.ac.at)
 */
public class RtfInfoElement extends RtfElement {

    /**
     * Constant for the author element
     */
    private static final byte[] INFO_AUTHOR = "\\author".getBytes();
    /**
     * Constant for the subject element
     */
    private static final byte[] INFO_SUBJECT = "\\subject".getBytes();
    /**
     * Constant for the keywords element
     */
    private static final byte[] INFO_KEYWORDS = "\\keywords".getBytes();
    /**
     * Constant for the title element
     */
    private static final byte[] INFO_TITLE = "\\title".getBytes();
    /**
     * Constant for the producer element
     */
    private static final byte[] INFO_PRODUCER = "\\operator".getBytes();
    /**
     * Constant for the creationdate element
     */
    private static final byte[] INFO_CREATION_DATE = "\\creationdate".getBytes();

    /**
     * The type of this RtfInfoElement. The values from Element.INFO_ELEMENT_NAME are used.
     */
    private int infoType = -1;
    /**
     * The content of this RtfInfoElement
     */
    private String content = "";
    
    /**
     * Constructs a RtfInfoElement based on the given Meta object
     * 
     * @param doc The RtfDocument this RtfInfoElement belongs to
     * @param meta The Meta object this RtfInfoElement is based on
     */
    public RtfInfoElement(RtfDocument doc, Meta meta) {
        super(doc);
        infoType = meta.type();
        content = meta.content();
    }
    
    /**
     * Writes this RtfInfoElement
     * 
     * @return A byte array containing the RtfInfoElement data
     */
    public byte[] write() {
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        try {
            result.write(OPEN_GROUP);
            switch(infoType) {
                case Meta.AUTHOR:
                    result.write(INFO_AUTHOR);
                	break;
                case Meta.SUBJECT:
                    result.write(INFO_SUBJECT);
            		break;
                case Meta.KEYWORDS:
                    result.write(INFO_KEYWORDS);
            		break;
                case Meta.TITLE:
                    result.write(INFO_TITLE);
            		break;
                case Meta.PRODUCER:
                    result.write(INFO_PRODUCER);
            		break;
                case Meta.CREATIONDATE:
                    result.write(INFO_CREATION_DATE);
                	break;
                default:
                    result.write(INFO_AUTHOR);
                	break;
            }
            result.write(DELIMITER);
            if(infoType == Meta.CREATIONDATE) {
                result.write(convertDate(content).getBytes());
            } else {
                result.write(content.getBytes());
            }
            result.write(CLOSE_GROUP);
        } catch(IOException ioe) {
            ioe.printStackTrace();
        }
        return result.toByteArray();
    }
    
    /**
     * Converts a date from the format used by iText to the format required by
     * rtf.<br>iText: EEE MMM dd HH:mm:ss zzz yyyy - rtf: \\'yr'yyyy\\'mo'MM\\'dy'dd\\'hr'HH\\'min'mm\\'sec'ss
     * 
     * @param date The date formated by iText
     * @return The date formated for rtf
     */
    private String convertDate(String date) {
        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
        try {
            Date creationDate = sdf.parse(date);
            sdf = new SimpleDateFormat("\\'yr'yyyy\\'mo'MM\\'dy'dd\\'hr'HH\\'min'mm\\'sec'ss");
            return sdf.format(creationDate);
        } catch(ParseException pe) {
            pe.printStackTrace();
            return "";
        }
    }
}
