//The following line is critical for menu operation, and MUST APPEAR ONLY ONCE. If you have more than one menu_array.js file rem out this line in subsequent files
menunum=0;menus=new Array();_d=document;function addmenu(){menunum++;menus[menunum]=menu;}function dumpmenus(){mt="<script language=javascript>";for(a=1;a<menus.length;a++){mt+=" menu"+a+"=menus["+a+"];"}mt+="<\/script>";_d.write(mt)}
//Please leave the above line intact. The above also needs to be enabled if it not already enabled unless this file is part of a multi pack.

////////////////////////////////////
// Editable properties START here //
////////////////////////////////////

// Special effect string for IE5.5 or above please visit http://www.milonic.co.uk/menu/filters_sample.php for more filters
if(navigator.appVersion.indexOf("MSIE 6.0")>0)
{
	effect = "Fade(duration=0.2);Alpha(style=0,opacity=88);Shadow(color='#777777', Direction=135, Strength=5)"
}
else
{
					//effect = "Shadow(color='#777777', Direction=135, Strength=5)" 
					// Stop IE5.5 bug when using more than one filter
}


timegap=500			// The time delay for menus to remain visible
followspeed=10		// Follow Scrolling speed
followrate=40		// Follow Scrolling Rate
suboffset_top=10;	// Sub menu offset Top position 
suboffset_left=10;	// Sub menu offset Left position

style1=[			// style1 is an array of properties. You can have as many property arrays as you need. This means that menus can have their own style.
"black",			// Mouse Off Font Color
"#ffffff",			// Mouse Off Background Color
"ffebdc",			// Mouse On Font Color
"#003366",			// Mouse On Background Color
"",					// Menu Border Color 
11,					// Font Size in pixels
"normal",			// Font Style (italic or normal)
"normal",			// Font Weight (bold or normal)
"Arial",			// Font Name
4,					// Menu Item Padding
"",					// Sub Menu Image (Leave this blank if not needed)
//"FFFFFF",			// 3D Border & Separator bar
//"66ffff",			// 3D High Color
//"000099",			// 3D Low Color
//"",				// Current Page Item Font Color (leave this blank to disable)
//"grey",			// Current Page Item Background Color (leave this blank to disable)
"",					// Top Bar image (Leave this blank to disable)
"ffffff",			// Menu Header Font Color (Leave blank if headers are not needed)
"CCCCCC",			// Menu Header Background Color (Leave blank if headers are not needed)
"000000",			// Menu Item Separator Color
]


addmenu(menu=[		// This is the array that contains your menu properties and details
"mainmenu",			// Menu Name - This is needed in order for the menu to be called
0,        			// Menu Top - The Top position of the menu in pixels
0,					// Menu Left - The Left position of the menu in pixels
,	 				// Menu Width - Menus width in pixels
0,	            	// Menu Border Width 
"center:middle",	// Screen Position - here you can use "center;left;right;middle;top;bottom" or a combination of "center:middle"
style1,				// Properties Array - this is set higher up, as above
1,					// Always Visible - allows the menu item to be visible at all time (1=on/0=off)
"center",			// Alignment - sets the menu elements text alignment, values valid here are: left, right or center
effect,				// Filter - Text variable for setting transitional effects on menu activation - see above for more info
1,					// Follow Scrolling - Tells the menu item to follow the user down the screen (visible at all times) (1=on/0=off)
0, 					// Horizontal Menu - Tells the menu to become horizontal instead of top to bottom style (1=on/0=off)
,					// Keep Alive - Keeps the menu visible until the user moves over another menu or clicks elsewhere on the page (1=on/0=off)
,					// Position of TOP sub image left:center:right
,					// Set the Overall Width of Horizontal Menu to 100% and height to the specified amount (Leave blank to disable)
,					// Right To Left - Used in Hebrew for example. (1=on/0=off)
,					// Open the Menus OnClick - leave blank for OnMouseover (1=on/0=off)
,					// ID of the div you want to hide on MouseOver (useful for hiding form elements)
,					// Background image for menu when BGColor set to transparent.
,					// Scrollable Menu
,					// Reserved for future use

,"PENANDATANGAN DOKUMEN&nbsp;&nbsp;","show-menu=penduduk",,"Back to the home page",1 // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"
,"DATA KELUARGA&nbsp;Sipil&nbsp;&nbsp;","show-menu=sipil",,"",1
,"DATA INDIVIDU&nbsp;&nbsp;","show-menu=statis_mnu",,"",1
,"PINDAH DATANG&nbsp;&nbsp;","show-menu=admin",,"",1
,"CETAK KK&nbsp;&nbsp;","show-menu=admin",,"",1
,"CETAK BIODATA&nbsp;&nbsp;","show-menu=admin",,"",1
,"CETAK KTP&nbsp;&nbsp;","show-menu=admin",,"",1
,"RIWAYAT TEMPAT TINGGAL&nbsp;&nbsp;","show-menu=admin",,"",1
,"PENCARIAN DAN TAMPILAN&nbsp;&nbsp;","show-menu=admin",,"",1
])

addmenu(menu=["penduduk",,,180,1,"",style1,,"left","Shadow(color='#000000', Direction=135, Strength=5)",0,,,,,,,,,,,
	,"Penandatangan KK","../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/1.a setup tt dok KK WNA.htm target=mainFrame",,,1
	,"Penandatangan KTP","../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/1.b setup tt dok KTP WNA target=mainFrame",,,1
	,"Penandatangan Biodata","../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/1.c setup tt dok bio WNA.htm target=mainFrame",,,1
])

addmenu(menu=["sipil",,,180,1,"",style1,,"left","Shadow(color='#000000', Direction=135, Strength=5)",0,,,,,,,,,,,
	,"Catat&nbsp;/Hasil&nbsp;Kejadian&nbsp;Vital","catat_sipil.jsp target=mainFrame",,,1
])

addmenu(menu=["statis_mnu",,,180,1,"",style1,,"left","Shadow(color='#000000', Direction=135, Strength=5)",0,,,,,,,,,,,
	,"Kependudukan&nbsp;dan&nbsp;Vital","statis.htm target=mainFrame",,,1
])

addmenu(menu=["admin",,,180,1,"",style1,,"left","Shadow(color='#000000', Direction=135, Strength=5)",0,,,,,,,,,,,
	,"Setup&nbsp;Wilayah","show-menu=wilayah",,,1
	,"Penandatangan Dokumen","",,,1
])
addmenu(menu=["wilayah",,,180,1,"",style1,,"left","Shadow(color='#000000', Direction=135, Strength=5)",0,,,,,,,,,,,
	,"Propinsi","propinsi_setup.jsp target=mainFrame",,,1
	,"Kabupaten/Kota","kabupaten_setup.jsp target=mainFrame",,,1
	,"Kecamatan","keca_setup.jsp target=mainFrame",,,1
	,"Kelurahan/Desa","kelur_setup.jsp target=mainFrame",,,1
])

dumpmenus()