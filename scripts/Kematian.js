function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function validateWNIbu(nik_ibu,radiobtn)
{
var tmp_nik=trim(nik_ibu.value);

 if(tmp_nik!="")
{
	if(tmp_nik.substring(0,1) == 'A')
	{
           if ((parseInt(tmp_nik.substring(7,9),10)>=41) && (parseInt(tmp_nik.substring(7,9),10)<=71))
{
             radiobtn[1].disabled = false;
             radiobtn[1].checked = true;
             radiobtn[0].disabled = true;
}
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
{
              radiobtn[0].disabled = false;
              radiobtn[0].checked = true;
              radiobtn[1].disabled = true;
}
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
{
             radiobtn[1].disabled = false;
             radiobtn[1].checked = true;
             radiobtn[0].disabled = true;
}
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
{
              radiobtn[0].disabled = false;
              radiobtn[0].checked = true;
              radiobtn[1].disabled = true;
}
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


function checkNik1(a1,b1) {
  a=subNik(a1);
  b=subNik(b1);

  if( parseInt(trim(a),10)==parseInt(trim(b),10) )
  {
     alert("Isian Nik tidak boleh sama!");
     return false;
  }
return(true);
}

function checkNik2(a1,b1,c1,d1)
{
  a=subNik(trim(a1));
  b=subNik(trim(b1));
  c=subNik(trim(c1));
  d=subNik(trim(d1));

  if( parseInt(trim(a),10)==parseInt(trim(b),10) || parseInt(trim(a),10)==parseInt(trim(c),10) || parseInt(trim(c),10)==parseInt(trim(b),10)
      || parseInt(trim(a),10)==parseInt(trim(d),10) || parseInt(trim(b),10)==parseInt(trim(d),10) || parseInt(trim(c),10)==parseInt(trim(d),10) )
  {
     alert("Isian Nik tidak boleh sama!");
     return false;
  }
return(true);
}

function subNik(argNik)
{
var nik=argNik;
 if( argNik.substring(0,1)=='A' )
  {
     nik= argNik.substring(1);
  }

return nik;

}

function confirmasi(submitFlag)
{
if(form1.nik_jnsah.value == "")
	{
		alert("NIK Jenazah belum diisi !")
		tp1.setSelectedIndex(0)
                form1.nik_jnsah.disabled = false;
		form1.nik_jnsah.focus()
		return false
	}
       if(form1.nik_jnsah.value.length != 16 && form1.nik_jnsah.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(0)
                form1.nik_jnsah.disabled = false;
		form1.nik_jnsah.focus()
		return(false)
	}
	if(form1.nik_jnsah.value.substring(0,1) == 'A' && form1.nik_jnsah.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(0)
                form1.nik_jnsah.disabled = false;
		form1.nik_jnsah.focus()
		return(false)
	}

        if(form1.radiobutton[0].checked != true && form1.radiobutton[1].checked != true)
    	   {
		alert("NIK Ibu belum diisi !")
		tp1.setSelectedIndex(1)
		return false
	   }


        if(form1.radiobutton[0].checked == true && trim(form1.nik_ibu.value) == "" )
   	   {
		alert("NIK Ibu belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nik_ibu.disabled = false;
		form1.nik_ibu.focus()
		return false
	   }

        if(form1.radiobutton[0].checked == true && form1.nik_ibu.value.length != 16 && form1.nik_ibu.value.substring(0,1) != 'A'  && form1.nik_ibu.disabled == false)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(1)
                form1.nik_ibu.disabled = false;
		form1.nik_ibu.focus()
		return(false)
	}
	if(form1.nik_ibu.value.substring(0,1) == 'A' && form1.nik_ibu.value.length != 17 && form1.radiobutton1[1].checked == true && form1.radiobutton[0].checked == true && form1.nik_ibu.disabled == false)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(1)
                form1.nik_ibu.disabled = false;
		form1.nik_ibu.focus()
		return(false)
	}

        if( form1.radiobutton1[0].checked!=true && form1.radiobutton1[1].checked!=true )
        {
                alert("Belum pilih Warga Negara Ibu!");
		tp1.setSelectedIndex(1);
		return false;
        }


if(form1.radiobutton3[0].checked != true && form1.radiobutton3[1].checked != true)
	{
		alert("NIK Ayah belum diisi !")
		tp1.setSelectedIndex(2)
		return false
	}

if(form1.nik_ayh.value == "" && form1.radiobutton3[0].checked == true)
	{
		alert("NIK belum Ayah diisi !")
		tp1.setSelectedIndex(2)
                form1.nik_ayh.disabled = false;
		form1.nik_ayh.focus()
		return(false)
	}
	 if(form1.radiobutton3[0].checked == true && form1.nik_ayh.value.length != 16 && form1.nik_ayh.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(2)
                form1.nik_ayh.disabled = false;
		form1.nik_ayh.focus()
		return(false)
	}
	if(form1.nik_ayh.value.substring(0,1) == 'A' && form1.nik_ayh.value.length != 17 && form1.radiobutton4[1].checked == true && form1.radiobutton3[0].checked == true && form1.nik_ayh.disabled == false)
	{
		alert("Pengisian NIK 17 with prefix as A digit !")
		tp1.setSelectedIndex(2)
                form1.nik_ayh.disabled = false;
		form1.nik_ayh.focus()
		return(false)
	}
        if( form1.radiobutton4[0].checked!=true && form1.radiobutton4[1].checked!=true )
        {
                alert("Belum pilih Warga Negara Ayah!");
		tp1.setSelectedIndex(2);
		return false;
        }




if(form1.nik_plpor.value == "" )
	{
		alert("NIK Pelapor belum diisi !")
		tp1.setSelectedIndex(3)
                form1.nik_plpor.disabled = false;
		form1.nik_plpor.focus()
		return(false)
	}
	 if(form1.nik_plpor.value.length != 16 && form1.nik_plpor.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(3)
                form1.nik_plpor.disabled = false;
		form1.nik_plpor.focus()
		return(false)
	}
	if(form1.nik_plpor.value.substring(0,1) == 'A' && form1.nik_plpor.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(3)
                form1.nik_plpor.disabled = false;
		form1.nik_plpor.focus()
		return(false)
	}

  if ((checkNik1(form1.nik_jnsah.value, form1.nik_plpor.value)) &&
      (checkNik2(form1.nik_ayh.value, form1.nik_ibu.value, form1.nik_jnsah.value, form1.nik_plpor.value)))
       {
if (submitFlag) {
     document.form1.action='Pencatatan_Kematian_List.jsp';
     document.form1.submit();
     form1.kon.disabled=true;
     form1.sim.disabled=true;
}
       }
    else return(false);
}


function kematian(submitFlag)
{
	// ************************** Validations for Data Jenazah ****************
        validasiTanggal(form1.tgl_mati_dd,form1.tgl_mati_mm,form1.tgl_mati_yy, 0)


	if(form1.nik_jnsah.value == "")
	{
		alert("NIK Jenazah belum diisi !")
		tp1.setSelectedIndex(0)
                form1.nik_jnsah.disabled = false;
		form1.nik_jnsah.focus()
		return false
	}
       if(form1.nik_jnsah.value.length != 16 && form1.nik_jnsah.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(0)
                form1.nik_jnsah.disabled = false;
		form1.nik_jnsah.focus()
		return(false)
	}
	if(form1.nik_jnsah.value.substring(0,1) == 'A' && form1.nik_jnsah.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(0)
                form1.nik_jnsah.disabled = false;
		form1.nik_jnsah.focus()
		return(false)
	}

	if(form1.anak_ke_mt.value == "")
	{
		alert("Anak ke belum diisi !")
		tp1.setSelectedIndex(0)
                form1.anak_ke_mt.disabled = false;
		form1.anak_ke_mt.focus()
		return (false)
	}

	if(form1.anak_ke_mt.value <= 0)
	{
		alert("Data Anak ke Salah!")
		tp1.setSelectedIndex(0)
                form1.anak_ke_mt.disabled = false;
		form1.anak_ke_mt.focus()
		return false
	}
	if(form1.tgl_mati_dd.value == "")
	{
		alert("Tanggal Kematian belum diisi !")
		tp1.setSelectedIndex(0)
                form1.tgl_mati_dd.disabled = false;
		form1.tgl_mati_dd.focus()
		form1.tgl_mati_dd.value=""
		return(false)
	}
	if(form1.tgl_mati_dd.value.length != 2)
	{
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(0)
                form1.tgl_mati_dd.disabled = false;
		form1.tgl_mati_dd.focus()
		form1.tgl_mati_dd.value=""
		return(false)
	}
	if(form1.tgl_mati_mm.value == "")
	{
		alert("Tanggal Kematian belum diisi !")
		tp1.setSelectedIndex(0)
                form1.tgl_mati_mm.disabled = false;
		form1.tgl_mati_mm.focus()
		form1.tgl_mati_mm.value=""
		return(false)
	}
	if(form1.tgl_mati_mm.value.length != 2)
	{
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(0)
                form1.tgl_mati_mm.disabled = false;
		form1.tgl_mati_mm.focus()
		form1.tgl_mati_mm.value=""
		return(false)
	}
	if(form1.tgl_mati_yy.value == "" )
	{
		alert("Tanggal Kematian belum diisi !")
		tp1.setSelectedIndex(0)
                form1.tgl_mati_yy.disabled = false;
		form1.tgl_mati_yy.focus()
		form1.tgl_mati_yy.value=""
		return(false)
	}
	if(form1.tgl_mati_yy.value.length != 4)
	{
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(0)
                form1.tgl_mati_yy.disabled = false;
		form1.tgl_mati_yy.focus()
		form1.tgl_mati_yy.value=""
		return(false)
	}


	if(form1.pukul_mt1.value == "")
	{
		alert("Pukul Mati belum diisi !")
		tp1.setSelectedIndex(0)
                form1.pukul_mt1.disabled = false;
		form1.pukul_mt1.focus()
		return false
	}
	if(form1.pukul_mt1.value.length != 2)
	{
		alert("Jam Mati harus 2 digit !")
		tp1.setSelectedIndex(0)
                form1.pukul_mt1.disabled = false;
		form1.pukul_mt1.focus()
		return false
	}

	if(form1.pukul_mt2.value == "")
	{
		alert("Pukul Mati belum diisi !")
		tp1.setSelectedIndex(0)
                form1.pukul_mt2.disabled = false;
		form1.pukul_mt2.focus()
		return false
	}
	if(form1.pukul_mt2.value.length != 2)
	{
		alert("Menit Mati harus 2 digit !")
		tp1.setSelectedIndex(0)
                form1.pukul_mt2.disabled = false;
		form1.pukul_mt2.focus()
		return false
	}
	if(form1.wkt_pkl_mt.options[0].selected == true)
	{
			alert("Waktu Pukul setempat belum diisi !")
			tp1.setSelectedIndex(0)
                        form1.wkt_pkl_mt.disabled = false;
			form1.wkt_pkl_mt.focus()
			return false
	}

	if(form1.sbab_mati.options[0].selected == true)
	{
			alert("Sebab Kematian belum diisi !")
			tp1.setSelectedIndex(0)
                        form1.sbab_mati.disabled = false;
			form1.sbab_mati.focus()
			return false
	}
	if(trim(form1.tmpt_mati.value) == "")
	{
		alert("Tempat Kematian belum diisi !")
		tp1.setSelectedIndex(0)
                form1.tmpt_mati.disabled = false;
		form1.tmpt_mati.focus()
		return false
	}

	if(form1.yg_mnerang.options[0].selected == true)
	{
		alert("Yang Menerangkan Kematian belum diisi !")
		tp1.setSelectedIndex(0)
                form1.yg_mnerang.disabled = false;
		form1.yg_mnerang.focus()
		return false
	}
        if (form1.tgl_pnetap.value != "" || form1.bln_pnetap.value != "" || form1.thn_pnetap.value != "") {
           validasiTanggal(form1.tgl_pnetap,form1.bln_pnetap,form1.thn_pnetap, 0)
        }


	// *********** Validations for NIK Ibu ***************


        validasiTanggal(form1.no_akta_lhr_dd,form1.no_akta_lhr_mm,form1.no_akta_lhr_yy, 1)

	if(form1.radiobutton[0].checked != true && form1.radiobutton[1].checked != true)
	{
		alert("NIK Ibu belum diisi !")
		tp1.setSelectedIndex(1)
		return false
	}
	if(form1.radiobutton1[0].checked != true && form1.radiobutton1[1].checked != true)
	{
		alert("Warga Negara Ibu belum diisi !")
		tp1.setSelectedIndex(1)
		return false
	}
	if(form1.radiobutton[0].checked == true && trim(form1.nik_ibu.value) == "" )
	{
		alert("NIK belum Ibu diisi !")
		tp1.setSelectedIndex(1)
                form1.nik_ibu.disabled = false;
		form1.nik_ibu.focus()
		return false
	}
	if(form1.nik_ibu.value.substring(0,1) == 'A' && form1.radiobutton1[0].checked == true)
	{
		alert("Pilihan Warga Negara Ibu tidak sesuai dengan NIK  !")
		tp1.setSelectedIndex(1)
		return false
	}

        if(form1.radiobutton[0].checked == true && form1.nik_ibu.value.length != 16 && form1.nik_ibu.value.substring(0,1) != 'A'  && form1.nik_ibu.disabled == false)
	{
		alert("Pengisian NIK ibu 16 digit !")
		tp1.setSelectedIndex(1)
                form1.nik_ibu.disabled = false;
		form1.nik_ibu.focus()
		return(false)
	}
	if(form1.nik_ibu.value.substring(0,1) == 'A' && form1.nik_ibu.value.length != 17 && form1.radiobutton1[1].checked == true && form1.radiobutton[0].checked == true && form1.nik_ibu.disabled == false)
	{
		alert("Pengisian NIK ibu 17 digit !")
		tp1.setSelectedIndex(1)
                form1.nik_ibu.disabled = false;
		form1.nik_ibu.focus()
		return(false)
	}

  //      if(form1.radiobutton[1].checked == true) {

	   if(trim(form1.nama_ibu.value) == "")
	   {
		alert("Nama Lengkap Ibu belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_ibu.disabled = false;
		form1.nama_ibu.focus()
		return false
          }
          if(form1.no_akta_lhr_dd.value == "")
	  {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(1)
                form1.no_akta_lhr_dd.disabled = false;
		form1.no_akta_lhr_dd.focus()
		form1.no_akta_lhr_dd.value=""
		return(false)
          }
          if(form1.no_akta_lhr_dd.value.length != 2)
	  {
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(1)
                form1.no_akta_lhr_dd.disabled = false;
		form1.no_akta_lhr_dd.focus()
		form1.no_akta_lhr_dd.value=""
		return(false)
	  }
	  if(form1.no_akta_lhr_mm.value == "")
	  {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(1)
                form1.no_akta_lhr_mm.disabled = false;
		form1.no_akta_lhr_mm.focus()
		form1.no_akta_lhr_mm.value=""
		return(false)
	  }
	  if(form1.no_akta_lhr_mm.value.length != 2)
	  {
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(1)
                form1.no_akta_lhr_mm.disabled = false;
		form1.no_akta_lhr_mm.focus()
		form1.no_akta_lhr_mm.value=""
		return(false)
	  }
	  if(form1.no_akta_lhr_yy.value == "" )
	  {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(1)
                form1.no_akta_lhr_yy.disabled = false;
		form1.no_akta_lhr_yy.focus()
		form1.no_akta_lhr_yy.value=""
		return(false)
	  }
	  if(form1.no_akta_lhr_yy.value.length != 4)
	  {
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(1)
                form1.no_akta_lhr_yy.disabled = false;
		form1.no_akta_lhr_yy.focus()
		form1.no_akta_lhr_yy.value=""
		return(false)
	  }
  //      }

	if(form1.radiobutton1[0].checked == true) {
           if (form1.jenis_pkrjn_ibu.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(1)
		form1.jenis_pkrjn_ibu.focus()
		return false
	   }
	}
	 else if(form1.radiobutton1[1].checked == true) {
           if (form1.jenis_pkrjn_ibu.options[0].selected == true) {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(1)
		form1.jenis_pkrjn_ibu.focus()
		return false
          }
	}

      /*  if(form1.radiobutton[1].checked == true) */{
	  if(trim(form1.alamat_ibu.value) == "" )
	  {
		alert("Alamat belum diisi !")
		tp1.setSelectedIndex(1)
                form1.alamat_ibu.disabled = false;
		form1.alamat_ibu.focus()
		return(false)
	  }
/*
	  if(form1.no_rt_ibu.value == "" )
	  {
		alert("RT belum diisi !")
		tp1.setSelectedIndex(1)
                form1.no_rt_ibu.disabled = false;
		form1.no_rt_ibu.focus()
		return(false)
	  }

	  if(form1.no_rt_ibu.value <=0 )
	  {
		alert("Nomor RT Salah !")
		tp1.setSelectedIndex(1)
                form1.no_rt_ibu.disabled = false;
		form1.no_rt_ibu.focus()
		return(false)
	  }
*/
          if(form1.no_rw_ibu.value != "" && form1.no_rw_ibu.value <=0 )
  	  {
		alert("Nomor RW Salah !")
		tp1.setSelectedIndex(1)
                form1.no_rw_ibu.disabled = false;
		form1.no_rw_ibu.focus()
		return(false)
	  }

          if(trim(form1.kodepos_ibu.value) != "" && form1.kodepos_ibu.value.length!=5 )
  	  {
		alert("Nomor Kodepos Salah !")
		tp1.setSelectedIndex(1)
                form1.kodepos_ibu.disabled = false;
		form1.kodepos_ibu.focus()
		return(false)
	  }

          if(trim(form1.telp_ibu.value) != "" && form1.telp_ibu.value.length <7 )
  	  {
		alert("Nomor Telepon Salah !")
		tp1.setSelectedIndex(1)
                form1.telp_ibu.disabled = false;
		form1.telp_ibu.focus()
		return(false)
	  }

  	  if(trim(form1.nama_prop_ibu.value) == "")
	  {
		alert("Nama Provinsi belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_prop_ibu.disabled = false;
		form1.nama_prop_ibu.focus()
		return(false)
	  }
	  if(trim(form1.nama_kab_ibu.value) == "")
	  {
		alert("Nama Kabupaten/Kota belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_kab_ibu.disabled = false;
		form1.nama_kab_ibu.focus()
		return(false)
	  }
	  if(trim(form1.nama_kec_ibu.value) == "")
	  {
		alert("Nama Kecamatan belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nama_kec_ibu.disabled = false;
		form1.nama_kec_ibu.focus()
		return(false)
	  }
	  if(trim(form1.nkelibu.value) == "")
	  {
		alert("Nama Desa/Kelurahan belum diisi !")
		tp1.setSelectedIndex(1)
                form1.nkelibu.disabled = false;
		form1.nkelibu.focus()
		return(false)
	  }
        }



	// *********** Validations for NIK Ayah ***************

        validasiTanggal(form1.no_akta_lhr_dd1,form1.no_akta_lhr_mm1,form1.no_akta_lhr_yy1, 2)



	if(form1.radiobutton3[0].checked != true && form1.radiobutton3[1].checked != true)
	{
		alert("NIK Ayah belum diisi !")
		tp1.setSelectedIndex(2)
		return false
	}
	if(form1.radiobutton4[0].checked != true && form1.radiobutton4[1].checked != true)
	{
		alert("Warga Negara Ayah belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nik_ayh.disabled = false;
		form1.nik_ayh.focus()
		return false
	}
	if(form1.nik_ayh.value == "" && form1.radiobutton3[0].checked == true)
	{
		alert("NIK belum Ayah diisi !")
		tp1.setSelectedIndex(2)
                form1.nik_ayh.disabled = false;
		form1.nik_ayh.focus()
		return(false)
	}
	if(form1.nik_ayh.value.substring(0,1) == 'A' && form1.radiobutton4[0].checked == true)
	{
		alert("Pilihan Warga Negara Ayah tidak sesuai dengan NIK !")
		tp1.setSelectedIndex(2)
		return false
	}

	 if(form1.nik_ayh.value.length != 16 && form1.nik_ayh.value!= "" && form1.nik_ayh.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK ayah 16 digit !")
		tp1.setSelectedIndex(2)
                form1.nik_ayh.disabled = false;
		form1.nik_ayh.focus()
		return(false)
	}
	if(form1.nik_ayh.value.substring(0,1) == 'A' && form1.nik_ayh.value.length != 17
&& form1.radiobutton4[1].checked == true && form1.radiobutton3[0].checked == true
&& form1.nik_ayh.disabled == false)
	{
		alert("Pengisian NIK ayah 17 with prefix as A digit !")
		tp1.setSelectedIndex(2)
                form1.nik_ayh.disabled = false;
		form1.nik_ayh.focus()
		return(false)
	}

    //    if(form1.radiobutton3[1].checked == true) {
	   if(trim(form1.nama_ayh.value) == "")
	   {
		alert("Nama Lengkap Ayah belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_ayh.disabled = false;
		form1.nama_ayh.focus()
		return false
	   }
	   if(form1.no_akta_lhr_dd1.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(2)
                form1.no_akta_lhr_dd1.disabled = false;
		form1.no_akta_lhr_dd1.focus()
		form1.no_akta_lhr_dd1.value=""
		return(false)
	   }
	   if(form1.no_akta_lhr_dd1.value.length != 2)
	   {
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(2)
                form1.no_akta_lhr_dd1.disabled = false;
		form1.no_akta_lhr_dd1.focus()
		form1.no_akta_lhr_dd1.value=""
		return(false)
	   }
	   if(form1.no_akta_lhr_mm1.value == "")
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(2)
                form1.no_akta_lhr_mm1.disabled = false;
		form1.no_akta_lhr_mm1.focus()
		form1.no_akta_lhr_mm1.value=""
		return(false)
	   }
	   if(form1.no_akta_lhr_mm1.value.length != 2)
	   {
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(2)
                form1.no_akta_lhr_mm1.disabled = false;
		form1.no_akta_lhr_mm1.focus()
		form1.no_akta_lhr_mm1.value=""
		return(false)
	   }
	   if(form1.no_akta_lhr_yy1.value == "" )
	   {
		alert("Tanggal Lahir belum diisi !")
		tp1.setSelectedIndex(2)
                form1.no_akta_lhr_yy1.disabled = false;
		form1.no_akta_lhr_yy1.focus()
		form1.no_akta_lhr_yy1.value=""
		return(false)
	   }
	   if(form1.no_akta_lhr_yy1.value.length != 4)
 	   {
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(2)
                form1.no_akta_lhr_yy1.disabled = false;
		form1.no_akta_lhr_yy1.focus()
		form1.no_akta_lhr_yy1.value=""
		return(false)
	   }
   //     }

	if(form1.radiobutton4[0].checked == true) {
           if (form1.jenis_pkrjn_ayh.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(2)
		form1.jenis_pkrjn_ayh.focus()
		return false
	   }
	} else if(form1.radiobutton4[1].checked == true) {
           if (form1.jenis_pkrjn_ayh.options[0].selected == true) {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(2)
		form1.jenis_pkrjn_ayh.focus()
		return false
          }
	}

       /* if(form1.radiobutton3[1].checked == true) */{

	   if(trim(form1.alamat_ayh.value) == "" )
	   {
		alert("Alamat belum diisi !")
		tp1.setSelectedIndex(2)
                form1.alamat_ayh.disabled = false;
		form1.alamat_ayh.focus()
		return(false)
	   }
/*
	   if(form1.no_rt_ayh.value == "" )
	   {
		alert("RT belum diisi !")
		tp1.setSelectedIndex(2)
                form1.no_rt_ayh.disabled = false;
		form1.no_rt_ayh.focus()
		return(false)
	   }

	   if(form1.no_rt_ayh.value <=0 )
	   {
		alert("Nomor RT Salah !")
		tp1.setSelectedIndex(2)
                form1.no_rt_ayh.disabled = false;
		form1.no_rt_ayh.focus()
		return(false)
	   }
*/
	   if(form1.no_rw_ayh.value != "" && form1.no_rw_ayh.value <=0 )
	   {
		alert("Nomor RW Salah !")
		tp1.setSelectedIndex(2)
                form1.no_rw_ayh.disabled = false;
		form1.no_rw_ayh.focus()
		return(false)
	   }

          if(trim(form1.kodepos_ayh.value) != "" && form1.kodepos_ayh.value.length!=5 )
  	  {
		alert("Nomor Kodepos Salah !")
		tp1.setSelectedIndex(2)
                form1.kodepos_ayh.disabled = false;
		form1.kodepos_ayh.focus()
		return(false)
	  }

          if(trim(form1.telp_ayh.value) != "" && form1.telp_ayh.value.length <7 )
  	  {
		alert("Nomor Telepon Salah !")
		tp1.setSelectedIndex(2)
                form1.telp_ayh.disabled = false;
		form1.telp_ayh.focus()
		return(false)
	  }

	   if(trim(form1.nama_prop_ayh.value) == "")
	   {
		alert("Nama Provinsi belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_prop_ayh.disabled = false;
		form1.nama_prop_ayh.focus()
		return(false)
	   }
	   if(trim(form1.nama_kab_ayh.value) == "")
	   {
		alert("Nama Kabupaten/Kota belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_kab_ayh.disabled = false;
		form1.nama_kab_ayh.focus()
		return(false)
	   }
	   if(trim(form1.nama_kec_ayh.value) == "")
	   {
		alert("Nama Kecamatan belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nama_kec_ayh.disabled = false;
		form1.nama_kec_ayh.focus()
		return(false)
	   }
	   if(trim(form1.nkelayh.value) == "")
	   {
		alert("Nama Desa/Kelurahan belum diisi !")
		tp1.setSelectedIndex(2)
                form1.nkelayh.disabled = false;
		form1.nkelayh.focus()
		return(false)
	   }
        }


// ***************** Validations for  Data Pelapor ***********************************

        validasiTanggal(form1.no_akta_lhr_dd2,form1.no_akta_lhr_mm2,form1.no_akta_lhr_yy2, 3)


	if(form1.nik_plpor.value == "" )
	{
		alert("NIK Pelapor belum diisi !")
		tp1.setSelectedIndex(3)
                form1.nik_plpor.disabled = false;
		form1.nik_plpor.focus()
		return(false)
	}
	 if(form1.nik_plpor.value.length != 16 && form1.nik_plpor.value.substring(0,1) != 'A')
	{
		alert("Pengisian Nomor KK 16 digit !")
		tp1.setSelectedIndex(3)
                form1.nik_plpor.disabled = false;
		form1.nik_plpor.focus()
		return(false)
	}
	if(form1.nik_plpor.value.substring(0,1) == 'A' && form1.nik_plpor.value.length != 17)
	{
		alert("Pengisian Nomor KK 17 digit !")
		tp1.setSelectedIndex(3)
                form1.nik_plpor.disabled = false;
		form1.nik_plpor.focus()
		return(false)
	}
        if(form1.nik_plpor.value.substring(0,1) != 'A') {
           if (form1.jenis_pkrjn_plpor.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(3)
		form1.jenis_pkrjn_plpor.focus()
		return false
	   }
	} else if(form1.nik_plpor.value.substring(0,1) == 'A') {
           if (form1.jenis_pkrjn_plpor.options[0].selected == true) {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(3)
		form1.jenis_pkrjn_plpor.focus()
		return false
          }
	}

	if(form1.no_akta_lhr_dd2.value == "")
	{
		alert("Tanggal Melapor belum diisi !")
		tp1.setSelectedIndex(3)
                form1.no_akta_lhr_dd2.disabled = false;
		form1.no_akta_lhr_dd2.focus()
		form1.no_akta_lhr_dd2.value=""
		return(false)
	}
	if( form1.no_akta_lhr_dd2.value.length != 2)
	{
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(3)
                form1.no_akta_lhr_dd2.disabled = false;
		form1.no_akta_lhr_dd2.focus()
		form1.no_akta_lhr_dd2.value=""
		return(false)
	}
	if(form1.no_akta_lhr_mm2.value == "")
	{
		alert("Tanggal Melapor belum diisi !")
		tp1.setSelectedIndex(3)
                form1.no_akta_lhr_mm2.disabled = false;
		form1.no_akta_lhr_mm2.focus()
		form1.no_akta_lhr_mm2.value=""
		return(false)
	}
	if( form1.no_akta_lhr_mm2.value.length != 2)
	{
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(3)
                form1.no_akta_lhr_mm2.disabled = false;
		form1.no_akta_lhr_mm2.focus()
		form1.no_akta_lhr_mm2.value=""
		return(false)
	}
	if(form1.no_akta_lhr_yy2.value == "" )
	{
		alert("Tanggal Melapor belum diisi !")
		tp1.setSelectedIndex(3)
                form1.no_akta_lhr_yy2.disabled = false;
		form1.no_akta_lhr_yy2.focus()
		form1.no_akta_lhr_yy2.value=""
		return(false)
	}
	if(form1.no_akta_lhr_yy2.value.length != 4)
	{
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(3)
                form1.no_akta_lhr_yy2.disabled = false;
		form1.no_akta_lhr_yy2.focus()
		form1.no_akta_lhr_yy2.value=""
		return(false)
	}

if (submitFlag) {
        form1.kon.disabled = true;
        //form1.sim.disabled = true;
        form1.kel.disabled = true;

           document.form1.action='KematianInput.jsp?sim=SIMPAN';
           document.form1.submit();
           //form1.kon.disabled=true;
           //form1.sim.disabled=true;
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
                        s1.value="";
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
                   s.value="";
                   s.disabled = false;
		   s.focus()
		}
	}
	if(s.value.substring(0,1) == 'A')
	{
	//	form1.jenis_pkrjn_plpor.options.disabled=true
	//	form1.jenis_pkrjn_plpor.options.disabled=false
	}
	if(s.value.substring(0,1) != 'A')
	{
	//	form1.jenis_pkrjn_plpor.options.disabled=false
	//	form1.jenis_pkrjn_plpor.options.disabled=true
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
                   s.value="";
                   s.disabled = false;
		   s.focus()
		}
	}
        return false
}

function tab()
{
	if(form1.pukul_mt1.value.length > 1)
	{
		for(i = 0; i < form1.pukul_mt1.value.length;i++)
		{
			if(isNaN(form1.pukul_mt1.value.charAt(i)) || form1.pukul_mt1.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.pukul_mt1.value="";
                                form1.pukul_mt1.disabled = false;
				form1.pukul_mt1.focus()
				return(false)
			}
		}
			if(form1.pukul_mt1.value > 24)
			{
				alert("Isian jam tidak benar,periksa kembali !")
                                form1.pukul_mt1.value="";
                                form1.pukul_mt1.disabled = false;
				form1.pukul_mt1.focus()
				return(false)
			}
                        form1.pukul_mt2.disabled = false;
			form1.pukul_mt2.focus()
			return false
	}
}
function tab1()
{
	if(form1.pukul_mt2.value.length > 1)
	{
		for(i = 0; i < form1.pukul_mt2.value.length;i++)
		{
			if(isNaN(form1.pukul_mt2.value.charAt(i)) || form1.pukul_mt2.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.pukul_mt2.value="";
                                form1.pukul_mt2.disabled = false;
				form1.pukul_mt2.focus()
				return(false)
			}
		}
			if(form1.pukul_mt2.value > 60)
			{
				alert("Isian menit tidak benar,periksa kembali !")
                                form1.pukul_mt2.value="";
                                form1.pukul_mt2.disabled = false;
				form1.pukul_mt2.focus()
				return(false)
			}

                        form1.wkt_pkl_mt.disabled = false;
			form1.wkt_pkl_mt.focus()
			return false
	}
}

function  radioValid1()
{
	if(form1.radiobutton[1].checked == true)
	{
		form1.jenis_pkrjn_ibu.options.disabled=false
	//	form1.jenis_pkrjn_ibu.options.disabled=true
                setupPekerjaan(form1.jenis_pkrjn_ibu, 1)
		form1.jenis_pkrjn_ibu.focus()
	}

}
function  radioValid2()
{

	if(form1.radiobutton[1].checked == true )
	{
		form1.jenis_pkrjn_ibu.options.disabled=false
//		form1.jenis_pkrjn_ibu.options.disabled=true
                setupPekerjaan(form1.jenis_pkrjn_ibu, 2)
		form1.jenis_pkrjn_ibu.focus()
	}
}

function  radioValid3()
{
	form1.nik_ibu.disabled=false
	form1.radiobutton1[0].disabled=false
	form1.radiobutton1[1].disabled=false
	form1.nama_ibu.disabled=true
	form1.no_akta_lhr_dd.disabled=true
	form1.no_akta_lhr_mm.disabled=true
	form1.no_akta_lhr_yy.disabled=true
	form1.alamat_ibu.disabled=true
	form1.no_rt_ibu.disabled=true
	form1.no_rw_ibu.disabled=true
	form1.dusun_ibu.disabled=true
	form1.kodepos_ibu.disabled=true
	form1.telp_ibu.disabled=true
	form1.nama_prop_ibu.disabled=true
	form1.nama_kab_ibu.disabled=true
	form1.nama_kec_ibu.disabled=true
	form1.nkelibu.disabled=true
	form1.nik_ibu.focus()
}
function  radioValid4()
{
	form1.nik_ibu.disabled=true
	form1.nik_ibu.value=""
	form1.radiobutton1[0].disabled=false
	form1.radiobutton1[1].disabled=false
	form1.nama_ibu.disabled=false
	form1.no_akta_lhr_dd.disabled=false
	form1.no_akta_lhr_mm.disabled=false
	form1.no_akta_lhr_yy.disabled=false
	form1.alamat_ibu.disabled=false
	form1.no_rt_ibu.disabled=false
	form1.no_rw_ibu.disabled=false
	form1.dusun_ibu.disabled=false
	form1.kodepos_ibu.disabled=false
	form1.telp_ibu.disabled=false
	form1.nama_prop_ibu.disabled=false
	form1.nama_kab_ibu.disabled=false
	form1.nama_kec_ibu.disabled=false
	form1.nkelibu.disabled=false
	form1.nama_ibu.focus()
}
function  radioValid7()
{
	if(form1.radiobutton3[1].checked == true )
	{
		form1.jenis_pkrjn_ayh.options.disabled=false
//		form1.jenis_pkrjn_ayh.options.disabled=true
                setupPekerjaan(form1.jenis_pkrjn_ayh, 1)
		form1.jenis_pkrjn_ayh.focus()
	}

}
function  radioValid8()
{

	if(form1.radiobutton3[1].checked == true)
	{
		form1.jenis_pkrjn_ayh.options.disabled=false
//		form1.jenis_pkrjn_ayh.options.disabled=true
                setupPekerjaan(form1.jenis_pkrjn_ayh, 2)
		form1.jenis_pkrjn_ayh.focus()
	}

}

function  radioValid5()
{
	form1.nik_ayh.disabled=false
	form1.radiobutton4[0].disabled=false
	form1.radiobutton4[1].disabled=false
	form1.nama_ayh.disabled=true
	form1.no_akta_lhr_dd1.disabled=true
	form1.no_akta_lhr_mm1.disabled=true
	form1.no_akta_lhr_yy1.disabled=true
	form1.alamat_ayh.disabled=true
	form1.no_rt_ayh.disabled=true
	form1.no_rw_ayh.disabled=true
	form1.dusun_ayh.disabled=true
	form1.kodepos_ayh.disabled=true
	form1.telp_ayh.disabled=true
	form1.nama_prop_ayh.disabled=true
	form1.nama_kab_ayh.disabled=true
	form1.nama_kec_ayh.disabled=true
	form1.nkelayh.disabled=true
	form1.nik_ayh.focus();
}

function  radioValid6()
{
        form1.nik_ayh.value="";
	form1.nik_ayh.disabled=true
	form1.radiobutton4[0].disabled=false
	form1.radiobutton4[1].disabled=false
        form1.nama_ayh.value="";
 	form1.nama_ayh.disabled=false
        form1.no_akta_lhr_dd1.value="";
	form1.no_akta_lhr_dd1.disabled=false
       form1.no_akta_lhr_mm1.value="";
	form1.no_akta_lhr_mm1.disabled=false
        form1.no_akta_lhr_yy1.value="";
	form1.no_akta_lhr_yy1.disabled=false
        form1.alamat_ayh.value="";
	form1.alamat_ayh.disabled=false
        form1.no_rt_ayh.value="";
	form1.no_rt_ayh.disabled=false
        form1.no_rw_ayh.value="";
	form1.no_rw_ayh.disabled=false
        form1.dusun_ayh.value="";
	form1.dusun_ayh.disabled=false
        form1.kodepos_ayh.value="";
	form1.kodepos_ayh.disabled=false
        form1.telp_ayh.value="";
	form1.telp_ayh.disabled=false
	form1.nama_prop_ayh.disabled=false
	form1.nama_kab_ayh.disabled=false
	form1.nama_kec_ayh.disabled=false
	form1.nkelayh.disabled=false
	form1.nama_ayh.focus()
}

function tab31()
{

	if(form1.tgl_mati_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_mati_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_mati_dd.value.charAt(i)) || form1.tgl_mati_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				tp1.setSelectedIndex(0)
                                form1.tgl_mati_dd.disabled = false;
				form1.tgl_mati_dd.focus()
				form1.tgl_mati_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_mati_dd.value > 31 || form1.tgl_mati_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
			tp1.setSelectedIndex(0)
                        form1.tgl_mati_dd.disabled = false;
			form1.tgl_mati_dd.focus()
			form1.tgl_mati_dd.value=""
			return(false)
		}
                form1.tgl_mati_mm.disabled = false;
		form1.tgl_mati_mm.focus()
		return false
	}
}

function tab41()
{
	if(form1.tgl_mati_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_mati_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_mati_mm.value.charAt(i)) || form1.tgl_mati_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				tp1.setSelectedIndex(0)
                                form1.tgl_mati_mm.disabled = false;
				form1.tgl_mati_mm.focus()
				form1.tgl_mati_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_mati_mm.value > 12 || form1.tgl_mati_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
			tp1.setSelectedIndex(0)
                        form1.tgl_mati_mm.disabled = false;
			form1.tgl_mati_mm.focus()
			form1.tgl_mati_mm.value=""
			return(false)
		}
                form1.tgl_mati_yy.disabled = false;
		form1.tgl_mati_yy.focus()
		return false
	}
}
function tab51()
{
	d = new Date(form1.tgl_mati_mm.value+"/"+form1.tgl_mati_dd.value+"/"+form1.tgl_mati_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_mati_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_mati_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_mati_yy.value.charAt(i)) || form1.tgl_mati_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				tp1.setSelectedIndex(0)
                                form1.tgl_mati_yy.disabled = false;
				form1.tgl_mati_yy.focus()
				form1.tgl_mati_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_mati_yy.value < 1900 || form1.tgl_mati_yy.value > d3 || form1.tgl_mati_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
			tp1.setSelectedIndex(0)
                        form1.tgl_mati_yy.disabled = false;
			form1.tgl_mati_yy.focus()
			form1.tgl_mati_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
			tp1.setSelectedIndex(0)
                        form1.tgl_mati_yy.disabled = false;
			form1.tgl_mati_yy.focus()
			form1.tgl_mati_yy.value=""
                        form1.tgl_mati_mm.disabled = false;
			form1.tgl_mati_mm.focus()
			form1.tgl_mati_mm.value=""
                        form1.tgl_mati_dd.disabled = false;
			form1.tgl_mati_dd.focus()
			form1.tgl_mati_dd.value=""

			return(false)
		}
                form1.pukul_mt1.disabled = false;
		form1.pukul_mt1.focus()
		return false
	}
}

function tab3()
{

	if(form1.no_akta_lhr_dd.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lhr_dd.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_dd.value.charAt(i)) || form1.no_akta_lhr_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_dd.disabled = false;
				form1.no_akta_lhr_dd.focus()
				form1.no_akta_lhr_dd.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_dd.value > 31 || form1.no_akta_lhr_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        form1.no_akta_lhr_dd.disabled = false;
			form1.no_akta_lhr_dd.focus()
			form1.no_akta_lhr_dd.value=""
			return(false)
		}
                form1.no_akta_lhr_mm.disabled = false;
		form1.no_akta_lhr_mm.focus()
		return false
	}
}

