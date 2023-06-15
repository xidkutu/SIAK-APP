function trim(strText)
{
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}
function checkNik1(a1,b1)
{
  a=subNik(a1);
  b=subNik(b1);

  if( parseInt(trim(a),10)==parseInt(trim(b),10) )
  {
     alert("Isian Nik tidak boleh sama!");
     return false;
  }

}
function checkNik2(a1,b1,c1)
{
  a=subNik(trim(a1));
  b=subNik(trim(b1));
  c=subNik(trim(c1));

  if( parseInt(trim(a),10)==parseInt(trim(b),10) || parseInt(trim(a),10)==parseInt(trim(c),10) || parseInt(trim(c),10)==parseInt(trim(b),10)
    )
  {
     alert("Isian Nik tidak boleh sama!");
     return false;
  }
}

function checkNik3(a1,b1,c1,d1)
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

function konfirmasi()
{
	if( trim(form1.nik_bayi.value) == "")
	{
		alert("NIK Bayi belum diisi !")
		tp1.setSelectedIndex(0)
		form1.nik_bayi.focus()
		return false;
	}
	if( trim(form1.nik_sksi1.value) == "" )
	{
		alert("NIK Saksi 1 belum diisi !")
		tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return false;
	}
       if(form1.nik_sksi1.value.substring(0,1) != 'A' && form1.nik_sksi1.value.length != 16)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_sksi1.focus()
		return(false)
	}
	if(form1.nik_sksi1.value.substring(0,1) == 'A' && form1.nik_sksi1.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_sksi1.focus()
		return(false)
	}

	if( trim(form1.nik_sksi2.value) == "" )
	{
		alert("NIK Saksi 2 belum diisi !")
		tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return false;
	}
       if(form1.nik_sksi2.value.substring(0,1) != 'A' && form1.nik_sksi2.value.length != 16)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_sksi2.focus()
		return(false)
	}
	if(form1.nik_sksi2.value.substring(0,1) == 'A' && form1.nik_sksi2.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_sksi2.focus()
		return(false)
	}

       if(form1.nik_bayi.value.substring(0,1) != 'A' && form1.nik_bayi.value.length != 16)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_bayi.focus()
		return(false)
	}
	if(form1.nik_bayi.value.substring(0,1) == 'A' && form1.nik_bayi.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_bayi.focus()
		return(false)
	}
