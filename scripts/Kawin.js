//added by Yopie
function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function validateWNSuami(nik_suami)
{
var tmp_nik=trim(nik_suami.value);
 if(tmp_nik!="")
 {
      if(tmp_nik.substring(0,1) == 'A')
	{
              if (!((parseInt(tmp_nik.substring(7,9),10)>=1) && (parseInt(tmp_nik.substring(7,9),10)<=31)))

               {
               alert("Nik Suami Salah !");
               nik_suami.disabled = false;
               nik_suami.focus();
               return(false);
               }
	}
	if(tmp_nik.substring(0,1) != 'A')
	{
          if (!((parseInt(tmp_nik.substring(6,8),10)>=1) && (parseInt(tmp_nik.substring(6,8),10)<=31)))
               {
               alert("Nik Suami Salah !");
               nik_suami.disabled = false;
               nik_suami.focus();
               return(false);
               }

	}
}
}

function validateWNIstri(nik_istri)
{
var tmp_nik=trim(nik_istri.value);

 if(tmp_nik!="")
{
	if(tmp_nik.substring(0,1) == 'A')
	{
           if (!((parseInt(tmp_nik.substring(7,9),10)>=41) && (parseInt(tmp_nik.substring(7,9),10)<=71)))
               {
               alert("Nik Istri Salah !");
               nik_istri.disabled = false;
               nik_istri.focus();
               return(false);
               }

	}
	if(tmp_nik.substring(0,1) != 'A')
	{
            if (!((parseInt(tmp_nik.substring(6,8),10)>=41) && (parseInt(tmp_nik.substring(6,8),10)<=71)))
               {
               alert("Nik Istri Salah !");
               nik_istri.disabled = false;
               nik_istri.focus();
               return(false);
               }
	}
}
}

function validateWNIbu(nik_ibu,radiobtn)
{
var tmp_nik=trim(nik_ibu.value);

 if(tmp_nik!="")
{
	if(tmp_nik.substring(0,1) == 'A')
	{
           if ((parseInt(tmp_nik.substring(7,9),10)>=41) && (parseInt(tmp_nik.substring(7,9),10)<=71))
             radiobtn[1].checked = true;
             else
               {
               alert("Nik Ibu Salah !");
               nik_ibu.disabled = false;
               nik_ibu.focus();
               return(false);
               }

	}
	if(tmp_nik.substring(0,1) != 'A')
	{
            if ((parseInt(tmp_nik.substring(6,8),10)>=41) && (parseInt(tmp_nik.substring(6,8),10)<=71))
              radiobtn[0].checked = true;
             else
               {
               alert("Nik Ibu Salah !");
               nik_ibu.disabled = false;
               nik_ibu.focus();
               return(false);
               }
	}
}
}

function validateWNAyah(nik_ayah,radiobtn)
{
var tmp_nik=trim(nik_ayah.value);

 if(tmp_nik!="")
 {
      if(tmp_nik.substring(0,1) == 'A')
	{
              if ((parseInt(tmp_nik.substring(7,9),10)>=1) && (parseInt(tmp_nik.substring(7,9),10)<=31))
             radiobtn[1].checked = true;
             else
               {
               alert("Nik Ayah Salah !");
               nik_ayah.disabled = false;
               nik_ayah.focus();
               return(false);
               }
	}
	if(tmp_nik.substring(0,1) != 'A')
	{

          if ((parseInt(tmp_nik.substring(6,8),10)>=1) && (parseInt(tmp_nik.substring(6,8),10)<=31))
              radiobtn[0].checked = true;
             else
               {
               alert("Nik Ayah Salah !");
               nik_ayah.disabled = false;
               nik_ayah.focus();
               return(false);
               }

	}
}
}

//end added by Yopie