function tab4()
{
	if(form1.no_akta_lhr_mm.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lhr_mm.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_mm.value.charAt(i)) || form1.no_akta_lhr_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_mm.disabled = false;
				form1.no_akta_lhr_mm.focus()
				form1.no_akta_lhr_mm.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_mm.value > 12 || form1.no_akta_lhr_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        form1.no_akta_lhr_mm.disabled = false;
			form1.no_akta_lhr_mm.focus()
			form1.no_akta_lhr_mm.value=""
			return(false)
		}
                form1.no_akta_lhr_yy.disabled = false;
		form1.no_akta_lhr_yy.focus()
		return false
	}
}
function tab5()
{
	d = new Date(form1.no_akta_lhr_mm.value+"/"+form1.no_akta_lhr_dd.value+"/"+form1.no_akta_lhr_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.no_akta_lhr_yy.value.length > 3)
	{
		for(i = 0; i < form1.no_akta_lhr_yy.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_yy.value.charAt(i)) || form1.no_akta_lhr_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_yy.disabled = false;
				form1.no_akta_lhr_yy.focus()
				form1.no_akta_lhr_yy.value=""
				return(false)
			}
		}
		  if(form1.no_akta_lhr_yy.value < 1800 || form1.no_akta_lhr_yy.value > d3 || form1.no_akta_lhr_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.no_akta_lhr_yy.disabled = false;
			form1.no_akta_lhr_yy.focus()
			form1.no_akta_lhr_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.no_akta_lhr_yy.disabled = false;
			form1.no_akta_lhr_yy.focus()
			form1.no_akta_lhr_yy.value=""
                        form1.no_akta_lhr_mm.disabled = false;
			form1.no_akta_lhr_mm.focus()
			form1.no_akta_lhr_mm.value=""
                        form1.no_akta_lhr_dd.disabled = false;
			form1.no_akta_lhr_dd.focus()
			form1.no_akta_lhr_dd.value=""

			return(false)
		}

	        if(form1.radiobutton1[0].checked == true) {
		   tp1.setSelectedIndex(1)
		   form1.jenis_pkrjn_ibu.focus()
		   return false
	        } else if(form1.radiobutton1[1].checked == true) {
		   tp1.setSelectedIndex(1)
		   form1.jenis_pkrjn_ibu.focus()
		   return false
	        }
	}
}



