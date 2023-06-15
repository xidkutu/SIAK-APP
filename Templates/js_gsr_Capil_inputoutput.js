ajmenu1 = new mainMenu('vertical',0, 'transparent', '#DEECFC', '#666699', '#CC0000','#ffffff','right');
 ajmenu1.cellpadding = 1;
// menu utama 
// Warna :	Sorot MenuUtama BG		#DEECFC
//			Hitam					#000000
//			Teks MenuUtama disorot	#CC0000
//			Teks MenuUtama normal	#666699
//			Teks listMenu			#F9FAA7

  ajmenu1.addItems('<font face="Verdana", size="1"></font><br>', '');
  ajmenu1.addItems('<img src="images/aa_masukan.gif"><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PENANDATANGAN DOKUMEN</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCATATAN KELAHIRAN</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA INDIVIDU</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PINDAH DATANG</font><br>', '');
  ajmenu1.addItems('<img src="images/aa_keluaran.gif"><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KK</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK BIODATA</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KTP</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">RIWAYAT TEMPAT TINGGAL</font><br>', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/4. riwayat tempat tinggal WNA.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCARIAN DAN TAMPILAN</font><br>', '');


//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------------------------------------------------------
//
//                          Pendaftaran Penduduk W N A
//
// -----------------------------------------------------------------------------------
// sub menu Penandatangan Dokumen  
  ajmenu1 = new subMenu('3','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">KK/KTP/Biodata', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/1.setup tt dok KTP_KK_Bio_WNA.htm'); 
  
// sub menu Data Keluarga  
  ajmenu1 = new subMenu('4','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">Permohonan KK Baru', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/permohonan_KK_baru WNA.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1">Permohonan Numpang KK', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/permohonan_numpangKK_WNA.htm');  
  
// sub menu Data Individu
  ajmenu1 = new subMenu('5','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">Biodata', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/pendaftaran bio WNA.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan BioData', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/3.b input bio WNA Perubahan biodata individu.htm');
 
// sub menu Pindah Datang
   ajmenu1 = new subMenu('6','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Perpindahan (daerah asal)', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/4.a pindah daerah asal WNA kitap.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Kedatangan (daerah tujuan)', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/4.b kedatangan daerah tujuan WNA kitap.htm');
   
// sub menu Cetak KK
   ajmenu1 = new subMenu('8','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/1.a cetak KK baru WNA.htm');
   
// sub menu Cetak Biodata
   ajmenu1 = new subMenu('9','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/2.a cetak bio baru WNA.htm');
   
// sub menu Cetak KTP
   ajmenu1 = new subMenu('10','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Baru/Pengganti', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/3.cetak_KTP_baru_pengganti_WNA.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Perpanjangan/Ulang', 'VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/3.cetak_KTP_perpjg_ulg_WNA.htm');
 