/*
	if(form1.radiobutton[0].checked != true && form1.radiobutton[1].checked != true)
	{
		alert("Belum pilih NIK Ibu ada/tidak ada !.")
		tp1.setSelectedIndex(1)
		return false
	}

      	if(form1.radiobutton[0].checked == true)
	{
		form1.nik_ibu.disabled=false;
	}

     if(form1.radiobutton[1].checked == true)
	{
		form1.nik_ibu.disabled=true;
	}


	if(form1.radiobutton[0].checked == true && trim(form1.nik_ibu.value)=="")
	{

		alert("NIK Ibu belum diisi !.")
                form1.nik_ibu.focus();
		tp1.setSelectedIndex(1)
		return false;
	}
        if(form1.nik_ibu.value.length != 16 && form1.nik_ibu.value.substring(0,1) != 'A'  && form1.nik_ibu.disabled == false)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(1)
		form1.nik_ibu.focus()
		return(false)
	}
	if(form1.nik_ibu.value.substring(0,1) == 'A' && form1.nik_ibu.value.length != 17 && form1.radionbutton1[1].checked == true && form1.radionbutton[0].checked == true && form1.nik_ibu.disabled == false)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(1)
		form1.nik_ibu.focus()
		return(false)
	}
	if(form1.radiobutton3[0].checked != true && form1.radiobutton3[1].checked != true)
	{
		alert("Belum pilih NIK Ayah ada/tidak ada !.")
		tp1.setSelectedIndex(2)
		return false
	}
      	if(form1.radiobutton3[0].checked == true)
	{
		form1.nik_ayh.disabled=false;
	}

     if(form1.radiobutton3[1].checked == true)
	{
		form1.nik_ayh.disabled=true;
	}

        if( form1.radiobutton4[0].checked!=true && form1.radiobutton4[1].checked!=true )
        {
                alert("Belum pilih Warga Negara Ayah !.");
		tp1.setSelectedIndex(2);
		return false;
        }
	if( trim(form1.nik_ayh.value) == "" && form1.radiobutton3[0].checked == true)
	{
		alert("NIK belum diisi !")
		tp1.setSelectedIndex(2)
		form1.nik_ayh.focus()
		return(false)
	}
	 if(form1.nik_ayh.value.length != 16 && form1.nik_ayh.value.substring(0,1) != 'A'  && form1.nik_ayh.disabled == false)
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(2)
		form1.nik_ayh.focus()
		return(false)
	}
	if(form1.nik_ayh.value.substring(0,1) == 'A' && form1.nik_ayh.value.length != 17 && form1.radionbutton4[1].checked == true && form1.radionbutton3[0].checked == true && form1.nik_ayh.disabled == false)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(2)
		form1.nik_ayh.focus()
		return(false)
	}
	if( trim(form1.nik_plpor.value) == "" )
	{
		alert("NIK Pelapor belum diisi !.")
		tp1.setSelectedIndex(3)
		form1.nik_plpor.focus()
		return(false)
	}
	 if(form1.nik_plpor.value.length != 16 && form1.nik_plpor.value.substring(0,1) != 'A')
	{
		alert("Pengisian Nomor KK 16 digit !")
		tp1.setSelectedIndex(3)
		form1.nik_plporu.focus()
		return(false)
	}
	if(form1.nik_plpor.value.substring(0,1) == 'A' && form1.nik_plpor.value.length != 17)
	{
		alert("Pengisian Nomor KK 17 digit !")
		tp1.setSelectedIndex(3)
		form1.nik_plpor.focus()
		return(false)
	}
*/
return checkNik2(form1.nik_bayi.value, form1.nik_sksi1.value, form1.nik_sksi2.value);
form1.kon.disabled=true;
}

function  radioValid1()
{
	if(form1.radiobutton[1].checked == true)
	{
		form1.jenis_pkrjn_ibu1.options.disabled=false
		form1.jenis_pkrjn_ibu2.options.disabled=true
		form1.jenis_pkrjn_ibu1.focus()
	}

	form1.bangsa_ibu.disabled=true
}
function  radioValid2()
{

	if(form1.radiobutton[1].checked == true )
	{
		form1.jenis_pkrjn_ibu2.options.disabled=false
		form1.jenis_pkrjn_ibu1.options.disabled=true
		form1.jenis_pkrjn_ibu2.focus()
	}
	form1.bangsa_ibu.disabled=false
}

function  radioValid3()
{
	form1.nik_ibu.disabled=false
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
	form1.nama_prop_ibu.options.disabled=true
	form1.nama_kab_ibu.options.disabled=true
	form1.nama_kec_ibu.options.disabled=true
	form1.nkelibu.options.disabled=true
	form1.tgl_ctt_kwn_ibu_dd.disabled=true
	form1.tgl_ctt_kwn_ibu_mm.disabled=true
	form1.tgl_ctt_kwn_ibu_yy.disabled=true
	form1.nik_ibu.focus()
}
function  radioValid4()
{
        form1.nik_ibu.value="";
	form1.nik_ibu.disabled=true
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
	form1.nama_prop_ibu.options.disabled=false
	form1.nama_kab_ibu.options.disabled=false
	form1.nama_kec_ibu.options.disabled=false
	form1.nkelibu.options.disabled=false
	form1.tgl_ctt_kwn_ibu_dd.disabled=false
	form1.tgl_ctt_kwn_ibu_mm.disabled=false
	form1.tgl_ctt_kwn_ibu_yy.disabled=false
	form1.nama_ibu.focus()
}
function  radioValid7()
{
	if(form1.radiobutton3[1].checked == true )
	{
		form1.jenis_pkrjn_ayh1.options.disabled=false
		form1.jenis_pkrjn_ayh2.options.disabled=true
		form1.jenis_pkrjn_ayh1.focus()
	}

	form1.bangsa_ayh.disabled=true
}
function  radioValid8()
{

	if(form1.radiobutton3[1].checked == true)
	{
		form1.jenis_pkrjn_ayh2.options.disabled=false
		form1.jenis_pkrjn_ayh1.options.disabled=true
		form1.jenis_pkrjn_ayh2.focus()
	}
	form1.bangsa_ayh.disabled=false

}