function tab9()
{

	if(form1.no_akta_lhr_dd1.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lhr_dd1.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_dd1.value.charAt(i)) || form1.no_akta_lhr_dd1.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_dd1.disabled = false;
				form1.no_akta_lhr_dd1.focus()
				form1.no_akta_lhr_dd1.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_dd1.value > 31 || form1.no_akta_lhr_dd1.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        form1.no_akta_lhr_dd1.disabled = false;
			form1.no_akta_lhr_dd1.focus()
			form1.no_akta_lhr_dd1.value=""
			return(false)
		}
                form1.no_akta_lhr_mm1.disabled = false;
		form1.no_akta_lhr_mm1.focus()
		return false
	}
}

function tab10()
{
	if(form1.no_akta_lhr_mm1.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lhr_mm1.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_mm1.value.charAt(i)) || form1.no_akta_lhr_mm1.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_mm1.disabled = false;
				form1.no_akta_lhr_mm1.focus()
				form1.no_akta_lhr_mm1.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_mm1.value > 12 || form1.no_akta_lhr_mm1.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        form1.no_akta_lhr_mm1.disabled = false;
			form1.no_akta_lhr_mm1.focus()
			form1.no_akta_lhr_mm1.value=""
			return(false)
		}
                form1.no_akta_lhr_yy1.disabled = false;
		form1.no_akta_lhr_yy1.focus()
		return false
	}
}
function tab11()
{
	d = new Date(form1.no_akta_lhr_mm1.value+"/"+form1.no_akta_lhr_dd1.value+"/"+form1.no_akta_lhr_yy1.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.no_akta_lhr_yy1.value.length > 3)
	{
		for(i = 0; i < form1.no_akta_lhr_yy1.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_yy1.value.charAt(i)) || form1.no_akta_lhr_yy1.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_yy1.disabled = false;
				form1.no_akta_lhr_yy1.focus()
				form1.no_akta_lhr_yy1.value=""
				return(false)
			}
		}
		  if(form1.no_akta_lhr_yy1.value < 1800 || form1.no_akta_lhr_yy1.value > d3 || form1.no_akta_lhr_yy1.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.no_akta_lhr_yy1.disabled = false;
			form1.no_akta_lhr_yy1.focus()
			form1.no_akta_lhr_yy1.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.no_akta_lhr_yy1.disabled = false;
			form1.no_akta_lhr_yy1.focus()
			form1.no_akta_lhr_yy1.value=""
                        form1.no_akta_lhr_mm1.disabled = false;
			form1.no_akta_lhr_mm1.focus()
			form1.no_akta_lhr_mm1.value=""
                        form1.no_akta_lhr_dd1.disabled = false;
			form1.no_akta_lhr_dd1.focus()
			form1.no_akta_lhr_dd1.value=""

			return(false)
		}
	}
}

