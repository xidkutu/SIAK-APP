/*
 * $Id: Versions.java,v 1.2 2005/08/29 09:21:56 blowagie Exp $
 * $Name:  $
 *
 * Copyright 2005 by Carsten Hammer.
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
 * LGPL license (the "GNU LIBRARY GENERAL PUBLIC LICENSE"), in which case the
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
package com.lowagie.tools;

import java.awt.*;
import javax.swing.*;
import java.awt.BorderLayout;
import com.lowagie.tools.plugins.*;

/**
 * JFrame that shows the versions of all the plugins.
 */
public class Versions extends JFrame {
	/**
	 * Constructs a JFrame.
	 * @throws HeadlessException
	 */
	public Versions() throws HeadlessException {
		super("Plugins and their version");
		try {
			jbInit();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * Main method (test purposes only)
	 * @param args
	 */
	public static void main(String[] args) {
		Versions untitled1 = new Versions();
	}

	private void jbInit() throws Exception {
		this.getContentPane().setLayout(borderLayout1);
		this.getContentPane().add(jLabel1, java.awt.BorderLayout.CENTER);
		StringBuffer sb = new StringBuffer();
		sb.append("<html>");
		for (int i = 0; i < AbstractTool.versionsarray.size(); i++) {
			sb.append("<p>");
			sb.append(AbstractTool.versionsarray.get(i));
			sb.append("</p>");
		}
		sb.append("</html>");
		jLabel1.setText(sb.toString());
		pack();
	}

	JLabel jLabel1 = new JLabel();

	BorderLayout borderLayout1 = new BorderLayout();
}