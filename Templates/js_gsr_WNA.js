ajmenu1 = new mainMenu('vertical',0, 'transparent', '#DEECFC', '#666699', '#CC0000','#ffffff','right');
 ajmenu1.cellpadding = 1;
// menu utama
// Warna :	Sorot MenuUtama BG		#DEECFC
//			Hitam					#000000
//			Teks MenuUtama disorot	#CC0000
//			Teks MenuUtama normal	#666699
//			Teks listMenu			#F9FAA7

  ajmenu1.addItems('<font face="Verdana", size="1"></font><br>', '');
  ajmenu1.addItems('<img src="images/aa_administrasi.gif" border=0><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">UBAH KATA KUNCI</font>', 'UbahPassword.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">PENANDATANGAN DOKUMEN</font>', 'Setup_KTP_KK_Bio_WNA.jsp');
  ajmenu1.addItems('<img src="images/aa_masukan.gif" border=0><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA KELUARGA</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA INDIVIDU</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PINDAH DATANG</font><br>', '');

  ajmenu1.addItems('<img src="images/aa_keluaran.gif" border=0><br>', '');

  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU KELUARGA</font><br>', 'DaftarKK_WNA.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU TANDA PENDUDUK</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK BIODATA</font><br>', 'cetak_biodata_WNA.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">RIWAYAT TEMPAT TINGGAL</font><br>', 'riwayat_tempat_tinggal_WNI.jsp?sc=WNA');


//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------------------------------------------------------
//
//                          Pendaftaran Penduduk W N A
//
// -----------------------------------------------------------------------------------
// sub menu Data Keluarga
  ajmenu1 = new subMenu('6','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">KK/Biodata Baru', 'Data_Kelu_Wna.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">KK Baru (NIK Sudah Ada)', 'Pen_KKWna_SudapunyaNik.jsp?source=WNA&status=NL');
  ajmenu1.addItems('<font face="Verdana", size="1">Numpang KK', 'NumpangKK_Wna.jsp?source=WNA&status=NL');

// sub menu Data Individu
  ajmenu1 = new subMenu('7','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">Biodata Penduduk', 'Indivi_wna.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan BioData', 'Perubahan_Wna.jsp');

// sub menu Pindah Datang
   ajmenu1 = new subMenu('8','transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Perpindahan (Asal)', 'Perpindahan_Wna.jsp?source=WNA&status=AL');
   ajmenu1.addItems('<font face="Verdana", size="1">Kedatangan (Tujuan)', 'Keda_Tujuan_Wna.jsp?source=WNA&status=TJ');

// sub menu CETAK KTP
   ajmenu1 = new subMenu('11', 'transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Kertas Security</font>', 'cetak_KTP_WNA.jsp');
   ajmenu1.addItems('<font face="Verdana", size="1">PVC / Teslin</font>','cetak_KTP_WNA_PVC.jsp');
   ajmenu1.addItems('<font face="Verdana", size="1">Teslin</font>','cetak_KTP_WNA_TSL8.jsp');