function tab15()
{

	if(form1.no_akta_lhr_dd2.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lhr_dd2.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_dd2.value.charAt(i)) || form1.no_akta_lhr_dd2.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_dd2.disabled = false;
				form1.no_akta_lhr_dd2.focus()
				form1.no_akta_lhr_dd2.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_dd2.value > 31 || form1.no_akta_lhr_dd2.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        form1.no_akta_lhr_dd2.disabled = false;
			form1.no_akta_lhr_dd2.focus()
			form1.no_akta_lhr_dd2.value=""
			return(false)
		}
                form1.no_akta_lhr_mm2.disabled = false;
		form1.no_akta_lhr_mm2.focus()
		return false
	}
}

function tab16()
{
	if(form1.no_akta_lhr_mm2.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lhr_mm2.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_mm2.value.charAt(i)) || form1.no_akta_lhr_mm2.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_mm2.disabled = false;
				form1.no_akta_lhr_mm2.focus()
				form1.no_akta_lhr_mm2.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_mm2.value > 12 || form1.no_akta_lhr_mm2.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        form1.no_akta_lhr_mm2.disabled = false;
			form1.no_akta_lhr_mm2.focus()
			form1.no_akta_lhr_mm2.value=""
			return(false)
		}
                form1.no_akta_lhr_yy2.disabled = false;
		form1.no_akta_lhr_yy2.focus()
		return false
	}
}
function tab17()
{
	d = new Date(form1.no_akta_lhr_mm2.value+"/"+form1.no_akta_lhr_dd2.value+"/"+form1.no_akta_lhr_yy2.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.no_akta_lhr_yy2.value.length > 3)
	{
		for(i = 0; i < form1.no_akta_lhr_yy2.value.length;i++)
		{
			if(isNaN(form1.no_akta_lhr_yy2.value.charAt(i)) || form1.no_akta_lhr_yy2.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.no_akta_lhr_yy2.disabled = false;
				form1.no_akta_lhr_yy2.focus()
				form1.no_akta_lhr_yy2.value=""
				return(false)
			}
		}
		  if(form1.no_akta_lhr_yy2.value < 1900 || form1.no_akta_lhr_yy2.value > d3 || form1.no_akta_lhr_yy2.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.no_akta_lhr_yy2.disabled = false;
			form1.no_akta_lhr_yy2.focus()
			form1.no_akta_lhr_yy2.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        form1.tgl_ctt_kwn_ayh_yy.disabled = false;
			form1.tgl_ctt_kwn_ayh_yy.focus()
			form1.tgl_ctt_kwn_ayh_yy.value=""
                        form1.tgl_ctt_kwn_ayh_mm.disabled = false;
			form1.tgl_ctt_kwn_ayh_mm.focus()
			form1.tgl_ctt_kwn_ayh_mm.value=""
                        form1.tgl_ctt_kwn_ayh_dd.disabled = false;
			form1.tgl_ctt_kwn_ayh_dd.focus()
			form1.tgl_ctt_kwn_ayh_dd.value=""

			return(false)
		}
	}
}

