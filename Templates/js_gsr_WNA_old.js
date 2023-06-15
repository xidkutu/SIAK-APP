ajmenu1 = new mainMenu('vertical',0, 'transparent', '#DEECFC', '#666699', '#CC0000','#ffffff','right');
 ajmenu1.cellpadding = 3;
// menu utama 
// Warna :	Sorot MenuUtama BG		#DEECFC
//			Hitam					#000000
//			Teks MenuUtama disorot	#CC0000
//			Teks MenuUtama normal	#666699
//			Teks listMenu			#F9FAA7

  ajmenu1.addItems('<font face="Verdana", size="1"></font>', '');
  ajmenu1.addItems('<img src="../images/aa_administrasi.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">UBAH KATA KUNCI</font>', '../I.Login/SIAK Security/ubah_password.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">PENANDATANGAN DOKUMEN</font>', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/1.setup_ttd_KTP_KK_Bio_WNA.htm');

  ajmenu1.addItems('<img src="../images/aa_masukan.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA KELUARGA</font>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA INDIVIDU</font>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PINDAH DATANG</font>', '');

  ajmenu1.addItems('<img src="../images/aa_keluaran.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU KELUARGA</font>', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/1.cetak_KK_WNA.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU TANDA PENDUDUK</font>', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/2.cetak_KTP_WNA.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK BIODATA</font>', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/3.cetak_biodata_WNA.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">RIWAYAT TEMPAT TINGGAL</font>', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/B.data keluaran output/4.riwayat tempat tinggal_WNA.htm');


//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------------------------------------------------------
//
//                          Pendaftaran Penduduk W N A
//
// -----------------------------------------------------------------------------------

// sub menu Data Keluarga  
  ajmenu1 = new subMenu('6','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">KK/Biodata Baru', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/2.permohonan_KK_Bio_baru_WNA.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1">KK Baru (NIK Sudah Ada)', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/3.permohonan_KK_baru_WNA_sudah ada NIK.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1">Numpang KK', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/4.permohonan_KK_numpang_WNA.htm');  
  
// sub menu Data Individu
  ajmenu1 = new subMenu('7','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">Biodata Penduduk', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/5.pendaftaran_biodata_WNA.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan BioData', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/6.pendaftaran_perubahan_biodata_WNA.htm');
 
// sub menu Pindah Datang
   ajmenu1 = new subMenu('8','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Perpindahan (Asal)', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/7.pindah_daerah_asal_WNA.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Kedatangan (Tujuan)', '../VI.Pendaftaran Penduduk WNA (diKabupaten Kota)/A.data masukan input/8.kedatangan_daerah_tujuan_WNA.htm');