function simpan()
{
	// *********** Simpan Data Perkawinan ***********************
	if(form1.kwn_ke_suami.value == "")
	{
		alert("Perkawinan ke belum diisi !")
		tp1.setSelectedIndex(0)
                form1.kwn_ke_suami.disabled = false;
		form1.kwn_ke_suami.focus()
		return false
	} else	if(parseInt(form1.kwn_ke_suami.value,10)<=0) {
		alert("Data Perkawinan ke salah !")
		tp1.setSelectedIndex(0)
                form1.kwn_ke_suami.disabled = false;
		form1.kwn_ke_suami.focus()
		return false
	}

	if(form1.istri_ke.value != "" && parseInt(form1.istri_ke.value,10)<=0)
	{
		alert("Data Istri ke salah !")
		tp1.setSelectedIndex(0)
                form1.istri_ke.disabled = false;
		form1.istri_ke.focus()
		return false
	}



		// ******************** Validations for Data Ayah dari Suami  ***************

	var k= parseInt(form1.tgl_lhr_ayh_suami_mm.value,10)

	switch(k)
	{
	       case 4:

			if(form1.tgl_lhr_ayh_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_suami_dd.disabled = false;
				form1.tgl_lhr_ayh_suami_dd.focus()
				form1.tgl_lhr_ayh_suami_dd.value=""
				return(false)
			}

		case 6:

			if(form1.tgl_lhr_ayh_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_suami_dd.disabled = false;
				form1.tgl_lhr_ayh_suami_dd.focus()
				form1.tgl_lhr_ayh_suami_dd.value=""
				return(false)
			}

		case 9:

			if(form1.tgl_lhr_ayh_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_suami_dd.disabled = false;
				form1.tgl_lhr_ayh_suami_dd.focus()
				form1.tgl_lhr_ayh_suami_dd.value=""
				return(false)
			}

		case 11:

			if(form1.tgl_lhr_ayh_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_suami_dd.disabled = false;
				form1.tgl_lhr_ayh_suami_dd.focus()
				form1.tgl_lhr_ayh_suami_dd.value=""
				return(false)
			}

	}
	if(form1.radiobutton1[0].checked != true && form1.radiobutton1[1].checked != true)
	{
		alert("Warga negara ayah dari suami belum diisi !")
		tp1.setSelectedIndex(1)
		return false
	}
	if(form1.nik_ayh_dr_suami.value.substring(0,1) == 'A' && form1.radiobutton1[0].checked == true)
	{
		alert("Pilihan Warga Negara Ayah tidak sesuai dengan NIK !")
		tp1.setSelectedIndex(1)
		return false
	}
        if(form1.radiobutton[1].checked == true) {
 	   if(form1.nama_ayh_suami.value == "")
	   {
		alert("Nama Lengkap Ayah belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_ayh_suami.disabled = false;
		form1.nama_ayh_suami.focus()
		return false
	   }
	   if(form1.agama_ayh_suami.options[0].selected == true)
	   {
		alert("Agama belum diisi !")
		tp1.setSelectedIndex(1)
                form1.agama_ayh_suami.disabled = false;
		form1.agama_ayh_suami.focus()
		return false
	   }

	   if(form1.tgl_lhr_ayh_suami_dd.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(1)
                form1.tgl_lhr_ayh_suami_dd.disabled = false;
		form1.tgl_lhr_ayh_suami_dd.focus()
		form1.tgl_lhr_ayh_suami_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_suami_dd.value.length != 2)
	   {
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(1)
                form1.tgl_lhr_ayh_suami_dd.disabled = false;
		form1.tgl_lhr_ayh_suami_dd.focus()
		form1.tgl_lhr_ayh_suami_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_suami_mm.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(1)
                form1.tgl_lhr_ayh_suami_mm.disabled = false;
		form1.tgl_lhr_ayh_suami_mm.focus()
		form1.tgl_lhr_ayh_suami_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_suami_mm.value.length != 2)
	   {
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(1)
                form1.tgl_lhr_ayh_suami_mm.disabled = false;
		form1.tgl_lhr_ayh_suami_mm.focus()
		form1.tgl_lhr_ayh_suami_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_suami_yy.value == "" )
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(1)
                form1.tgl_lhr_ayh_suami_yy.disabled = false;
		form1.tgl_lhr_ayh_suami_yy.focus()
		form1.tgl_lhr_ayh_suami_yy.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_suami_yy.value.length != 4)
	   {
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(1)
                form1.tgl_lhr_ayh_suami_yy.disabled = false;
		form1.tgl_lhr_ayh_suami_yy.focus()
		form1.tgl_lhr_ayh_suami_yy.value=""
		return(false)
	   }
        }
        if(form1.radiobutton1[0].checked == true) {
           if (form1.jenis_pkrjn_ayh_suami.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(1)
                form1.jenis_pkrjn_ayh_suami.disabled = false;
		form1.jenis_pkrjn_ayh_suami.focus()
		return false
	   }
	} else if(form1.radiobutton1[1].checked == true) {
           if (form1.jenis_pkrjn_ayh_suami.options[0].selected == true) {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(1)
                form1.jenis_pkrjn_ayh_suami.disabled = false;
		form1.jenis_pkrjn_ayh_suami.focus()
		return false
          }
	}
        if(form1.radiobutton[1].checked == true) {
	   if(form1.alamat_ayh_suami.value == "" )
	   {
		alert("Alamat belum diisi !")
		tp1.setSelectedIndex(1)
                form1.alamat_ayh_suami.disabled = false;
		form1.alamat_ayh_suami.focus()
		return(false)
	   }

	   //if(form1.rt_ayh_suami.value == "" || parseInt(form1.rt_ayh_suami.value)<=0 )
           if(form1.rt_ayh_suami.value != "" && parseInt(form1.rt_ayh_suami.value,10)<=0 )
	   {
		//alert("RT Ayah dari Suami belum diisi !")
                alert("RT Ayah dari Suami Salah !")
		tp1.setSelectedIndex(1)
                form1.rt_ayh_suami.disabled = false;
		form1.rt_ayh_suami.focus()
		return(false)
	   }

	   if(form1.rw_ayh_suami.value != "" && parseInt(form1.rw_ayh_suami.value,10)<=0 )
	   {
		alert("RW Ayah dari Suami Salah !")
		tp1.setSelectedIndex(1)
                form1.rw_ayh_suami.disabled = false;
		form1.rw_ayh_suami.focus()
		return(false)
	   }

	   if(form1.kpos_ayh_suami.value != "" && form1.kpos_ayh_suami.value.length!=5 )
	   {
		alert("Kode Pos Ayah dari Suami Salah !")
		tp1.setSelectedIndex(1)
                form1.kpos_ayh_suami.disabled = false;
		form1.kpos_ayh_suami.focus()
		return(false)
	   }

          if(form1.tlp_ayh_suami.value != "" && form1.tlp_ayh_suami.value.length <7 )
  	  {
		alert("Nomor Telepon Ayah dari Suami Salah !")
		tp1.setSelectedIndex(1)
                form1.tlp_ayh_suami.disabled = false;
		form1.tlp_ayh_suami.focus()
		return(false)
	  }
           if(form1.nama_prop_ayh_suami.value == "" )
	   {
		alert("Nama Provinsi belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_prop_ayh_suami.disabled = false;
		form1.nama_prop_ayh_suami.focus()
		return(false)
	   }
           if(form1.nama_kab_ayh_suami.value == "" )
	   {
		alert("Nama Kabupaten belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_kab_ayh_suami.disabled = false;
		form1.nama_kab_ayh_suami.focus()
		return(false)
	   }
           if(form1.nama_kec_ayh_suami.value == "" )
	   {
		alert("Nama Kecamatan belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_kec_ayh_suami.disabled = false;
		form1.nama_kec_ayh_suami.focus()
		return(false)
	   }
           if(form1.nama_kel_ayh_suami.value == "" )
	   {
		alert("Nama Kelurahan belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_kel_ayh_suami.disabled = false;
		form1.nama_kel_ayh_suami.focus()
		return(false)
	   }
        }
	 //	 ************** Validations for Data Ibu dari Suami *********************


	var i = parseInt(form1.tgl_lhr_ibu_suami_mm.value,10)

	switch(i)
	{
	       case 4:

			if(form1.tgl_lhr_ibu_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_suami_dd.disabled = false;
				form1.tgl_lhr_ibu_suami_dd.focus()
				form1.tgl_lhr_ibu_suami_dd.value=""
				return(false)
			}

		case 6:

			if(form1.tgl_lhr_ibu_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_suami_dd.disabled = false;
				form1.tgl_lhr_ibu_suami_dd.focus()
				form1.tgl_lhr_ibu_suami_dd.value=""
				return(false)
			}

		case 9:

			if(form1.tgl_lhr_ibu_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_suami_dd.disabled = false;
				form1.tgl_lhr_ibu_suami_dd.focus()
				form1.tgl_lhr_ibu_suami_dd.value=""
				return(false)
			}

		case 11:

			if(form1.tgl_lhr_ibu_suami_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_suami_dd.disabled = false;
				form1.tgl_lhr_ibu_suami_dd.focus()
				form1.tgl_lhr_ibu_suami_dd.value=""
				return(false)
			}

	}
	if(form1.radiobutton3[0].checked != true && form1.radiobutton3[1].checked != true)
	{
		alert("Warga Negara Ibu dari Suami belum diisi !")
		tp1.setSelectedIndex(2)
		return false
	}
	if(form1.nik_ibu_dr_suami.value.substring(0,1) == 'A' && form1.radiobutton3[0].checked == true)
	{
		alert("Pilihan Warga Negara Ibu tidak sesuai dengan NIK  !")
		tp1.setSelectedIndex(2)
		return false
	}
        if(form1.radiobutton2[1].checked == true) {
	   if(form1.nama_ibu_suami.value == "")
	   {
		alert("Nama Lengkap Ibu belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_ibu_suami.disabled = false;
		form1.nama_ibu_suami.focus()
		return false
	   }

	   if(form1.agama_ibu_suami.options[0].selected == true)
	   {
		alert("Agama belum diisi !")
		tp1.setSelectedIndex(2)
                form1.agama_ibu_suami.disabled = false;
		form1.agama_ibu_suami.focus()
		return false
	   }

	   if(form1.tgl_lhr_ibu_suami_dd.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(2)
                form1.agama_ibu_suami.disabled = false;
		form1.tgl_lhr_ibu_suami_dd.focus()
		form1.tgl_lhr_ibu_suami_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_suami_dd.value.length != 2)
	   {
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(2)
                form1.tgl_lhr_ibu_suami_dd.disabled = false;
		form1.tgl_lhr_ibu_suami_dd.focus()
		form1.tgl_lhr_ibu_suami_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_suami_mm.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(2)
                form1.tgl_lhr_ibu_suami_mm.disabled = false;
		form1.tgl_lhr_ibu_suami_mm.focus()
		form1.tgl_lhr_ibu_suami_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_suami_mm.value.length != 2)
	   {
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(2)
                form1.tgl_lhr_ibu_suami_mm.disabled = false;
		form1.tgl_lhr_ibu_suami_mm.focus()
		form1.tgl_lhr_ibu_suami_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_suami_yy.value == "" )
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(2)
                form1.tgl_lhr_ibu_suami_yy.disabled = false;
		form1.tgl_lhr_ibu_suami_yy.focus()
		form1.tgl_lhr_ibu_suami_yy.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_suami_yy.value.length != 4)
	   {
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(2)
                form1.tgl_lhr_ibu_suami_yy.disabled = false;
		form1.tgl_lhr_ibu_suami_yy.focus()
		form1.tgl_lhr_ibu_suami_yy.value=""
		return(false)
	   }
        }
	if(form1.radiobutton3[0].checked == true) {
           if (form1.jenis_pkrjn_ibu_suami.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(2)
                form1.jenis_pkrjn_ibu_suami.disabled = false;
		form1.jenis_pkrjn_ibu_suami.focus()
		return false
	   }
	} else if(form1.radiobutton3[1].checked == true) {
           if (form1.jenis_pkrjn_ibu_suami.options[0].selected == true) {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(2)
                form1.jenis_pkrjn_ibu_suami.disabled = false;
		form1.jenis_pkrjn_ibu_suami.focus()
		return false
          }
	}
        if(form1.radiobutton2[1].checked == true) {
	   if(form1.alamat_ibu_suami.value == "" )
	   {
		alert("Alamat belum diisi !")
		tp1.setSelectedIndex(2)
                form1.alamat_ibu_suami.disabled = false;
		form1.alamat_ibu_suami.focus()
		return(false)
	   }

	   //if(form1.rt_ibu_suami.value == "" || parseInt(form1.rt_ibu_suami.value)<=0)
           if(form1.rt_ibu_suami.value != "" && parseInt(form1.rt_ibu_suami.value,10)<=0)
	   {
		//alert("RT Ibu dari Suami belum diisi !")
                alert("RW Ibu dari Suami Salah !")
		tp1.setSelectedIndex(2)
                form1.rt_ibu_suami.disabled = false;
		form1.rt_ibu_suami.focus()
		return(false)
	   }

           if(form1.rw_ibu_suami.value != "" && parseInt(form1.rw_ibu_suami.value,10)<=0 )
	   {
		alert("RW Ibu dari Suami Salah !")
		tp1.setSelectedIndex(2)
                form1.rw_ibu_suami.disabled = false;
		form1.rw_ibu_suami.focus()
		return(false)
	   }

	   if(form1.kpos_ibu_suami.value != "" && form1.kpos_ibu_suami.value.length!=5 )
	   {
		alert("Kode Pos Ibu dari Suami Salah !")
		tp1.setSelectedIndex(2)
                form1.kpos_ibu_suami.disabled = false;
		form1.kpos_ibu_suami.focus()
		return(false)
	   }

          if(form1.tlp_ibu_suami.value != "" && form1.tlp_ibu_suami.value.length <7 )
  	  {
		alert("Nomor Telepon Ibu dari Suami Salah !")
		tp1.setSelectedIndex(1)
                form1.tlp_ibu_suami.disabled = false;
		form1.tlp_ibu_suami.focus()
		return(false)
	  }
           if(form1.nama_prop_ibu_suami.value == "" )
	   {
		alert("Nama Provinsi belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_prop_ibu_suami.disabled = false;
		form1.nama_prop_ibu_suami.focus()
		return(false)
	   }
           if(form1.nama_kab_ibu_suami.value == "" )
	   {
		alert("Nama Kabupaten belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_kab_ibu_suami.disabled = false;
		form1.nama_kab_ibu_suami.focus()
		return(false)
	   }
           if(form1.nama_kec_ibu_suami.value == "" )
	   {
		alert("Nama Kecamatan belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_kec_ibu_suami.disabled = false;
		form1.nama_kec_ibu_suami.focus()
		return(false)
	   }
           if(form1.nama_kel_ibu_suami.value == "" )
	   {
		alert("Nama Kelurahan belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_kel_ibu_suami.disabled = false;
		form1.nama_kel_ibu_suami.focus()
		return(false)
	   }
        }

	if(form1.kwn_ke_istri.value == "")
	{
		alert("Perkawinan ke belum diisi !")
		tp1.setSelectedIndex(3)
                form1.kwn_ke_istri.disabled = false;
		form1.kwn_ke_istri.focus()
		return false
	} else	if(parseInt(form1.kwn_ke_istri.value,10)<=0) {
		alert("Data Perkawinan ke salah !")
		tp1.setSelectedIndex(3)
                form1.kwn_ke_istri.disabled = false;
		form1.kwn_ke_istri.focus()
		return false
	}


	// *********************   Validations for Data Ayah dari Istri *********************


	var l= parseInt(form1.tgl_lhr_ayh_istri_mm.value,10)

	switch(l)
	{
	       case 4:

			if(form1.tgl_lhr_ayh_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_istri_dd.disabled = false;
				form1.tgl_lhr_ayh_istri_dd.focus()
				form1.tgl_lhr_ayh_istri_dd.value=""
				return(false)
			}

		case 6:

			if(form1.tgl_lhr_ayh_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_istri_dd.disabled = false;
				form1.tgl_lhr_ayh_istri_dd.focus()
				form1.tgl_lhr_ayh_istri_dd.value=""
				return(false)
			}

		case 9:

			if(form1.tgl_lhr_ayh_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_istri_dd.disabled = false;
				form1.tgl_lhr_ayh_istri_dd.focus()
				form1.tgl_lhr_ayh_istri_dd.value=""
				return(false)
			}

		case 11:

			if(form1.tgl_lhr_ayh_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ayh_istri_dd.disabled = false;
				form1.tgl_lhr_ayh_istri_dd.focus()
				form1.tgl_lhr_ayh_istri_dd.value=""
				return(false)
			}

	}
	if(form1.radiobutton5[0].checked != true && form1.radiobutton5[1].checked != true)
	{
		alert("Warga Negara Ayah dari Istri belum diisi !")
		tp1.setSelectedIndex(4)
		return false
	}
	if(form1.nik_ayh_dr_istri.value.substring(0,1) == 'A' && form1.radiobutton5[0].checked == true)
	{
		alert("Pilihan Warga Negara Ayah tidak sesuai dengan NIK !")
		tp1.setSelectedIndex(4)
		return false
	}
        if(form1.radiobutton4[1].checked == true) {
	   if(form1.nama_ayh_istri.value == "")
	   {
		alert("Nama Lengkap Ayah belum diisi !")
		tp1.setSelectedIndex(4)
                form1.nama_ayh_istri.disabled = false;
		form1.nama_ayh_istri.focus()
		return false
	   }
	   if(form1.agama_ayh_istri.options[0].selected == true)
	   {
		alert("Agama belum diisi !")
		tp1.setSelectedIndex(4)
                form1.agama_ayh_istri.disabled = false;
		form1.agama_ayh_istri.focus()
		return false
	   }

	   if(form1.tgl_lhr_ayh_istri_dd.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(4)
                form1.tgl_lhr_ayh_istri_dd.disabled = false;
		form1.tgl_lhr_ayh_istri_dd.focus()
		form1.tgl_lhr_ayh_istri_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_istri_dd.value.length != 2)
	   {
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(4)
                form1.tgl_lhr_ayh_istri_dd.disabled = false;
		form1.tgl_lhr_ayh_istri_dd.focus()
		form1.tgl_lhr_ayh_istri_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_istri_mm.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(4)
                form1.tgl_lhr_ayh_istri_mm.disabled = false;
		form1.tgl_lhr_ayh_istri_mm.focus()
		form1.tgl_lhr_ayh_istri_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_istri_mm.value.length != 2)
	   {
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(4)
                form1.tgl_lhr_ayh_istri_mm.disabled = false;
		form1.tgl_lhr_ayh_istri_mm.focus()
		form1.tgl_lhr_ayh_istri_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_istri_yy.value == "" )
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(4)
                form1.tgl_lhr_ayh_istri_yy.disabled = false;
		form1.tgl_lhr_ayh_istri_yy.focus()
		form1.tgl_lhr_ayh_istri_yy.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ayh_istri_yy.value.length != 4)
	   {
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(4)
                form1.tgl_lhr_ayh_istri_yy.disabled = false;
		form1.tgl_lhr_ayh_istri_yy.focus()
		form1.tgl_lhr_ayh_istri_yy.value=""
		return(false)
	   }
        }
	if(form1.radiobutton5[0].checked == true) {
           if (form1.jenis_pkrjn_ayh_istri.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(4)
                form1.jenis_pkrjn_ayh_istri.disabled = false;
		form1.jenis_pkrjn_ayh_istri.focus()
		return false
	   }
	} else if(form1.radiobutton5[1].checked == true) {
           if (form1.jenis_pkrjn_ayh_istri.options[0].selected == true) {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(4)
                form1.jenis_pkrjn_ayh_istri.disabled = false;
		form1.jenis_pkrjn_ayh_istri.focus()
		return false
          }
	}
        if(form1.radiobutton4[1].checked == true) {
	   if(form1.alamat_ayh_istri.value == "" )
	   {
		alert("Alamat belum diisi !")
		tp1.setSelectedIndex(4)
                form1.alamat_ayh_istri.disabled = false;
		form1.alamat_ayh_istri.focus()
		return(false)
	   }

	   //if(form1.rt_ayh_istri.value == "" || parseInt(form1.rt_ayh_istri.value)<=0)
           if(form1.rt_ayh_istri.value != "" && parseInt(form1.rt_ayh_istri.value,10)<=0)
	   {
		//alert("RT Ayah dari Istri belum diisi !")
                alert("RT Ayah dari Istri Salah !")
		tp1.setSelectedIndex(4)
                form1.rt_ayh_istri.disabled = false;
		form1.rt_ayh_istri.focus()
		return(false)
	   }

	   if(form1.rw_ayh_istri.value != "" && parseInt(form1.rw_ayh_istri.value,10)<=0 )
	   {
		alert("RW Ayah dari Istri Salah !")
		tp1.setSelectedIndex(4)
                form1.rw_ayh_istri.disabled = false;
		form1.rw_ayh_istri.focus()
		return(false)
	   }

	   if(form1.kpos_ayh_istri.value != "" && form1.kpos_ayh_istri.value.length!=5 )
	   {
		alert("Kode Pos Ayah dari Istri Salah !")
		tp1.setSelectedIndex(4)
                form1.kpos_ayh_istri.disabled = false;
		form1.kpos_ayh_istri.focus()
		return(false)
	   }

          if(form1.tlp_ayh_istri.value != "" && form1.tlp_ayh_istri.value.length <7 )
  	  {
		alert("Nomor Telepon Ayah dari Istri Salah !")
		tp1.setSelectedIndex(4)
                form1.tlp_ayh_istri.disabled = false;
		form1.tlp_ayh_istri.focus()
		return(false)
	  }
           if(form1.nama_prop_ayh_istri.value == "" )
	   {
		alert("Nama Provinsi belum diisi !")
		tp1.setSelectedIndex(4)
                form1.nama_prop_ayh_istri.disabled = false;
		form1.nama_prop_ayh_istri.focus()
		return(false)
	   }
           if(form1.nama_kab_ayh_istri.value == "" )
	   {
		alert("Nama Kabupaten belum diisi !")
		tp1.setSelectedIndex(4)
                form1.nama_kab_ayh_istri.disabled = false;
		form1.nama_kab_ayh_istri.focus()
		return(false)
	   }
           if(form1.nama_kec_ayh_istri.value == "" )
	   {
		alert("Nama Kecamatan belum diisi !")
		tp1.setSelectedIndex(4)
                form1.nama_kec_ayh_istri.disabled = false;
		form1.nama_kec_ayh_istri.focus()
		return(false)
	   }
           if(form1.nama_kel_ayh_istri.value == "" )
	   {
		alert("Nama Kelurahan belum diisi !")
		tp1.setSelectedIndex(4)
                form1.nama_kel_ayh_istri.disabled = false;
		form1.nama_kel_ayh_istri.focus()
		return(false)
	   }
        }


	// ******************  Validations for Data Ibu dari Istri ***********************


	var m = parseInt(form1.tgl_lhr_ibu_istri_mm.value,10)

	switch(m)
	{
	       case 4:

			if(form1.tgl_lhr_ibu_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_istri_dd.disabled = false;
				form1.tgl_lhr_ibu_istri_dd.focus()
				form1.tgl_lhr_ibu_istri_dd.value=""
				return(false)
			}

		case 6:

			if(form1.tgl_lhr_ibu_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_istri_dd.disabled = false;
				form1.tgl_lhr_ibu_istri_dd.focus()
				form1.tgl_lhr_ibu_istri_dd.value=""
				return(false)
			}

		case 9:

			if(form1.tgl_lhr_ibu_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_istri_dd.disabled = false;
				form1.tgl_lhr_ibu_istri_dd.focus()
				form1.tgl_lhr_ibu_istri_dd.value=""
				return(false)
			}

		case 11:

			if(form1.tgl_lhr_ibu_istri_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !")
                                form1.tgl_lhr_ibu_istri_dd.disabled = false;
				form1.tgl_lhr_ibu_istri_dd.focus()
				form1.tgl_lhr_ibu_istri_dd.value=""
				return(false)
			}

	}
	if(form1.radiobutton7[0].checked != true && form1.radiobutton7[1].checked != true)
	{
		alert("Warga Negara Ibu dari Istri belum diisi !")
		tp1.setSelectedIndex(5)
		return false
	}
	if(form1.nik_ibu_dr_istri.value.substring(0,1) == 'A' && form1.radiobutton7[0].checked == true)
	{
		alert("Pilihan Warga Negara Ibu tidak sesuai dengan NIK  !")
		tp1.setSelectedIndex(5)
		return false
	}
        if(form1.radiobutton6[1].checked == true) {
   	   if(form1.nama_ibu_istri.value == "")
	   {
		alert("Nama Lengkap Ibu belum diisi !")
		tp1.setSelectedIndex(5)
                form1.nama_ibu_istri.disabled = false;
		form1.nama_ibu_istri.focus()
		return false
	   }

	   if(form1.agama_ibu_istri.options[0].selected == true)
	   {
		alert("Agama belum diisi !")
		tp1.setSelectedIndex(5)
                form1.agama_ibu_istri.disabled = false;
		form1.agama_ibu_istri.focus()
		return false
	   }

	   if(form1.tgl_lhr_ibu_istri_dd.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(5)
                form1.tgl_lhr_ibu_istri_dd.disabled = false;
		form1.tgl_lhr_ibu_istri_dd.focus()
		form1.tgl_lhr_ibu_istri_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_istri_dd.value.length != 2)
	   {
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(5)
                form1.tgl_lhr_ibu_istri_dd.disabled = false;
		form1.tgl_lhr_ibu_istri_dd.focus()
		form1.tgl_lhr_ibu_istri_dd.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_istri_mm.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(5)
                form1.tgl_lhr_ibu_istri_mm.disabled = false;
		form1.tgl_lhr_ibu_istri_mm.focus()
		form1.tgl_lhr_ibu_istri_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_istri_mm.value.length != 2)
	   {
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(5)
                form1.tgl_lhr_ibu_istri_mm.disabled = false;
		form1.tgl_lhr_ibu_istri_mm.focus()
		form1.tgl_lhr_ibu_istri_mm.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_istri_yy.value == "" )
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(5)
                form1.tgl_lhr_ibu_istri_yy.disabled = false;
		form1.tgl_lhr_ibu_istri_yy.focus()
		form1.tgl_lhr_ibu_istri_yy.value=""
		return(false)
	   }
	   if(form1.tgl_lhr_ibu_istri_yy.value.length != 4)
	   {
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(5)
                form1.tgl_lhr_ibu_istri_yy.disabled = false;
		form1.tgl_lhr_ibu_istri_yy.focus()
		form1.tgl_lhr_ibu_istri_yy.value=""
		return(false)
	   }
        }
	if(form1.radiobutton7[0].checked == true) {
           if (form1.jenis_pkrjn_ibu_istri.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(5)
                form1.jenis_pkrjn_ibu_istri.disabled = false;
		form1.jenis_pkrjn_ibu_istri.focus()
		return false
	   }
	} else if(form1.radiobutton7[1].checked == true) {
           if (form1.jenis_pkrjn_ibu_istri.options[0].selected == true) {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(5)
                form1.jenis_pkrjn_ibu_istri.disabled = false;
		form1.jenis_pkrjn_ibu_istri.focus()
		return false
          }
	}
        if(form1.radiobutton6[1].checked == true) {
	   if(form1.alamat_ibu_istri.value == "" )
	   {
		alert("Alamat belum diisi !")
		tp1.setSelectedIndex(5)
                form1.alamat_ibu_istri.disabled = false;
		form1.alamat_ibu_istri.focus()
		return(false)
	   }

	   //if(form1.rt_ibu_istri.value == "" || parseInt(form1.rt_ibu_istri.value)<=0)
           if(form1.rt_ibu_istri.value != "" && parseInt(form1.rt_ibu_istri.value,10)<=0)
	   {
		//alert("RT Ibu dari Istri belum diisi !")
                alert("RT Ibu dari Istri Salah !")
		tp1.setSelectedIndex(5)
                form1.rt_ibu_istri.disabled = false;
		form1.rt_ibu_istri.focus()
		return(false)
	   }

	   if(form1.rw_ibu_istri.value != "" && parseInt(form1.rw_ibu_istri.value,10)<=0 )
	   {
		alert("RW Ibu dari Istri Salah !")
		tp1.setSelectedIndex(5)
                form1.rw_ibu_istri.disabled = false;
		form1.rw_ibu_istri.focus()
		return(false)
	   }

	   if(form1.kpos_ibu_istri.value != "" && form1.kpos_ibu_istri.value.length!=5 )
	   {
		alert("Kode Pos Ibu dari Istri Salah !")
		tp1.setSelectedIndex(5)
                form1.kpos_ibu_istri.disabled = false;
		form1.kpos_ibu_istri.focus()
		return(false)
	   }

          if(form1.tlp_ibu_istri.value != "" && form1.tlp_ibu_istri.value.length <7 )
  	  {
		alert("Nomor Telepon Ibu dari Istri Salah !")
		tp1.setSelectedIndex(5)
                form1.tlp_ibu_istri.disabled = false;
		form1.tlp_ibu_istri.focus()
		return(false)
	  }
           if(form1.nama_prop_ibu_istri.value == "" )
	   {
		alert("Nama Provinsi belum diisi !")
		tp1.setSelectedIndex(5)
                form1.nama_prop_ibu_istri.disabled = false;
		form1.nama_prop_ibu_istri.focus()
		return(false)
	   }
           if(form1.nama_kab_ibu_istri.value == "" )
	   {
		alert("Nama Kabupaten belum diisi !")
		tp1.setSelectedIndex(5)
                form1.nama_kab_ibu_istri.disabled = false;
		form1.nama_kab_ibu_istri.focus()
		return(false)
	   }
           if(form1.nama_kec_ibu_istri.value == "" )
  	   {
		alert("Nama Kecamatan belum diisi !")
		tp1.setSelectedIndex(5)
                form1.nama_kec_ibu_istri.disabled = false;
		form1.nama_kec_ibu_istri.focus()
		return(false)
	   }
           if(form1.nama_kel_ibu_istri.value == "" )
           {
		alert("Nama Kelurahan belum diisi !")
		tp1.setSelectedIndex(5)
                form1.nama_kel_ibu_istri.disabled = false;
		form1.nama_kel_ibu_istri.focus()
		return(false)
	   }
        }

if (trim(form1.tgl_pembktan_kwn_dd.value)=="")
{
        alert("Tanggal Pemberkatan Perkawinan belum diisi!");
       tp1.setSelectedIndex(8);
       form1.tgl_pembktan_kwn_dd.disabled = false;
       form1.tgl_pembktan_kwn_dd.focus();
     return false;
} else if (form1.tgl_pembktan_kwn_dd.value.length != 2)
{
        alert("Tanggal Pemberkatan Perkawinan harus 2 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_pembktan_kwn_dd.disabled = false;
       form1.tgl_pembktan_kwn_dd.focus();
     return false;
}
if (trim(form1.tgl_pembktan_kwn_mm.value)=="")
{
        alert("Bulan Pemberkatan Perkawinan belum diisi!");
       tp1.setSelectedIndex(8);
       form1.tgl_pembktan_kwn_mm.disabled = false;
       form1.tgl_pembktan_kwn_mm.focus();
     return false;
} else if (form1.tgl_pembktan_kwn_mm.value.length != 2)
{
        alert("Bulan Pemberkatan Perkawinan harus 2 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_pembktan_kwn_mm.disabled = false;
       form1.tgl_pembktan_kwn_mm.focus();
     return false;
}
if (trim(form1.tgl_pembktan_kwn_yy.value)=="")
{
        alert("Tahun Pemberkatan Perkawinan belum diisi!");
       tp1.setSelectedIndex(8);
       form1.tgl_pembktan_kwn_yy.disabled = false;
       form1.tgl_pembktan_kwn_yy.focus();
     return false;
} else if (form1.tgl_pembktan_kwn_yy.value.length != 4)
{
        alert("Tahun Pemberkatan Perkawinan harus 4 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_pembktan_kwn_yy.disabled = false;
       form1.tgl_pembktan_kwn_yy.focus();
     return false;
}

if (trim(form1.tgl_mlapor_dd.value)=="")
{
        alert("Tanggal Melapor Perkawinan belum diisi!");
       tp1.setSelectedIndex(8);
       form1.tgl_mlapor_dd.disabled = false;
       form1.tgl_mlapor_dd.focus();
     return false;
} else if (form1.tgl_mlapor_dd.value.length != 2)
{
        alert("Tanggal Melapor Perkawinan harus 2 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_mlapor_dd.disabled = false;
       form1.tgl_mlapor_dd.focus();
     return false;
}
if (trim(form1.tgl_mlapor_mm.value)=="")
{
        alert("Bulan Melapor Perkawinan belum diisi!");
       tp1.setSelectedIndex(8);
       form1.tgl_mlapor_mm.disabled = false;
       form1.tgl_mlapor_mm.focus();
     return false;
} else if (form1.tgl_mlapor_mm.value.length != 2)
{
        alert("Bulan Melapor Perkawinan harus 2 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_mlapor_mm.disabled = false;
       form1.tgl_mlapor_mm.focus();
     return false;
}
if (trim(form1.tgl_mlapor_yy.value)=="")
{
        alert("Tahun Melapor Perkawinan belum diisi!");
       tp1.setSelectedIndex(8);
       form1.tgl_mlapor_yy.disabled = false;
       form1.tgl_mlapor_yy.focus();
     return false;
} else if (form1.tgl_mlapor_yy.value.length != 4)
{
        alert("Tahun Melapor Perkawinan harus 4 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_mlapor_yy.disabled = false;
       form1.tgl_mlapor_yy.focus();
     return false;
}
if (trim(form1.pukul_lhr1.value)=="")
  {
     alert("Jam/Waktu Melapor belum diisi!");
     tp1.setSelectedIndex(8);
     form1.pukul_lhr1.disabled = false;
     form1.pukul_lhr1.focus();
     return false;
  } else if (form1.pukul_lhr1.value.length !=2)
  {
     alert("Jam/Waktu Melapor harus 2 digit!");
     tp1.setSelectedIndex(8);
     form1.pukul_lhr1.disabled = false;
     form1.pukul_lhr1.focus();
     return false;
  }
if (trim(form1.pukul_lhr2.value)=="")
  {
     alert("Jam/Waktu Melapor belum diisi!");
     tp1.setSelectedIndex(8);
     form1.pukul_lhr2.disabled = false;
     form1.pukul_lhr2.focus();
     return false;
  } else if (form1.pukul_lhr2.value.length !=2)
  {
     alert("Jam/Waktu Melapor harus 2 digit!");
     tp1.setSelectedIndex(8);
     form1.pukul_lhr2.disabled = false;
     form1.pukul_lhr2.focus();
     return false;
  }
if (form1.wkt_pkl_lhr.selectedIndex==0)
  {
     alert("Waktu Melapor belum dipilih!");
     tp1.setSelectedIndex(8);
     form1.wkt_pkl_lhr.disabled = false;
     form1.wkt_pkl_lhr.focus();
      return false;
  }
    if (form1.tduk_agama.selectedIndex==0)
   {
              alert("Tunduk pada Agama belum dipilih!");
              tp1.setSelectedIndex(8);
              form1.tduk_agama.disabled = false;
              form1.tduk_agama.focus();
              return false;
   }

  if (form1.nama_tmpt_pnesah.selectedIndex==0)
   {
              alert("Nama tempat pengesahan perkawinan belum diisi!");
              tp1.setSelectedIndex(8);
              form1.nama_tmpt_pnesah.disabled = false;
              form1.nama_tmpt_pnesah.focus();
              return false;
   }


if (trim(form1.ket_nama_tmpt_pnesah.value)=="")
   {
              alert("Keterangan nama tempat pengesahan belum diisi!");
              tp1.setSelectedIndex(8);
              form1.ket_nama_tmpt_pnesah.disabled = false;
              form1.ket_nama_tmpt_pnesah.focus();
              return false;
   }

if (trim(form1.nama_pmka_agama.value)=="")
   {
              alert("Nama Pemuka Agama belum diisi!");
              tp1.setSelectedIndex(8);
              form1.nama_pmka_agama.disabled = false;
              form1.nama_pmka_agama.focus();
              return false;
   }

if (trim(form1.alamat_pmka_agama.value)=="")
   {
              alert("Alamat Pemuka Agama belum diisi!");
              tp1.setSelectedIndex(8);
              form1.alamat_pmka_agama.disabled = false;
              form1.alamat_pmka_agama.focus();
              return false;
   }

   //if (trim(form1.rt_pmka_agama.value)=="" || parseInt(form1.rt_pmka_agama.value)<=0)
   if (trim(form1.rt_pmka_agama.value)!="" && parseInt(form1.rt_pmka_agama.value,10)<=0)
   {
              //alert("RT Pemuka Agama belum diisi!");
              alert("RT Pemuka Agama Salah !")
              tp1.setSelectedIndex(8);
              form1.rt_pmka_agama.disabled = false;
              form1.rt_pmka_agama.focus();
              return false;
   }

	if(form1.rw_pmka_agama.value != "" && parseInt(form1.rw_pmka_agama.value,10)<=0 )
	{
		alert("RW Pemuka Agama Salah !")
		tp1.setSelectedIndex(8)
                form1.rw_pmka_agama.disabled = false;
		form1.rw_pmka_agama.focus()
		return(false)
	}

	if(form1.kpos_pmka_agama.value != "" && form1.kpos_pmka_agama.value.length!=5 )
	{
		alert("Kode Pos Pemuka Agama Salah !")
		tp1.setSelectedIndex(8)
                form1.kpos_pmka_agama.disabled = false;
		form1.kpos_pmka_agama.focus()
		return(false)
	}

          if(form1.tlp_pmka_agama.value != "" && form1.tlp_pmka_agama.value.length <7 )
  	  {
		alert("Nomor Telepon Pemuka Agama Salah !")
		tp1.setSelectedIndex(8)
                form1.tlp_pmka_agama.disabled = false;
		form1.tlp_pmka_agama.focus()
		return(false)
	  }
if (trim(form1.nama_prop_pmka_agama.value)=="")
{
       alert("Nama provinsi untuk Pemuka Agama belum diisi!");
       tp1.setSelectedIndex(8);
       form1.nama_prop_pmka_agama.disabled = false;
       form1.nama_prop_pmka_agama.focus();
    return false;
}

if (trim(form1.nama_kab_pmka_agama.value)=="")
{
       alert("Nama kabupaten untuk Pemuka Agama belum diisi!");
       tp1.setSelectedIndex(8);
       form1.nama_kab_pmka_agama.disabled = false;
       form1.nama_kab_pmka_agama.focus();
    return false;
}

if (trim(form1.nama_kec_pmka_agama.value)=="")
{
       alert("Nama kecamatan untuk Pemuka Agama belum diisi!");
       tp1.setSelectedIndex(8);
       form1.nama_kec_pmka_agama.disabled = false;
       form1.nama_kec_pmka_agama.focus();
    return false;
}

if (trim(form1.nama_kel_pmka_agama.value)=="")
{
       alert("Nama kelurahan untuk Pemuka Agama belum diisi!");
       tp1.setSelectedIndex(8);
       form1.nama_kel_pmka_agama.disabled = false;
       form1.nama_kel_pmka_agama.focus();
    return false;
}

if (form1.tgl_dft_kwn_ln_dd.value != "" || form1.tgl_dft_kwn_ln_mm.value != "" || form1.tgl_dft_kwn_ln_yy.value != "") {
  if (form1.tgl_dft_kwn_ln_dd.value == "" || form1.tgl_dft_kwn_ln_dd.value.length != 2) {
       alert("Tanggal Pendaftaran Perkawinan dari Luar Negeri harus 2 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_dft_kwn_ln_dd.disabled = false;
       form1.tgl_dft_kwn_ln_dd.focus();
    return false;
  }
  if (form1.tgl_dft_kwn_ln_mm.value == "" || form1.tgl_dft_kwn_ln_mm.value.length != 2) {
       alert("Bulan Pendaftaran Perkawinan dari Luar Negeri harus 2 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_dft_kwn_ln_mm.disabled = false;
       form1.tgl_dft_kwn_ln_mm.focus();
    return false;
  }
  if (form1.tgl_dft_kwn_ln_yy.value == "" || form1.tgl_dft_kwn_ln_yy.value.length <4 ) {
       alert("Tahun Pendaftaran Perkawinan dari Luar Negeri harus 4 digit!");
       tp1.setSelectedIndex(8);
       form1.tgl_dft_kwn_ln_yy.disabled = false;
       form1.tgl_dft_kwn_ln_yy.focus();
    return false;
  }
}

    if (form1.dsrhk_cttkwn.selectedIndex==0)
        {
                alert("Dasar Hukum Pencatatan Perkawinan belum di pilih !");
                 tp1.setSelectedIndex(9);
                 form1.dsrhk_cttkwn.disabled = false;
                 form1.dsrhk_cttkwn.focus();
               return(false);
        }

    if (form1.doc_per.selectedIndex==-1)
        {
                alert("Belum pilih Dokumen Persyaratan!");
                 tp1.setSelectedIndex(9);
                 form1.doc_per.focus();
               return(false);
        }
/*
    if (trim(form1.tgl_akta_kwn_dd.value)=="")
       {
               alert("Tanggal Akta Perkawinan belum diisi!");
               tp1.setSelectedIndex(9);
               form1.tgl_akta_kwn_dd.disabled = false;
               form1.tgl_akta_kwn_dd.focus();
              return false;
      } else if (form1.tgl_akta_kwn_dd.value.length !=2)
       {
               alert("Tanggal Akta Perkawinan harus 2 digit!");
               tp1.setSelectedIndex(9);
               form1.tgl_akta_kwn_dd.disabled = false;
               form1.tgl_akta_kwn_dd.focus();
              return false;
      }

       if (trim(form1.tgl_akta_kwn_mm.value)=="")
       {
               alert("Bulan Akta Perkawinan belum diisi!");
               tp1.setSelectedIndex(9);
               form1.tgl_akta_kwn_mm.disabled = false;
               form1.tgl_akta_kwn_mm.focus();
              return false;
      } else if (form1.tgl_akta_kwn_mm.value.length !=2)
       {
               alert("Tanggal Akta Perkawinan harus 2 digit!");
               tp1.setSelectedIndex(9);
               form1.tgl_akta_kwn_mm.disabled = false;
               form1.tgl_akta_kwn_mm.focus();
              return false;
      }

       if (trim(form1.tgl_akta_kwn_yy.value)=="")
       {
               alert("Tanggal Akta Perkawinan belum diisi!");
               tp1.setSelectedIndex(9);
               form1.tgl_akta_kwn_yy.disabled = false;
               form1.tgl_akta_kwn_yy.focus();
              return false;
      } else if (form1.tgl_akta_kwn_yy.value.length !=4)
       {
               alert("Tanggal Akta Perkawinan harus 4 digit!");
               tp1.setSelectedIndex(9);
               form1.tgl_akta_kwn_yy.disabled = false;
               form1.tgl_akta_kwn_yy.focus();
              return false;
      }
*/

if (trim(form1.nama_pet_reg.value)=="")
{
       alert("Nama petugas registrasi belum diisi!");
       tp1.setSelectedIndex(9);
       form1.nama_pet_reg.disabled = false;
       form1.nama_pet_reg.focus();
    return false;
}
if (trim(form1.nip_pet_reg.value)=="")
{
       alert("NIP petugas registrasi belum diisi!");
       tp1.setSelectedIndex(9);
       form1.nip_pet_reg.disabled = false;
       form1.nip_pet_reg.focus();
    return false;
}
    if ((trim(form1.dd_akta_kwn.value)!="")
            &&
          (trim(form1.mm_akta_kwn.value)!="")
            &&
             (trim(form1.yy_akta_kwn.value)!=""))
                 {
                    form1.tgl_akta_kawin.value=form1.dd_akta_kwn.value+"-"+form1.mm_akta_kwn.value+"-"+form1.yy_akta_kwn.value;
                 }
           else
             {
                 alert("Tanggal Akta Perkawinan belum diisi!");
                 form1.dd_akta_kwn.focus();
                 return (false);
             }
       form1.kon.disabled=true;
        //form1.sim.disabled = true;
        form1.kel.disabled = true;
       document.form1.action="KawinInput.jsp";
        document.form1.submit();
}

function kawin()
{

	// *********** Validations for Data Suami ***********************


	if(form1.nik_suami.value == "")
	{
		alert("NIK suami belum diisi !")
		tp1.setSelectedIndex(0)
                form1.nik_suami.disabled = false;
		form1.nik_suami.focus()
		return false
	}
       if(form1.nik_suami.value.length != 16 && form1.nik_suami.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK suami 16 digit !")
		tp1.setSelectedIndex(0)
                form1.nik_suami.disabled = false;
		form1.nik_suami.focus()
		return(false)
	}
	if(form1.nik_suami.value.substring(0,1) == 'A' && form1.nik_suami.value.length != 17)
	{
		alert("Pengisian NIK suami 17 digit !")
		tp1.setSelectedIndex(0)
                form1.nik_suami.disabled = false;
		form1.nik_suami.focus()
		return(false)
	}


	if(form1.radiobutton[0].checked != true && form1.radiobutton[1].checked != true)
	{
		alert("NIK ayah dari suami belum diisi !")
		tp1.setSelectedIndex(1)
		return false
	}
	if(form1.nik_ayh_dr_suami.value == "" && form1.radiobutton[0].checked == true)
	{
		alert("NIK belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nik_ayh_dr_suami.disabled = false;
		form1.nik_ayh_dr_suami.focus()
		return(false)
	}

	 if( form1.radiobutton[0].checked == true && form1.nik_ayh_dr_suami.value.length != 16 && form1.nik_ayh_dr_suami.value.substring(0,1) != 'A'  && form1.nik_ayh_dr_suami.disabled == false)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(1)
                form1.nik_ayh_dr_suami.disabled = false;
		form1.nik_ayh_dr_suami.focus()
		return(false)
	}
	if(form1.nik_ayh_dr_suami.value.substring(0,1) == 'A' && form1.nik_ayh_dr_suami.value.length != 17 && form1.radiobutton1[1].checked == true && form1.radiobutton[0].checked == true && form1.nik_ayh_dr_suami.disabled == false)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(1)
                form1.nik_ayh_dr_suami.disabled = false;
		form1.nik_ayh_dr_suami.focus()
		return(false)
	}

        if( form1.radiobutton1[0].checked!=true && form1.radiobutton1[1].checked!=true )
        {
                alert("Belum pilih Warga Negara Ayah dari Suami!");
		tp1.setSelectedIndex(1);
		return false;
        }

	if(form1.radiobutton2[0].checked != true && form1.radiobutton2[1].checked != true)
	{
		alert("NIK Ibu dari Suami belum diisi !")
		tp1.setSelectedIndex(2)
		return false
	}
	if(form1.radiobutton2[0].checked == true && form1.nik_ibu_dr_suami.value == "" )
	{
		alert("NIK belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nik_ibu_dr_suami.disabled = false;
		form1.nik_ibu_dr_suami.focus()
		return false
	}

        if( form1.radiobutton2[0].checked==true && form1.nik_ibu_dr_suami.value.length != 16 && form1.nik_ibu_dr_suami.value.substring(0,1) != 'A'  && form1.nik_ibu_dr_suami.disabled == false)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(2)
                form1.nik_ibu_dr_suami.disabled = false;
		form1.nik_ibu_dr_suami.focus()
		return(false)
	}
	if(form1.nik_ibu_dr_suami.value.substring(0,1) == 'A' && form1.nik_ibu_dr_suami.value.length != 17 && form1.radiobutton3[1].checked == true && form1.radiobutton2[0].checked == true && form1.nik_ibu_dr_suami.disabled == false)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(2)
                form1.nik_ibu_dr_suami.disabled = false;
		form1.nik_ibu_dr_suami.focus()
		return(false)
	}

        if( form1.radiobutton3[0].checked!=true && form1.radiobutton3[1].checked!=true )
        {
                alert("Belum pilih Warga Negara Ibu dari Suami!");
		tp1.setSelectedIndex(2);
		return false;
        }



	//	******************  Validations for Data Istri  *************************

	if(form1.nik_istri.value == "")
	{
		alert("NIK istri belum diisi !")
		tp1.setSelectedIndex(3)
                form1.nik_istri.disabled = false;
		form1.nik_istri.focus()
		return false
	}
       if(form1.nik_istri.value.length != 16 && form1.nik_istri.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK istri 16 digit !")
		tp1.setSelectedIndex(3)
                form1.nik_istri.disabled = false;
		form1.nik_istri.focus()
		return(false)
	}
	if(form1.nik_istri.value.substring(0,1) == 'A' && form1.nik_istri.value.length != 17)
	{
		alert("Pengisian NIK suami 17 digit !")
		tp1.setSelectedIndex(3)
                form1.nik_istri.disabled = false;
		form1.nik_istri.focus()
		return(false)
	}

	if(form1.radiobutton4[0].checked != true && form1.radiobutton4[1].checked != true)
	{
		alert("NIK Ayah dari Istri belum diisi !")
		tp1.setSelectedIndex(4)
		return false
	}
	if(form1.nik_ayh_dr_istri.value == "" && form1.radiobutton4[0].checked == true)
	{
		alert("NIK belum diisi !")
		tp1.setSelectedIndex(4)
                form1.nik_ayh_dr_istri.disabled = false;
		form1.nik_ayh_dr_istri.focus()
		return(false)
	}

	 if( form1.radiobutton4[0].checked==true && form1.nik_ayh_dr_istri.value.length != 16 && form1.nik_ayh_dr_istri.value.substring(0,1) != 'A'  && form1.nik_ayh_dr_istri.disabled == false)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(4)
                form1.nik_ayh_dr_istri.disabled = false;
		form1.nik_ayh_dr_istri.focus()
		return(false)
	}
	if(form1.nik_ayh_dr_istri.value.substring(0,1) == 'A' && form1.nik_ayh_dr_istri.value.length != 17 && form1.radiobutton5[1].checked == true && form1.radiobutton4[0].checked == true && form1.nik_ayh_dr_istri.disabled == false)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(4)
                form1.nik_ayh_dr_istri.disabled = false;
		form1.nik_ayh_dr_istri.focus()
		return(false)
	}

        if( form1.radiobutton5[0].checked!=true && form1.radiobutton5[1].checked!=true )
        {
                alert("Belum pilih Warga Negara Ayah dari Istri!");
		tp1.setSelectedIndex(4);
		return false;
        }

	if(form1.radiobutton6[0].checked != true && form1.radiobutton6[1].checked != true)
	{
		alert("NIK Ibu dari Istri belum diisi !")
		tp1.setSelectedIndex(5)
		return false
	}
	if(form1.radiobutton6[0].checked == true && form1.nik_ibu_dr_istri.value == "" )
	{
		alert("NIK belum diisi !")
		tp1.setSelectedIndex(5)
                form1.nik_ibu_dr_istri.disabled = false;
		form1.nik_ibu_dr_istri.focus()
		return false
	}

        if( form1.radiobutton6[0].checked==true && form1.nik_ibu_dr_istri.value.length != 16 && form1.nik_ibu_dr_istri.value.substring(0,1) != 'A'  && form1.nik_ibu_dr_istri.disabled == false)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(5)
                form1.nik_ibu_dr_istri.disabled = false;
		form1.nik_ibu_dr_istri.focus()
		return(false)
	}
	if(form1.nik_ibu_dr_istri.value.substring(0,1) == 'A' && form1.nik_ibu_dr_istri.value.length != 17 && form1.radiobutton7[1].checked == true && form1.radiobutton6[0].checked == true && form1.nik_ibu_dr_istri.disabled == false)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(5)
                form1.nik_ibu_dr_istri.disabled = false;
		form1.nik_ibu_dr_istri.focus()
		return(false)
	}

        if( form1.radiobutton7[0].checked!=true && form1.radiobutton7[1].checked!=true )
        {
                alert("Belum pilih Warga Negara Ibu dari Istri!");
		tp1.setSelectedIndex(5);
		return false;
        }


	// ********************   Validations for Saksi-1 and Saksi-II ************************


	if(form1.nik_sksi1.value == "")
	{
		alert("NIK Saksi-I belum diisi !")
		tp1.setSelectedIndex(6)
                form1.nik_sksi1.disabled = false;
		form1.nik_sksi1.focus()
		return false
	}
       if(form1.nik_sksi1.value.length != 16 && form1.nik_sksi1.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(6)
                form1.nik_sksi1.disabled = false;
		form1.nik_sksi1.focus()
		return(false)
	}
	if(form1.nik_sksi1.value.substring(0,1) == 'A' && form1.nik_sksi1.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(6)
                form1.nik_sksi1.disabled = false;
		form1.nik_sksi1.focus()
		return(false)
	}
	if(form1.nik_sksi2.value == "")
	{
		alert("NIK Saksi-II belum diisi !")
		tp1.setSelectedIndex(7)
                form1.nik_sksi2.disabled = false;
		form1.nik_sksi2.focus()
		return false
	}
       if(form1.nik_sksi2.value.length != 16 && form1.nik_sksi2.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(7)
                form1.nik_sksi2.disabled = false;
		form1.nik_sksi2.focus()
		return(false)
	}

	if(form1.nik_sksi2.value.substring(0,1) == 'A' && form1.nik_sksi2.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(7)
                form1.nik_sksi2.disabled = false;
		form1.nik_sksi2.focus()
		return(false)
	}

        if(form1.nik_suami.value == form1.nik_ayh_dr_suami.value) {
                alert("Isian Nik Suami dan Ayah Dari Suami tidak boleh sama!")
		tp1.setSelectedIndex(1)
		form1.nik_ayh_dr_suami.focus()
		return(false)
        }

        if(form1.nik_suami.value == form1.nik_ayh_dr_istri.value) {
                alert("Isian Nik Suami dan Ayah Dari Istri tidak boleh sama!")
		tp1.setSelectedIndex(4)
		form1.nik_ayh_dr_istri.focus()
		return(false)
        }

        if(form1.nik_ayh_dr_suami.value != "" && form1.nik_ayh_dr_suami.value == form1.nik_ayh_dr_istri.value) {
                alert("Isian Nik Ayah Dari Suami dan Ayah Dari Istri tidak boleh sama!")
		tp1.setSelectedIndex(4)
		form1.nik_ayh_dr_istri.focus()
		return(false)
        }

        if(form1.nik_istri.value == form1.nik_ibu_dr_suami.value) {
                alert("Isian Nik Istri dan Ibu Dari Suami tidak boleh sama!")
		tp1.setSelectedIndex(2)
		form1.nik_ibu_dr_suami.focus()
		return(false)
        }

        if(form1.nik_istri.value == form1.nik_ibu_dr_istri.value) {
                alert("Isian Nik Istri dan Ibu Dari Istri tidak boleh sama!")
		tp1.setSelectedIndex(5)
		form1.nik_ibu_dr_istri.focus()
		return(false)
        }

        if(form1.nik_ibu_dr_suami.value != "" && form1.nik_ibu_dr_suami.value == form1.nik_ibu_dr_istri.value) {
                alert("Isian Nik Ibu Dari Suami dan Ibu Dari Istri tidak boleh sama!")
		tp1.setSelectedIndex(5)
		form1.nik_ibu_dr_istri.focus()
		return(false)
        }

        if(form1.nik_sksi1.value == form1.nik_sksi2.value) {
                alert("Isian Nik Saksi I dan Saksi II tidak boleh sama!")
		tp1.setSelectedIndex(7)
		form1.nik_sksi2.focus()
		return(false)
        }

        document.form1.action="KawinList.jsp";
        document.form1.submit();
        if(form1.buttondisabled.value==1)
        {
        form1.kon.disabled=false;
        form1.sim.disabled = false;
        }
        else
        {
        form1.kon.disabled=true;
        //form1.sim.disabled = true;
        }



}

function num(s1)
{
	for(i = 0; i < s1.value.length;i++)
	{
		if(isNaN(s1.value.charAt(i)) || s1.value.charAt(i) == ' ')
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !!" )
                        s1.disabled = false;
			s1.focus()
		}
	}
}

function num1(s)
{
	for (i=0; i < s.value.length; i++)
	{
		if(!((s.value.charAt(i) >= 0 && s.value.charAt(i) <= 9 ) || (s.value.charAt(i) == 'A')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
                   s.disabled = false;
		   s.focus()
		}
	}
        return false
}

function char(s)
{
	for (i=0; i < s.value.length; i++)
	{
		 if(!((s.value.charAt(i) >= 'A' && s.value.charAt(i) <= 'Z') || (s.value.charAt(i) >= 'a' && s.value.charAt(i) <= 'z') || (s.value.charAt(i) == ' ') || (s.value.charAt(i) == ',') || (s.value.charAt(i) == '.') || (s.value.charAt(i) == "'")))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
                   s.disabled = false;
		   s.focus()
		}
	}
        return false
}

function tab()
{
	if(form1.pukul_lhr1.value.length > 1)
	{
		for(i = 0; i < form1.pukul_lhr1.value.length;i++)
		{
			if(isNaN(form1.pukul_lhr1.value.charAt(i)) || form1.pukul_lhr1.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.pukul_lhr1.disabled = false;
				form1.pukul_lhr1.focus()
				return(false)
			}
		}
			if(form1.pukul_lhr1.value > 24)
			{
				alert("Isian jam tidak benar,periksa kembali !")
                                form1.pukul_lhr1.disabled = false;
				form1.pukul_lhr1.focus()
				return(false)
			}
                        form1.pukul_lhr2.disabled = false;
			form1.pukul_lhr2.focus()
			return false
	}
}
function tab1()
{
	if(form1.pukul_lhr2.value.length > 1)
	{
		for(i = 0; i < form1.pukul_lhr2.value.length;i++)
		{
			if(isNaN(form1.pukul_lhr2.value.charAt(i)) || form1.pukul_lhr2.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.pukul_lhr2.disabled = false;
				form1.pukul_lhr2.focus()
				return(false)
			}
		}
			if(form1.pukul_lhr2.value > 60)
			{
				alert("Isian menit tidak benar,periksa kembali !")
                                form1.pukul_lhr2.disabled = false;
				form1.pukul_lhr2.focus()
				return(false)
			}
                        form1.wkt_pkl_lhr.disabled = false;
			form1.wkt_pkl_lhr.focus()
			return false
	}
}


function tab3()
{

	if(form1.tgl_lhr_ayh_suami_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ayh_suami_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ayh_suami_dd.value.charAt(i)) || form1.tgl_lhr_ayh_suami_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ayh_suami_dd.disabled = false;
				form1.tgl_lhr_ayh_suami_dd.focus()
				form1.tgl_lhr_ayh_suami_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ayh_suami_dd.value > 31 || form1.tgl_lhr_ayh_suami_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_suami_dd.disabled = false;
			form1.tgl_lhr_ayh_suami_dd.focus()
			form1.tgl_lhr_ayh_suami_dd.value=""
			return(false)
		}
                form1.tgl_lhr_ayh_suami_mm.disabled = false;
		form1.tgl_lhr_ayh_suami_mm.focus()
		return false
	}
}
function tab33()
{

	if(form1.tgl_lhr_ayh_istri_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ayh_istri_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ayh_istri_dd.value.charAt(i)) || form1.tgl_lhr_ayh_istri_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ayh_istri_dd.disabled = false;
				form1.tgl_lhr_ayh_istri_dd.focus()
				form1.tgl_lhr_ayh_istri_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ayh_istri_dd.value > 31 || form1.tgl_lhr_ayh_istri_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_istri_dd.disabled = false;
			form1.tgl_lhr_ayh_istri_dd.focus()
			form1.tgl_lhr_ayh_istri_dd.value=""
			return(false)
		}
                form1.tgl_lhr_ayh_istri_mm.disabled = false;
		form1.tgl_lhr_ayh_istri_mm.focus()
		return false
	}
}
function tab4()
{
	if(form1.tgl_lhr_ayh_suami_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ayh_suami_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ayh_suami_mm.value.charAt(i)) || form1.tgl_lhr_ayh_suami_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ayh_suami_mm.disabled = false;
				form1.tgl_lhr_ayh_suami_mm.focus()
				form1.tgl_lhr_ayh_suami_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ayh_suami_mm.value > 12 || form1.tgl_lhr_ayh_suami_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_suami_mm.disabled = false;
			form1.tgl_lhr_ayh_suami_mm.focus()
			form1.tgl_lhr_ayh_suami_mm.value=""
			return(false)
		}
                form1.tgl_lhr_ayh_suami_yy.disabled = false;
		form1.tgl_lhr_ayh_suami_yy.focus()
		return false
	}
}
function tab44()
{
	if(form1.tgl_lhr_ayh_istri_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ayh_istri_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ayh_istri_mm.value.charAt(i)) || form1.tgl_lhr_ayh_istri_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ayh_istri_mm.disabled = false;
				form1.tgl_lhr_ayh_istri_mm.focus()
				form1.tgl_lhr_ayh_istri_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ayh_istri_mm.value > 12 || form1.tgl_lhr_ayh_istri_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_istri_mm.disabled = false;
			form1.tgl_lhr_ayh_istri_mm.focus()
			form1.tgl_lhr_ayh_istri_mm.value=""
			return(false)
		}
                form1.tgl_lhr_ayh_istri_yy.disabled = false;
		form1.tgl_lhr_ayh_istri_yy.focus()
		return false
	}
}
function tab5()
{
	d = new Date(form1.tgl_lhr_ayh_suami_mm.value+"/"+form1.tgl_lhr_ayh_suami_dd.value+"/"+form1.tgl_lhr_ayh_suami_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_lhr_ayh_suami_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_lhr_ayh_suami_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ayh_suami_yy.value.charAt(i)) || form1.tgl_lhr_ayh_suami_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ayh_suami_yy.disabled = false;
				form1.tgl_lhr_ayh_suami_yy.focus()
				form1.tgl_lhr_ayh_suami_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_lhr_ayh_suami_yy.value < 1900 || form1.tgl_lhr_ayh_suami_yy.value > d3 || form1.tgl_lhr_ayh_suami_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_suami_yy.disabled = false;
			form1.tgl_lhr_ayh_suami_yy.focus()
			form1.tgl_lhr_ayh_suami_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_suami_yy.disabled = false;
			form1.tgl_lhr_ayh_suami_yy.focus()
			form1.tgl_lhr_ayh_suami_yy.value=""
                        form1.tgl_lhr_ayh_suami_mm.disabled = false;
			form1.tgl_lhr_ayh_suami_mm.focus()
			form1.tgl_lhr_ayh_suami_mm.value=""
                        form1.tgl_lhr_ayh_suami_dd.disabled = false;
			form1.tgl_lhr_ayh_suami_dd.focus()
			form1.tgl_lhr_ayh_suami_dd.value=""

			return(false)
		}
                if (form1.radiobutton1[0].checked==true) {
                  form1.jenis_pkrjn_ayh_suami.disabled = false;
		  form1.jenis_pkrjn_ayh_suami.focus()
                } else {
                  form1.jenis_pkrjn_ayh_suami.disabled = false;
		  form1.jenis_pkrjn_ayh_suami.focus()
                }
		return false
	}
}
function tab55()
{
	d = new Date(form1.tgl_lhr_ayh_istri_mm.value+"/"+form1.tgl_lhr_ayh_istri_dd.value+"/"+form1.tgl_lhr_ayh_istri_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_lhr_ayh_istri_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_lhr_ayh_istri_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ayh_istri_yy.value.charAt(i)) || form1.tgl_lhr_ayh_istri_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ayh_istri_yy.disabled = false;
				form1.tgl_lhr_ayh_istri_yy.focus()
				form1.tgl_lhr_ayh_istri_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_lhr_ayh_istri_yy.value < 1900 || form1.tgl_lhr_ayh_istri_yy.value > d3 || form1.tgl_lhr_ayh_istri_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_istri_yy.disabled = false;
			form1.tgl_lhr_ayh_istri_yy.focus()
			form1.tgl_lhr_ayh_istri_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ayh_istri_yy.disabled = false;
			form1.tgl_lhr_ayh_istri_yy.focus()
			form1.tgl_lhr_ayh_istri_yy.value=""
                        form1.tgl_lhr_ayh_istri_mm.disabled = false;
			form1.tgl_lhr_ayh_istri_mm.focus()
			form1.tgl_lhr_ayh_istri_mm.value=""
                        form1.tgl_lhr_ayh_istri_dd.disabled = false;
			form1.tgl_lhr_ayh_istri_dd.focus()
			form1.tgl_lhr_ayh_istri_dd.value=""

			return(false)
		}
                if (form1.radiobutton5[0].checked==true) {
                  form1.jenis_pkrjn_ayh_istri.disabled = false;
		  form1.jenis_pkrjn_ayh_istri.focus()
                } else {
                  form1.jenis_pkrjn_ayh_istri.disabled = false;
		  form1.jenis_pkrjn_ayh_istri.focus()
                }
		return false
	}
}