function validasiTanggal(dayObj, monthObj, yearObj, index) {
        days = 30;
        y = parseInt(yearObj.value,10);
        m = parseInt(monthObj.value,10);
        d = parseInt(dayObj.value,10);
        if (((y%4)==0) && (m==2)){
          //kabisat
          days = 29
        } else {
          if ((((m%2)!=0) && (m<8)) || (((m%2)==0) && (m>=8))) {
             days = 31
          }
        }
        if ((d<0) || (d>days)) {
          alert("Isian tanggal tidak benar,periksa kembali!")
          tp1.setSelectedIndex(index)
          dayObj.disabled = false;
	  dayObj.focus()
	  dayObj.value=""
	  return false
        }
        if ((m<0) || (m>12)) {
          alert("Isian tanggal tidak benar,periksa kembali!")
          tp1.setSelectedIndex(index)
          monthObj.disabled = false;
	  monthObj.focus()
	  monthObj.value=""
	  return false
        }
        if (y<1000) {
          alert("Isian tanggal tidak benar,periksa kembali!")
          tp1.setSelectedIndex(index)
          yearObj.disabled = false;
	  yearObj.focus()
	  yearObj.value=""
	  return false
        }
}
function dd2mm(dd, mm)
{

	if(dd.value.length > 1)
	{
		for(i = 0; i < dd.value.length;i++)
		{
			if(isNaN(dd.value.charAt(i)) || dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                dd.disabled = false;
				dd.focus()
				dd.value=""
				return(false)
			}
		}
		if(dd.value > 31 || dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
                        dd.disabled = false;
			dd.focus()
			dd.value=""
			return(false)
		}
                mm.disabled = false;
		mm.focus()
		return false
	}
}

