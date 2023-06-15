function openIT(u,W,H,X,Y,n,b,x,m,r) {
	var cU  ='images/close.gif'   //gif for close on normal state.
	var cO  ='images/close.gif'  //gif for close on mouseover.
	var cL  ='images/clock.gif'      //gif for loading indicator.
	var mU  ='images/minimize.gif'     //gif for minimize to taskbar on normal state.
	var mO  ='images/minimize.gif'    //gif for minimize to taskbar on mouseover.
	var xU  ='images/max.gif'     //gif for maximize normal state.
	var xO  ='images/max.gif'    //gif for maximize on mouseover.
	var rU  ='images/restore.gif'     //gif for minimize on normal state.
	var rO  ='images/restore.gif'    //gif for minimize on mouseover.
	var tH  ='<font face=verdana size=2>adminduk SIAK offline</font>'   //title for the title bar in html format.
	var tW  ='adminduk SIAK offline'   //title for the task bar of Windows.
	var wB  ='#6699CC'   //Border color.
	var wBs ='#D5D5FF'   //Border color on window drag.
	var wBG ='#33CCCC'   //Background of the title bar.
	var wBGs='#66CCFF'   //Background of the title bar on window drag.
	var wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0'  //Html parameters for Netscape.
	var fSO ='scrolling=auto noresize'   //Html parameters for main content frame.
	var brd =b||5;   //Extra border size.
	var max =x||false;   //Maxzimize option (true|false).
	var min =m||false;   //Minimize to taskbar option (true|false).
	var res =r||false;   //Resizable window (true|false).
	var tsz =20;   //Height of title bar.
	//return chromeless(u,n,W,H,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,max,min,res,tsz)
}

ajmenu1 = new mainMenu('vertical',0, 'transparent', '#DEECFC', '#666699', '#CC0000','#ffffff','right');
 ajmenu1.cellpadding = 4;
// menu utama
// Warna :	Sorot MenuUtama BG		#DEECFC
//			Hitam					#000000
//			Teks MenuUtama disorot	#CC0000
//			Teks MenuUtama normal	#666699
//			Teks listMenu			#F9FAA7

  ajmenu1.addItems('<font face="Verdana", size="1"></font>', '');
  ajmenu1.addItems('<img src="images/aa_administrasi.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">SINKRONISASI DATA SIAK</font>', "javascript:openIT('upload.htm',550,150,280,475,'window2',5,false,false,false);");
//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