function tab6()
{

	if(form1.tgl_lhr_ibu_suami_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ibu_suami_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ibu_suami_dd.value.charAt(i)) || form1.tgl_lhr_ibu_suami_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ibu_suami_dd.disabled = false;
				form1.tgl_lhr_ibu_suami_dd.focus()
				form1.tgl_lhr_ibu_suami_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ibu_suami_dd.value > 31 || form1.tgl_lhr_ibu_suami_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_suami_dd.disabled = false;
			form1.tgl_lhr_ibu_suami_dd.focus()
			form1.tgl_lhr_ibu_suami_dd.value=""
			return(false)
		}
                form1.tgl_lhr_ibu_suami_mm.disabled = false;
		form1.tgl_lhr_ibu_suami_mm.focus()
		return false
	}
}

function tab7()
{
	if(form1.tgl_lhr_ibu_suami_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ibu_suami_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ibu_suami_mm.value.charAt(i)) || form1.tgl_lhr_ibu_suami_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ibu_suami_mm.disabled = false;
				form1.tgl_lhr_ibu_suami_mm.focus()
				form1.tgl_lhr_ibu_suami_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ibu_suami_mm.value > 12 || form1.tgl_lhr_ibu_suami_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_suami_mm.disabled = false;
			form1.tgl_lhr_ibu_suami_mm.focus()
			form1.tgl_lhr_ibu_suami_mm.value=""
			return(false)
		}
                form1.tgl_lhr_ibu_suami_yy.disabled = false;

		form1.tgl_lhr_ibu_suami_yy.focus()
		return false
	}
}

