/*
 * $Id: BuildTutorial.java,v 1.8 2004/12/10 14:21:01 blowagie Exp $
 * $Name:  $
 *
 * This code is free software. It may only be copied or modified
 * if you include the following copyright notice:
 *
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * itext@lowagie.com
 */
package com.lowagie.tools;

import java.io.*;

import javax.xml.transform.*;
import javax.xml.transform.stream.*;

/**
 * This class can be used to build the iText website.
 * 
 * @author Bruno Lowagie (based on an example found in the Developer's Almanac)
 */
public class BuildTutorial {

	static String root;
	static FileWriter build;
	
	//~ Methods
	// ----------------------------------------------------------------

	/**
	 * Main method so you can call the convert method from the command line.
	 * @param args 4 arguments are expected:
	 * <ul><li>a sourcedirectory (root of the tutorial xml-files),
	 * <li>a destination directory (where the html and build.xml files will be generated),
	 * <li>an xsl to transform the index.xml into a build.xml
	 * <li>an xsl to transform the index.xml into am index.html</ul>
	 */

	public static void main(String[] args) {
		if (args.length == 4) {
			File srcdir = new File(args[0]);
			File destdir = new File(args[1]);
			File xsl_examples = new File(srcdir, args[2]);
			File xsl_site = new File(srcdir, args[3]);
			try {
				System.out.print("Building tutorial: ");
				root = new File(args[1], srcdir.getName()).getCanonicalPath();
				System.out.println(root);
				build = new FileWriter(new File(root, "build.xml"));
				build.write("<project name=\"tutorial\" default=\"all\" basedir=\".\">\n");
				build.write("<target name=\"all\">\n");
				action(srcdir, destdir, xsl_examples, xsl_site);
				build.write("</target>\n</project>");
				build.flush();
				build.close();
			}
			catch(IOException ioe) {
				ioe.printStackTrace();
			}
		} else {
			System.err
					.println("Wrong number of parameters.\nUsage: BuildSite srcdr destdir xsl_examples xsl_site");
		}
	}

	/**
	 * Inspects a file or directory that is given and performs the necessary actions on it (transformation or recursion).
	 * @param source a sourcedirectory (possibly with a tutorial xml-file)
	 * @param destination a destination directory (where the html and build.xml file will be generated, if necessary)
	 * @param xsl_examples an xsl to transform the index.xml into a build.xml
	 * @param xsl_site an xsl to transform the index.xml into am index.html
	 * @throws IOException when something goes wrong while reading or creating a file or directory
	 */
	public static void action(File source, File destination, File xsl_examples, File xsl_site) throws IOException {
		if ("CVS".equals(source.getName())) return;
		System.out.print(source.getName());
		if (source.isDirectory()) {
			System.out.print(" ");
			System.out.println(source.getCanonicalPath());
			File dest = new File(destination, source.getName());
			dest.mkdir();
			File current;
			File[] xmlFiles = source.listFiles();
			for (int i = 0; i < xmlFiles.length; i++) {
				current = xmlFiles[i];
				action(current, dest, xsl_examples, xsl_site);
			}
		}
		else if (source.getName().equals("index.xml")) {
			System.out.println("... transformed");
			convert(source, xsl_site, new File(destination, "index.html"));
			File buildfile = new File(destination, "build.xml");
			String path = buildfile.getCanonicalPath().substring(root.length());
			path = path.replace(File.separatorChar, '/');
			if ("/build.xml".equals(path)) return;
			convert(source, xsl_examples, buildfile);
			build.write("\t<ant antfile=\"${basedir}");
			build.write(path);
			build.write("\" target=\"install\" inheritAll=\"false\" />\n");
		}
		else {
			System.out.println("... skipped");
		}
	}
	
	/**
	 * Converts an <code>infile</code>, using an <code>xslfile</code> to an
	 * <code>outfile</code>.
	 * 
	 * @param infile
	 *            the path to an XML file
	 * @param xslfile
	 *            the path to the XSL file
	 * @param outfile
	 *            the path for the output file
	 */
	public static void convert(File infile, File xslfile, File outfile) {
		try {
			// Create transformer factory
			TransformerFactory factory = TransformerFactory.newInstance();

			// Use the factory to create a template containing the xsl file
			Templates template = factory.newTemplates(new StreamSource(
					new FileInputStream(xslfile)));

			// Use the template to create a transformer
			Transformer xformer = template.newTransformer();
			
			// passing 2 parameters
			String branch = outfile.getParentFile().getCanonicalPath().substring(root.length());
			branch = branch.replace(File.separatorChar, '/');
			StringBuffer path = new StringBuffer();
			for (int i = 0; i < branch.length(); i++) {
				if (branch.charAt(i) == '/') path.append("/..");
			}
			
			xformer.setParameter("branch", branch);
			xformer.setParameter("root", path.toString());

			// Prepare the input and output files
			Source source = new StreamSource(new FileInputStream(infile));
			Result result = new StreamResult(new FileOutputStream(outfile));

			// Apply the xsl file to the source file and write the result to the
			// output file
			xformer.transform(source, result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
//The End
