ajmenu1 = new mainMenu('vertical', 0, 'transparent', '#336699', '#ffffff', '#ff9900','#330000','right');
 ajmenu1.cellpadding = 0;
 // menu utama 
  ajmenu1.addItems('<font face="Arial", size="2"><b>DATA KELUARGA</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>DATA INDIVIDU</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>PINDAH DATANG</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>CETAK KK</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>CETAK BIODATA</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>CETAK KTP</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>BUKU LAPORAN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>RIWAYAT TEMPAT TINGGAL</b></font><br><br>', '');


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
   
// sub menu Cetak KK
   ajmenu1 = new subMenu('4','transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Daftar KK', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Preview KK', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>KK Baru', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>KK Ulang', '');

// sub menu Cetak Biodata
   ajmenu1 = new subMenu('5','transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Daftar Biodata', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Preview Biodata', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Biodata Baru', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Biodata Ulang', '');

// sub menu Cetak KTP
   ajmenu1 = new subMenu('6','transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Daftar KTP', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Preview KTP', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>KTP Baru', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>KTP Pengganti', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Daftar Perpanjangan KTP', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Preview Perpanjang', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak KTP Ulang', '');

// sub menu Buku Laporan
   ajmenu1 = new subMenu('7','transparent', '#3399CC', '#ffffff', '#000000', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Buku Induk Penduduk', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Buku Perubahan Penduduk', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Buku Perkembangan Penduduk', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Buku Jumlah Penduduk Menurut Kelompok Umur dan Pendidikan Terakhir', '');
   ajmenu1.addItems('<font face="Verdana", size="1"><b>Buku Jumlah Penduduk Menurut Kelompok Umur dan Tenaga Kerja', '');
 