function tab8()
{
	d = new Date(form1.tgl_lhr_ibu_suami_mm.value+"/"+form1.tgl_lhr_ibu_suami_dd.value+"/"+form1.tgl_lhr_ibu_suami_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_lhr_ibu_suami_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_lhr_ibu_suami_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ibu_suami_yy.value.charAt(i)) || form1.tgl_lhr_ibu_suami_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ibu_suami_yy.disabled = false;
				form1.tgl_lhr_ibu_suami_yy.focus()
				form1.tgl_lhr_ibu_suami_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_lhr_ibu_suami_yy.value < 1900 || form1.tgl_lhr_ibu_suami_yy.value > d3 || form1.tgl_lhr_ibu_suami_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_suami_yy.disabled = false;
			form1.tgl_lhr_ibu_suami_yy.focus()
			form1.tgl_lhr_ibu_suami_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_suami_yy.disabled = false;
			form1.tgl_lhr_ibu_suami_yy.focus()
			form1.tgl_lhr_ibu_suami_yy.value=""
                        form1.tgl_lhr_ibu_suami_mm.disabled = false;
			form1.tgl_lhr_ibu_suami_mm.focus()
			form1.tgl_lhr_ibu_suami_mm.value=""
                        form1.tgl_lhr_ibu_suami_dd.disabled = false;
			form1.tgl_lhr_ibu_suami_dd.focus()
			form1.tgl_lhr_ibu_suami_dd.value=""

			return(false)
		}
                if (form1.radiobutton3[0].checked==true) {
                  form1.jenis_pkrjn_ibu_suami.disabled = false;
		  form1.jenis_pkrjn_ibu_suami.focus()
                } else {
                  form1.jenis_pkrjn_ibu_suami.disabled = false;
		  form1.jenis_pkrjn_ibu_suami.focus()
                }
		return false
	}
}