function  radioValid5()
{
	form1.nik_ayh.disabled=false
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
	form1.nama_prop_ayh.options.disabled=true
	form1.nama_kab_ayh.options.disabled=true
	form1.nama_kec_ayh.options.disabled=true
	form1.nkelayh.options.disabled=true
	form1.tgl_ctt_kwn_ayh_dd.disabled=true
	form1.tgl_ctt_kwn_ayh_mm.disabled=true
	form1.tgl_ctt_kwn_ayh_yy.disabled=true
	form1.nik_ayh.focus()
}
function  radioValid6()
{
	form1.nik_ayh.value="";
	form1.nik_ayh.disabled=true
	form1.nama_ayh.disabled=false
	form1.no_akta_lhr_dd1.disabled=false
	form1.no_akta_lhr_mm1.disabled=false
	form1.no_akta_lhr_yy1.disabled=false
	form1.alamat_ayh.disabled=false
	form1.no_rt_ayh.disabled=false
	form1.no_rw_ayh.disabled=false
	form1.dusun_ayh.disabled=false
	form1.kodepos_ayh.disabled=false
	form1.telp_ayh.disabled=false
	form1.nama_prop_ayh.options.disabled=false
	form1.nama_kab_ayh.options.disabled=false
	form1.nama_kec_ayh.options.disabled=false
	form1.nkelayh.options.disabled=false
	form1.tgl_ctt_kwn_ayh_dd.disabled=false
	form1.tgl_ctt_kwn_ayh_mm.disabled=false
	form1.tgl_ctt_kwn_ayh_yy.disabled=false
	form1.nama_ayh.focus()


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
				form1.pukul_lhr1.focus()
				return(false)
			}
		}
			if(form1.pukul_lhr1.value > 24)
			{
				alert("Isian jam tidak benar,periksa kembali !.")
				form1.pukul_lhr1.focus()
				return(false)
			}

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
				form1.pukul_lhr2.focus()
				return(false)
			}
		}
			if(form1.pukul_lhr2.value > 60)
			{
				alert("Isian menit tidak benar,periksa kembali !.")
				form1.pukul_lhr2.focus()
				return(false)
			}

			form1.wkt_pkl_lhr.focus()
			return false
	}
}



function tab2()
{
	for(i = 0; i < form1.brt_bayi.value.length;i++)
	{
		if(!((form1.brt_bayi.value.charAt(i) >= 0 && form1.brt_bayi.value.charAt(i) <= 9 ) || (form1.brt_bayi.value.charAt(i) == ',')))
		{
			   alert("Data Anda Salah, Silahkan Coba Lagi !")
			   form1.brt_bayi.focus()
		}
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
				form1.no_akta_lhr_dd.focus()
				form1.no_akta_lhr_dd.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_dd.value > 31 || form1.no_akta_lhr_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.no_akta_lhr_dd.focus()
			form1.no_akta_lhr_dd.value=""
			return(false)
		}
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
				form1.no_akta_lhr_mm.focus()
				form1.no_akta_lhr_mm.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_mm.value > 12 || form1.no_akta_lhr_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.no_akta_lhr_mm.focus()
			form1.no_akta_lhr_mm.value=""
			return(false)
		}


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
				form1.no_akta_lhr_yy.focus()
				form1.no_akta_lhr_yy.value=""
				return(false)
			}
		}
		  if(form1.no_akta_lhr_yy.value < 1800 || form1.no_akta_lhr_yy.value > d3 || form1.no_akta_lhr_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.no_akta_lhr_yy.focus()
			form1.no_akta_lhr_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.no_akta_lhr_yy.focus()
			form1.no_akta_lhr_yy.value=""
			form1.no_akta_lhr_mm.focus()
			form1.no_akta_lhr_mm.value=""
			form1.no_akta_lhr_dd.focus()
			form1.no_akta_lhr_dd.value=""

			return(false)
		}

		form1.alamat_ibu.focus()
		return false
	}
}
function tab6()
{

	if(form1.tgl_ctt_kwn_ibu_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_ctt_kwn_ibu_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_ctt_kwn_ibu_dd.value.charAt(i)) || form1.tgl_ctt_kwn_ibu_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_ctt_kwn_ibu_dd.focus()
				form1.tgl_ctt_kwn_ibu_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_ctt_kwn_ibu_dd.value > 31 || form1.tgl_ctt_kwn_ibu_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ibu_dd.focus()
			form1.tgl_ctt_kwn_ibu_dd.value=""
			return(false)
		}
		form1.tgl_ctt_kwn_ibu_mm.focus()
		return false
	}
}

