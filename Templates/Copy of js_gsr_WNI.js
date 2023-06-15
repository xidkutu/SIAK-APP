ajmenu1 = new mainMenu('vertical',0, 'transparent', '#CBE0FA', '#000000', '#003399','#000099','right');
 ajmenu1.cellpadding = 1;
 // menu utama 

  ajmenu1.addItems('<font face="Verdana", size="1">PENANDATANGAN DOKUMEN</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA KELUARGA</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA INDIVIDU</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PINDAH DATANG</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1"></font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU KELUARGA</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK BIODATA</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU TANDA PENDUDUK</font><br>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">RIWAYAT TEMPAT TINGGAL</font><br>', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/4. riwayat tempat tinggal.htm');

//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="../images/tri.gif" border="1">&nbsp;';
// -----------------------------------
// -----------------------------------
// sub menu Penandatangan Dokumen  
  ajmenu1 = new subMenu('1', 'transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">Penandatangan KK', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/1.a setup tt dok KK.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1">Penandatangan KTP', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/1.b setup tt dok KTP.htm');  
  ajmenu1.addItems('<font face="Verdana", size="1">Penandatangan Biodata', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/1.c setup tt bio WNI.htm');

// sub menu Data Keluarga  
  ajmenu1 = new subMenu('2', 'transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">Permohonan KK Baru [yang belum punya NIK]', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/2.a permohonan_KK_baru_WNI_belum_punya_NIK.htm'); 
  ajmenu1.addItems('<font face="Verdana", size="1">Permohonan KK Baru [yang sudah punya NIK]', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/2.b permohonan_KK_baru_WNI_sudah ada NIK.htm');  
  ajmenu1.addItems('<font face="Verdana", size="1">Permohonan Numpang KK', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/2.c permohonan_KK_WNI_numpang.htm');

// sub menu Data Individu
  ajmenu1 = new subMenu('3', 'transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1">Biodata', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/3.a pendaftaran_biodata-WNI.htm');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan Biodata', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/3.b pendaftaran-bio-wni_isi data individu perubahan.htm');
 
// sub menu Pindah Datang
   ajmenu1 = new subMenu('4', 'transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Perpindahan (Daerah Asal)', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/4.a perpindahan daerah asal wni.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Kedatangan (Daerah Tujuan)', '../III.Pendaftaran Penduduk WNI (diKecamatan)/A.data masukan input/4.b kedatangan daerah tujuan wni.htm');
   
// sub menu Cetak KK
   ajmenu1 = new subMenu('5','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak KK Baru', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/1.a cetak_KK_baru_WNI.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak KK Ulang', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/1.b cetak_KK_ulang_WNI.htm');

// sub menu Cetak Biodata
   ajmenu1 = new subMenu('6','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Biodata Baru', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/2.a cetak_biodata_baru_WNI.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Biodata Ulang', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/2.b cetak_biodata_ulang_WNI.htm');

// sub menu Cetak KTP
   ajmenu1 = new subMenu('7','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak KTP Baru', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/3.a cetak_KTP_baru_WNI.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak KTP Pengganti', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/3.b cetak_KTP_pengganti_WNI.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak KTP Perpanjangan', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/3.c cetak_KTP_perpanjangan_WNI.htm');
   ajmenu1.addItems('<font face="Verdana", size="1">Cetak KTP Ulang', '../III.Pendaftaran Penduduk WNI (diKecamatan)/B.data keluaran output/3.d cetak_KTP_ulang_WNI.htm');