function tab9()
{

	if(form1.tgl_lhr_ibu_istri_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ibu_istri_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ibu_istri_dd.value.charAt(i)) || form1.tgl_lhr_ibu_istri_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ibu_istri_dd.disabled = false;
				form1.tgl_lhr_ibu_istri_dd.focus()
				form1.tgl_lhr_ibu_istri_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ibu_istri_dd.value > 31 || form1.tgl_lhr_ibu_istri_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_istri_dd.disabled = false;
			form1.tgl_lhr_ibu_istri_dd.focus()
			form1.tgl_lhr_ibu_istri_dd.value=""
			return(false)
		}
                form1.tgl_lhr_ibu_istri_mm.disabled = false;
		form1.tgl_lhr_ibu_istri_mm.focus()
		return false
	}
}

function tab10()
{
	if(form1.tgl_lhr_ibu_istri_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_lhr_ibu_istri_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ibu_istri_mm.value.charAt(i)) || form1.tgl_lhr_ibu_istri_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ibu_istri_mm.disabled = false;
				form1.tgl_lhr_ibu_istri_mm.focus()
				form1.tgl_lhr_ibu_istri_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_lhr_ibu_istri_mm.value > 12 || form1.tgl_lhr_ibu_istri_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_istri_mm.disabled = false;
			form1.tgl_lhr_ibu_istri_mm.focus()
			form1.tgl_lhr_ibu_istri_mm.value=""
			return(false)
		}
                form1.tgl_lhr_ibu_istri_yy.disabled = false;
		form1.tgl_lhr_ibu_istri_yy.focus()
		return false
	}
}
function tab11()
{
	d = new Date(form1.tgl_lhr_ibu_istri_mm.value+"/"+form1.tgl_lhr_ibu_istri_dd.value+"/"+form1.tgl_lhr_ibu_istri_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_lhr_ibu_istri_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_lhr_ibu_istri_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_lhr_ibu_istri_yy.value.charAt(i)) || form1.tgl_lhr_ibu_istri_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_lhr_ibu_istri_yy.disabled = false;
				form1.tgl_lhr_ibu_istri_yy.focus()
				form1.tgl_lhr_ibu_istri_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_lhr_ibu_istri_yy.value < 1900 || form1.tgl_lhr_ibu_istri_yy.value > d3 || form1.tgl_lhr_ibu_istri_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_istri_yy.disabled = false;
			form1.tgl_lhr_ibu_istri_yy.focus()
			form1.tgl_lhr_ibu_istri_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_lhr_ibu_istri_yy.disabled = false;
			form1.tgl_lhr_ibu_istri_yy.focus()
			form1.tgl_lhr_ibu_istri_yy.value=""
                        form1.tgl_lhr_ibu_istri_mm.disabled = false;
			form1.tgl_lhr_ibu_istri_mm.focus()
			form1.tgl_lhr_ibu_istri_mm.value=""
                        form1.tgl_lhr_ibu_istri_dd.disabled = false;
			form1.tgl_lhr_ibu_istri_dd.focus()
			form1.tgl_lhr_ibu_istri_dd.value=""

			return(false)
		}
                if (form1.radiobutton7[0].checked==true) {
                  form1.jenis_pkrjn_ibu_istri.disabled = false;
		  form1.jenis_pkrjn_ibu_istri.focus()
                } else {
                  form1.jenis_pkrjn_ibu_istri.disabled = false;
		  form1.jenis_pkrjn_ibu_istri.focus()
                }
		return false
	}
}



