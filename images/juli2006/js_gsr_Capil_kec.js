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
  ajmenu1.addItems('<font face="Verdana", size="1">UBAH KATA KUNCI</font>', 'UbahPassword.jsp');
  ajmenu1.addItems('<img src="images/aa_masukan.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCATATAN KELAHIRAN</font>', 'Pencatatan_Kelahiran_List.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCATATAN KEMATIAN</font>', 'Pencatatan_Kematian_List.jsp');
//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------------------------------------------------------
//
//                         Menu Capil Kabupaten/Kota
//
// -----------------------------------------------------------------------------------