function tab7()
{
	if(form1.tgl_ctt_kwn_ibu_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_ctt_kwn_ibu_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_ctt_kwn_ibu_mm.value.charAt(i)) || form1.tgl_ctt_kwn_ibu_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_ctt_kwn_ibu_mm.focus()
				form1.tgl_ctt_kwn_ibu_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_ctt_kwn_ibu_mm.value > 12 || form1.tgl_ctt_kwn_ibu_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ibu_mm.focus()
			form1.tgl_ctt_kwn_ibu_mm.value=""
			return(false)
		}


		form1.tgl_ctt_kwn_ibu_yy.focus()
		return false
	}
}
function tab8()
{
	d = new Date(form1.tgl_ctt_kwn_ibu_mm.value+"/"+form1.tgl_ctt_kwn_ibu_dd.value+"/"+form1.tgl_ctt_kwn_ibu_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_ctt_kwn_ibu_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_ctt_kwn_ibu_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_ctt_kwn_ibu_yy.value.charAt(i)) || form1.tgl_ctt_kwn_ibu_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_ctt_kwn_ibu_yy.focus()
				form1.tgl_ctt_kwn_ibu_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_ctt_kwn_ibu_yy.value < 1800 || form1.tgl_ctt_kwn_ibu_yy.value > d3 || form1.tgl_ctt_kwn_ibu_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ibu_yy.focus()
			form1.tgl_ctt_kwn_ibu_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ibu_yy.focus()
			form1.tgl_ctt_kwn_ibu_yy.value=""
			form1.tgl_ctt_kwn_ibu_mm.focus()
			form1.tgl_ctt_kwn_ibu_mm.value=""
			form1.tgl_ctt_kwn_ibu_dd.focus()
			form1.tgl_ctt_kwn_ibu_dd.value=""

			return(false)
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
				form1.no_akta_lhr_dd1.focus()
				form1.no_akta_lhr_dd1.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_dd1.value > 31 || form1.no_akta_lhr_dd1.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.no_akta_lhr_dd1.focus()
			form1.no_akta_lhr_dd1.value=""
			return(false)
		}
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
				form1.no_akta_lhr_mm1.focus()
				form1.no_akta_lhr_mm1.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_mm1.value > 12 || form1.no_akta_lhr_mm1.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.no_akta_lhr_mm1.focus()
			form1.no_akta_lhr_mm1.value=""
			return(false)
		}


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
				form1.no_akta_lhr_yy1.focus()
				form1.no_akta_lhr_yy1.value=""
				return(false)
			}
		}
		  if(form1.no_akta_lhr_yy1.value < 1800 || form1.no_akta_lhr_yy1.value > d3 || form1.no_akta_lhr_yy1.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.no_akta_lhr_yy1.focus()
			form1.no_akta_lhr_yy1.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.no_akta_lhr_yy1.focus()
			form1.no_akta_lhr_yy1.value=""
			form1.no_akta_lhr_mm1.focus()
			form1.no_akta_lhr_mm1.value=""
			form1.no_akta_lhr_dd1.focus()
			form1.no_akta_lhr_dd1.value=""

			return(false)
		}
	}
}
function tab12()
{

	if(form1.tgl_ctt_kwn_ayh_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_ctt_kwn_ayh_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_ctt_kwn_ayh_dd.value.charAt(i)) || form1.tgl_ctt_kwn_ayh_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_ctt_kwn_ayh_dd.focus()
				form1.tgl_ctt_kwn_ayh_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_ctt_kwn_ayh_dd.value > 31 || form1.tgl_ctt_kwn_ayh_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ayh_dd.focus()
			form1.tgl_ctt_kwn_ayh_dd.value=""
			return(false)
		}
		form1.tgl_ctt_kwn_ayh_mm.focus()
		return false
	}
}