function  radioValid()
{
	form1.nik_ayh_dr_suami.disabled=false
	form1.nama_ayh_suami.disabled=true
	form1.agama_ayh_suami.disabled=true
	form1.tmpt_lhr_ayh_suami.disabled=true
	form1.tgl_lhr_ayh_suami_dd.disabled=true
	form1.tgl_lhr_ayh_suami_mm.disabled=true
	form1.tgl_lhr_ayh_suami_yy.disabled=true
	form1.alamat_ayh_suami.disabled=true
	form1.rt_ayh_suami.disabled=true
	form1.rw_ayh_suami.disabled=true
	form1.dusun_ayh_suami.disabled=true
	form1.kpos_ayh_suami.disabled=true
	form1.tlp_ayh_suami.disabled=true
	form1.nama_prop_ayh_suami.disabled=true
	form1.nama_kab_ayh_suami.disabled=true
	form1.nama_kec_ayh_suami.disabled=true
	form1.nama_kel_ayh_suami.disabled=true
        form1.nik_ayh_dr_suami.disabled = false;
	form1.nik_ayh_dr_suami.focus()
}
function  radioValid1()
{
	form1.nik_ayh_dr_suami.disabled=true
	form1.nama_ayh_suami.disabled=false
	form1.agama_ayh_suami.disabled=false
	form1.tmpt_lhr_ayh_suami.disabled=false
	form1.tgl_lhr_ayh_suami_dd.disabled=false
	form1.tgl_lhr_ayh_suami_mm.disabled=false
	form1.tgl_lhr_ayh_suami_yy.disabled=false
	form1.alamat_ayh_suami.disabled=false
	form1.rt_ayh_suami.disabled=false
	form1.rw_ayh_suami.disabled=false
	form1.dusun_ayh_suami.disabled=false
	form1.kpos_ayh_suami.disabled=false
	form1.tlp_ayh_suami.disabled=false
	form1.nama_prop_ayh_suami.disabled=false
	form1.nama_kab_ayh_suami.disabled=false
	form1.nama_kec_ayh_suami.disabled=false
	form1.nama_kel_ayh_suami.disabled=false
        form1.nama_ayh_suami.disabled = false;
	form1.nama_ayh_suami.focus()
}

