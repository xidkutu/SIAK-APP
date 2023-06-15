ajmenu1 = new mainMenu('vertical', 5, 'transparent', '#336699', '#ffffff', '#ff9900','#330000','right');
 ajmenu1.cellpadding = 0;
 // menu utama 

  ajmenu1.addItems('<font face="Arial", size="2"><b>CETAK AKTA KELAHIRAN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>CETAK AKTA KEMATIAN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>CETAK AKTA PERKAWINAN</b></font><br><br>', '');
  ajmenu1.addItems('<font face="Arial", size="2"><b>CETAK AKTA PERCERAIAN</b></font><br><br>', '');

//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// --------------------------------------------------------
// Pencatatan Sipil- Kabupaten/Kota DATA KELUARAN OUTPUT
// --------------------------------------------------------
// sub menu CETAK AKTA KELAHIRAN  
  ajmenu1 = new subMenu('1', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Kelahiran Baru', '2. Setup Dok cetakoutput kabupaten/2.2_C.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Kelahiran Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_B.htm');  
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Kelahiran Baru', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Kelahiran Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');

// sub menu CETAK AKTA KEMATIAN  
  ajmenu1 = new subMenu('2', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Kematian Baru', '2. Setup Dok cetakoutput kabupaten/2.2_C.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Kematian Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_B.htm');  
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Kematian Baru', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Kematian Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');

// sub menu CETAK AKTA PERKAWINAN  
  ajmenu1 = new subMenu('3', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Perkawinan Baru', '2. Setup Dok cetakoutput kabupaten/2.2_C.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Perkawinan Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_B.htm');  
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Perkawinan Baru', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Perkawinan Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');
 
// sub menu CETAK AKTA PERCERAIAN  
  ajmenu1 = new subMenu('4', 'transparent', '#3399CC', '#ffffff', '#000000', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Perceraian Baru', '2. Setup Dok cetakoutput kabupaten/2.2_C.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Akta Perceraian Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_B.htm');  
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Perceraian Baru', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');
  ajmenu1.addItems('<font face="Verdana", size="1"><b>Cetak Kutipan Akta Perceraian Ulang', '2. Setup Dok cetakoutput kabupaten/2.2_A.htm');
