ajmenu1 = new mainMenu('vertical', 0, 'transparent', '#336699', '#ffffff', '#ff9900','#330000','right');
 ajmenu1.cellpadding = 0;
 // menu utama 
  ajmenu1.addItems('<font face="Arial", size="2"><b>PENDAFTARAN DAN PENCATATAN KELAHIRAN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>PENCATATAN PERKAWINAN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>PENCATATAN PERCERAIAN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>PENDAFTARAN DAN PENCATATAN KEMATIAN</b></font><br><br>', '');
//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------
// amuba PRODUCTION 2003
// amuba.web.id
// Multimedia web Presentation
// -----------------------------------
// sub menu Data Keluarga  
  ajmenu1 = new subMenu('1', 'transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Baru', ''); 
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Pecah KK', '');  
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Numpang KK', '#');

// sub menu Data Individu
  ajmenu1 = new subMenu('2', 'transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Biodata', '#');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Perubahan Bio Data', '#');
 
// sub menu Pindah Datang
   ajmenu1 = new subMenu('3', 'transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Pindah', '#');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Datang', '#'); 