function  radioValid2()
{
	if(form1.radiobutton1[0].checked == true)
	{
                form1.jenis_pkrjn_ayh_suami.disabled = false;
		form1.jenis_pkrjn_ayh_suami.focus()
	}

}
function  radioValid3()
{

	if(form1.radiobutton1[1].checked == true )
	{
                form1.jenis_pkrjn_ayh_suami.disabled = false;
		form1.jenis_pkrjn_ayh_suami.focus()
	}
}

function  radioValid4()
{
	form1.nik_ibu_dr_suami.disabled=false
	form1.nama_ibu_suami.disabled=true
	form1.agama_ibu_suami.disabled=true
	form1.tmpt_lhr_ibu_suami.disabled=true
	form1.tgl_lhr_ibu_suami_dd.disabled=true
	form1.tgl_lhr_ibu_suami_mm.disabled=true
	form1.tgl_lhr_ibu_suami_yy.disabled=true
	form1.alamat_ibu_suami.disabled=true
	form1.rt_ibu_suami.disabled=true
	form1.rw_ibu_suami.disabled=true
	form1.dusun_ibu_suami.disabled=true
	form1.kpos_ibu_suami.disabled=true
	form1.tlp_ibu_suami.disabled=true
	form1.nama_prop_ibu_suami.disabled=true
	form1.nama_kab_ibu_suami.disabled=true
	form1.nama_kec_ibu_suami.disabled=true
	form1.nama_kel_ibu_suami.disabled=true
        form1.nik_ibu_dr_suami.disabled = false;
	form1.nik_ibu_dr_suami.focus()
}
function  radioValid5()
{
	form1.nik_ibu_dr_suami.disabled=true
	form1.nama_ibu_suami.disabled=false
	form1.agama_ibu_suami.disabled=false
	form1.tmpt_lhr_ibu_suami.disabled=false
	form1.tgl_lhr_ibu_suami_dd.disabled=false
	form1.tgl_lhr_ibu_suami_mm.disabled=false
	form1.tgl_lhr_ibu_suami_yy.disabled=false
	form1.alamat_ibu_suami.disabled=false
	form1.rt_ibu_suami.disabled=false
	form1.rw_ibu_suami.disabled=false
	form1.dusun_ibu_suami.disabled=false
	form1.kpos_ibu_suami.disabled=false
	form1.tlp_ibu_suami.disabled=false
	form1.nama_prop_ibu_suami.disabled=false
	form1.nama_kab_ibu_suami.disabled=false
	form1.nama_kec_ibu_suami.disabled=false
	form1.nama_kel_ibu_suami.disabled=false
        form1.nama_ibu_suami.disabled = false;
	form1.nama_ibu_suami.focus()
}