function mm2yy(mm, yy)
{
	if(mm.value.length > 1)
	{
		for(i = 0; i < mm.value.length;i++)
		{
			if(isNaN(mm.value.charAt(i)) || mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                mm.disabled = false;
				mm.focus()
				mm.value=""
				return(false)
			}
		}
		if(mm.value > 12 || mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
                        mm.disabled = false;
			mm.focus()
			mm.value=""
			return(false)
		}
                yy.disabled = false;
		yy.focus()
		return false
	}
}
function yy2next(dd, mm, yy, next)
{
	d = new Date(mm.value+"/"+dd.value+"/"+yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(yy.value.length > 3)
	{
		for(i = 0; i < yy.value.length;i++)
		{
			if(isNaN(yy.value.charAt(i)) || yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                yy.disabled = false;
				yy.focus()
				yy.value=""
				return(false)
			}
		}
		  if(yy.value < 1900 || yy.value > d3 || yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        yy.disabled = false;
			yy.focus()
			yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
                        yy.disabled = false;
			yy.focus()
			yy.value=""
                        mm.disabled = false;
			mm.focus()
			mm.value=""
                        dd.disabled = false;
			dd.focus()
			dd.value=""

			return(false)
		}
		next.disabled = false;
		next.focus()
		return false
	}
}

function setSaveEnabled(flag) {
  form1.sim.disabled = !flag;
  form1.kon.disabled = flag;
}

function setFieldIbuEnabled(flag, wn) {
   form1.nik_ibu.disabled = flag;
   form1.nama_ibu.disabled = !flag;
   form1.no_akta_lhr_dd.disabled = !flag;
   form1.no_akta_lhr_mm.disabled = !flag;
   form1.no_akta_lhr_yy.disabled = !flag;
   form1.jenis_pkrjn_ibu.disabled = !flag;
   form1.alamat_ibu.disabled = !flag;
   form1.no_rt_ibu.disabled = !flag;
   form1.no_rw_ibu.disabled = !flag;
   form1.dusun_ibu.disabled = !flag;
   form1.kodepos_ibu.disabled = !flag;
   form1.telp_ibu.disabled = !flag;
   form1.nama_prop_ibu.disabled = !flag;
   form1.nama_kab_ibu.disabled = !flag;
   form1.nama_kec_ibu.disabled = !flag;
   form1.nkelibu.disabled = !flag;
}
function resetFieldIbu() {
   //NIK Ibu
   form1.radiobutton[0].disabled = false;
   form1.radiobutton[1].disabled = false;
   //WN IBU
   form1.radiobutton1[0].disabled = false;
   form1.radiobutton1[1].disabled = false;

   if ((form1.radiobutton[0].checked || form1.radiobutton[1].checked) && (form1.radiobutton1[0].checked || form1.radiobutton1[1].checked)) {
      setFieldIbuEnabled(form1.radiobutton[1].checked, (form1.radiobutton1[0].checked?1:2))
   }
   setSaveEnabled(false);
}

function setFieldAyahEnabled(flag, wn) {
   form1.nik_ayh.disabled = flag;
   form1.nama_ayh.disabled = !flag;
   form1.no_akta_lhr_dd1.disabled = !flag;
   form1.no_akta_lhr_mm1.disabled = !flag;
   form1.no_akta_lhr_yy1.disabled = !flag;
   form1.jenis_pkrjn_ayh.disabled = !flag;
   form1.alamat_ayh.disabled = !flag;
   form1.no_rt_ayh.disabled = !flag;
   form1.no_rw_ayh.disabled = !flag;
   form1.dusun_ayh.disabled = !flag;
   form1.kodepos_ayh.disabled = !flag;
   form1.telp_ayh.disabled = !flag;
   form1.nama_prop_ayh.disabled = !flag;
   form1.nama_kab_ayh.disabled = !flag;
   form1.nama_kec_ayh.disabled = !flag;
   form1.nkelayh.disabled = !flag;
}
function resetFieldAyah() {
   //NIK Ibu
   form1.radiobutton3[0].disabled = false;
   form1.radiobutton3[1].disabled = false;
   //WN IBU
   form1.radiobutton4[0].disabled = false;
   form1.radiobutton4[1].disabled = false;

   if ((form1.radiobutton3[0].checked || form1.radiobutton3[1].checked) && (form1.radiobutton4[0].checked || form1.radiobutton4[1].checked)) {
      setFieldAyahEnabled(form1.radiobutton3[1].checked, (form1.radiobutton4[0].checked?1:2))
   }
   setSaveEnabled(false);
}