function tab13()
{
	if(form1.tgl_ctt_kwn_ayh_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_ctt_kwn_ayh_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_ctt_kwn_ayh_mm.value.charAt(i)) || form1.tgl_ctt_kwn_ayh_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_ctt_kwn_ayh_mm.focus()
				form1.tgl_ctt_kwn_ayh_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_ctt_kwn_ayh_mm.value > 12 || form1.tgl_ctt_kwn_ayh_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ayh_mm.focus()
			form1.tgl_ctt_kwn_ayh_mm.value=""
			return(false)
		}


		form1.tgl_ctt_kwn_ayh_yy.focus()
		return false
	}
}
function tab14()
{
	d = new Date(form1.tgl_ctt_kwn_ayh_mm.value+"/"+form1.tgl_ctt_kwn_ayh_dd.value+"/"+form1.tgl_ctt_kwn_ayh_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_ctt_kwn_ayh_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_ctt_kwn_ayh_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_ctt_kwn_ayh_yy.value.charAt(i)) || form1.tgl_ctt_kwn_ayh_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_ctt_kwn_ayh_yy.focus()
				form1.tgl_ctt_kwn_ayh_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_ctt_kwn_ayh_yy.value < 1800 || form1.tgl_ctt_kwn_ayh_yy.value > d3 || form1.tgl_ctt_kwn_ayh_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ayh_yy.focus()
			form1.tgl_ctt_kwn_ayh_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ayh_yy.focus()
			form1.tgl_ctt_kwn_ayh_yy.value=""
			form1.tgl_ctt_kwn_ayh_mm.focus()
			form1.tgl_ctt_kwn_ayh_mm.value=""
			form1.tgl_ctt_kwn_ayh_dd.focus()
			form1.tgl_ctt_kwn_ayh_dd.value=""

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
				form1.no_akta_lhr_dd2.focus()
				form1.no_akta_lhr_dd2.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_dd2.value > 31 || form1.no_akta_lhr_dd2.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.no_akta_lhr_dd2.focus()
			form1.no_akta_lhr_dd2.value=""
			return(false)
		}
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
				form1.no_akta_lhr_mm2.focus()
				form1.no_akta_lhr_mm2.value=""
				return(false)
			}
		}
		if(form1.no_akta_lhr_mm2.value > 12 || form1.no_akta_lhr_mm2.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.no_akta_lhr_mm2.focus()
			form1.no_akta_lhr_mm2.value=""
			return(false)
		}


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
				form1.no_akta_lhr_yy2.focus()
				form1.no_akta_lhr_yy2.value=""
				return(false)
			}
		}
		  if(form1.no_akta_lhr_yy2.value < 1800 || form1.no_akta_lhr_yy2.value > d3 || form1.no_akta_lhr_yy2.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.no_akta_lhr_yy2.focus()
			form1.no_akta_lhr_yy2.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_ctt_kwn_ayh_yy.focus()
			form1.tgl_ctt_kwn_ayh_yy.value=""
			form1.tgl_ctt_kwn_ayh_mm.focus()
			form1.tgl_ctt_kwn_ayh_mm.value=""
			form1.tgl_ctt_kwn_ayh_dd.focus()
			form1.tgl_ctt_kwn_ayh_dd.value=""

			return(false)
		}
	}
}
function num(s1)
{
	for(i = 0; i < s1.value.length;i++)
	{
		if(isNaN(s1.value.charAt(i)) || s1.value.charAt(i) == ' ')
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !!" )
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
		   s.focus()
		}
	}

	if(s.value.substring(0,1) == 'A')
	{
		form1.jenis_pkrjn_plpor.options.disabled=true
		form1.jenis_pkrjn_plpor1.options.disabled=false

	}
	if(s.value.substring(0,1) != 'A')
	{
		form1.jenis_pkrjn_plpor.options.disabled=false
		form1.jenis_pkrjn_plpor1.options.disabled=true
	}

        return false
}