function  radioValid6()
{
	if(form1.radiobutton3[0].checked == true)
	{
                form1.jenis_pkrjn_ibu_suami.disabled = false;
		form1.jenis_pkrjn_ibu_suami.focus()
	}

}
function  radioValid7()
{

	if(form1.radiobutton3[1].checked == true )
	{
                form1.jenis_pkrjn_ibu_suami.disabled = false;
		form1.jenis_pkrjn_ibu_suami.focus()
	}
}

function  radioValid8()
{
	form1.nik_ayh_dr_istri.disabled=false
	form1.nama_ayh_istri.disabled=true
	form1.agama_ayh_istri.disabled=true
	form1.tmpt_lhr_ayh_istri.disabled=true
	form1.tgl_lhr_ayh_istri_dd.disabled=true
	form1.tgl_lhr_ayh_istri_mm.disabled=true
	form1.tgl_lhr_ayh_istri_yy.disabled=true
	form1.alamat_ayh_istri.disabled=true
	form1.rt_ayh_istri.disabled=true
	form1.rw_ayh_istri.disabled=true
	form1.dusun_ayh_istri.disabled=true
	form1.kpos_ayh_istri.disabled=true
	form1.tlp_ayh_istri.disabled=true
	form1.nama_prop_ayh_istri.disabled=true
	form1.nama_kab_ayh_istri.disabled=true
	form1.nama_kec_ayh_istri.disabled=true
	form1.nama_kel_ayh_istri.disabled=true
        form1.nik_ayh_dr_istri.disabled = false;
	form1.nik_ayh_dr_istri.focus()
}
function  radioValid9()
{
	form1.nik_ayh_dr_istri.disabled=true
	form1.nama_ayh_istri.disabled=false
	form1.agama_ayh_istri.disabled=false
	form1.tmpt_lhr_ayh_istri.disabled=false
	form1.tgl_lhr_ayh_istri_dd.disabled=false
	form1.tgl_lhr_ayh_istri_mm.disabled=false
	form1.tgl_lhr_ayh_istri_yy.disabled=false
	form1.alamat_ayh_istri.disabled=false
	form1.rt_ayh_istri.disabled=false
	form1.rw_ayh_istri.disabled=false
	form1.dusun_ayh_istri.disabled=false
	form1.kpos_ayh_istri.disabled=false
	form1.tlp_ayh_istri.disabled=false
	form1.nama_prop_ayh_istri.disabled=false
	form1.nama_kab_ayh_istri.disabled=false
	form1.nama_kec_ayh_istri.disabled=false
	form1.nama_kel_ayh_istri.disabled=false
        form1.nama_ayh_istri.disabled = false;
	form1.nama_ayh_istri.focus()

}

function  radioValid10()
{
	if(form1.radiobutton5[0].checked == true)
	{
                form1.jenis_pkrjn_ayh_istri.disabled = false;
		form1.jenis_pkrjn_ayh_istri.focus()
	}

}
function  radioValid11()
{

	if(form1.radiobutton5[1].checked == true )
	{
                form1.jenis_pkrjn_ayh_istri.disabled = false;
		form1.jenis_pkrjn_ayh_istri.focus()
	}
}

function  radioValid12()
{
	form1.nik_ibu_dr_istri.disabled=false
	form1.nama_ibu_istri.disabled=true
	form1.agama_ibu_istri.disabled=true
	form1.tmpt_lhr_ibu_istri.disabled=true
	form1.tgl_lhr_ibu_istri_dd.disabled=true
	form1.tgl_lhr_ibu_istri_mm.disabled=true
	form1.tgl_lhr_ibu_istri_yy.disabled=true
	form1.alamat_ibu_istri.disabled=true
	form1.rt_ibu_istri.disabled=true
	form1.rw_ibu_istri.disabled=true
	form1.dusun_ibu_istri.disabled=true
	form1.kpos_ibu_istri.disabled=true
	form1.tlp_ibu_istri.disabled=true
	form1.nama_prop_ibu_istri.disabled=true
	form1.nama_kab_ibu_istri.disabled=true
	form1.nama_kec_ibu_istri.disabled=true
	form1.nama_kel_ibu_istri.disabled=true
        form1.nik_ibu_dr_istri.disabled = false;
	form1.nik_ibu_dr_istri.focus()
}
function  radioValid13()
{
	form1.nik_ibu_dr_istri.disabled=true
	form1.nama_ibu_istri.disabled=false
	form1.agama_ibu_istri.disabled=false
	form1.tmpt_lhr_ibu_istri.disabled=false
	form1.tgl_lhr_ibu_istri_dd.disabled=false
	form1.tgl_lhr_ibu_istri_mm.disabled=false
	form1.tgl_lhr_ibu_istri_yy.disabled=false
	form1.alamat_ibu_istri.disabled=false
	form1.rt_ibu_istri.disabled=false
	form1.rw_ibu_istri.disabled=false
	form1.dusun_ibu_istri.disabled=false
	form1.kpos_ibu_istri.disabled=false
	form1.tlp_ibu_istri.disabled=false
	form1.nama_prop_ibu_istri.disabled=false
	form1.nama_kab_ibu_istri.disabled=false
	form1.nama_kec_ibu_istri.disabled=false
	form1.nama_kel_ibu_istri.disabled=false
        form1.nama_ibu_istri.disabled = false;
	form1.nama_ibu_istri.focus()
}

function  radioValid14()
{
	if(form1.radiobutton7[0].checked == true)
	{
                form1.jenis_pkrjn_ibu_istri.disabled = false;
		form1.jenis_pkrjn_ibu_istri.focus()
	}

}
function  radioValid15()
{

	if(form1.radiobutton7[1].checked == true )
	{
                form1.jenis_pkrjn_ibu_istri.disabled = false;
		form1.jenis_pkrjn_ibu_istri.focus()
	}
}


