ajmenu1 = new mainMenu('vertical', 0, 'transparent', '#336699', '#ffffff', '#ff9900','#330000','right');
 ajmenu1.cellpadding = 0;
 // menu utama 
  ajmenu1.addItems('<font face="Arial", size="2"><b>SETUP PENANDATANGAN DOKUMEN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>DATA KELUARGA</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>DATA INDIVIDU</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>PINDAH DATANG</b></font><br><br>', '');
  
//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------

// -----------------------------------
// sub menu Penandatangan Dokumen  
  ajmenu1 = new subMenu('1', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Penandatangan KK', ''); 
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Penandatangan KTP', '');  
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Penandatangan Biodata', '#');

// sub menu Data Keluarga  
  ajmenu1 = new subMenu('1', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Baru', ''); 
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Pecah KK', '');  
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Numpang KK', '#');

// sub menu Data Individu
  ajmenu1 = new subMenu('2', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Biodata', '#');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Perubahan Bio Data', '#');
 
// sub menu Pindah Datang
   ajmenu1 = new subMenu('3', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Pindah', '#');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Datang', '#'); 