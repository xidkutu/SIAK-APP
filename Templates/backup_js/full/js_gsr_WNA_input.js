ajmenu1 = new mainMenu('vertical', 0, 'transparent', '#336699', '#ffffff', '#ff9900','#330000','right');
 ajmenu1.cellpadding = 0;
 // menu utama 
  ajmenu1.addItems('<font face="Arial", size="2"><b>DATA KELUARGA WNA TINGGAL TETAP</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>DATA INDIVIDU</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>PINDAH DATANG</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>CEK KK WNA TINGGAL TETAP</b></font><br><br>', '');
//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------
// amuba PRODUCTION 2003
// amuba.web.id
// Multimedia web Presentation
// -----------------------------------
// sub menu DATA KELUARGA WNA TINGGAL TETAP
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
   
// sub menu CEK KK WNA TINGGAL TETAP
   ajmenu1 = new subMenu('4', 'transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Daftar KK', '#');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Preview KK', '#');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>KK Baru', '#');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>KK Ulang', '#');