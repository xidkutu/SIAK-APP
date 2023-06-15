function matikab()
{
	if(form1.jenis_dft_mt.options[0].selected == true)
	{
		alert("JJenis Daftar Kematian belum diisi !.")
		tp1.setSelectedIndex(6)
		form1.jenis_dft_mt.focus()
		return false
	}
	if(form1.dsrhk_cttmt.options[0].selected == true)
	{
		alert("Dasar Hukum Pencatatan Kematian belum diisi !.")
		tp1.setSelectedIndex(6)
		form1.dsrhk_cttmt.focus()
		return false
	}

	var flag=0

	for(i=0; i < 11; i++)
	{
		 if(form1.doc_per.options[i].selected == true )
		 {
			 flag++
		 }
	 }

	 if(flag == 0)
	 {
	   	alert("Dokumen Persyaratan belum diisi !.")
	   	tp1.setSelectedIndex(5)
	   	form1.doc_per.focus()
		return false
	 }

	/*if(form1.chk_ktp_kk.checked != true && form1.chk_akta_kwn.checked != true && form1.chk_paspor.checked != true && form1.chk_srt_lhr.checked != true && form1.chk_ket_lhr.checked != true && form1.chk_srt_wn_ortu.checked != true)
	{
		alert("Dokumen Persyaratan belum diisi !.")
		tp1.setSelectedIndex(6)
		form1.chk_ktp_kk.focus()
		return false
	}
	if(form1.tgl_akta_lhr_dd.value == "")
	{
		alert("Tanggal Lahir belum diisi !.")
		tp1.setSelectedIndex(6)
		form1.tgl_akta_lhr_dd.focus()
		form1.tgl_akta_lhr_dd.value=""
		return(false)
	}
	if(form1.tgl_akta_lhr_dd.value.length != 2)
	{
		alert("Pengisian tanggal harus dengan format dd !.")
		tp1.setSelectedIndex(6)
		form1.tgl_akta_lhr_dd.focus()
		form1.tgl_akta_lhr_dd.value=""
		return(false)
	}
	if(form1.no_akta_lhr_mm.value == "")
	{
		alert("Tanggal Lahir belum diisi !.")
		tp1.setSelectedIndex(6)
		form1.no_akta_lhr_mm.focus()
		form1.no_akta_lhr_mm.value=""
		return(false)
	}
	if( form1.tgl_akta_lhr_mm.value.length != 2)
	{
		alert("Pengisian bulan harus dengan format mm !.")
		tp1.setSelectedIndex(6)
		form1.tgl_akta_lhr_mm.focus()
		form1.tgl_akta_lhr_mm.value=""
		return(false)
	}
	if(form1.no_akta_lhr_yy.value == "" )
	{
		alert("Tanggal Lahir belum diisi !.")
		tp1.setSelectedIndex(6)
		form1.no_akta_lhr_yy.focus()
		form1.no_akta_lhr_yy.value=""
		return(false)
	}
	if(form1.tgl_akta_lhr_yy.value.length != 4)
	{
		alert("Pengisian tahun harus dengan format yyyy !.")
		tp1.setSelectedIndex(6)
		form1.tgl_akta_lhr_yy.focus()
		form1.tgl_akta_lhr_yy.value=""
		return(false)
	}*/
	/*
	 if(form1.nama_kep_des.value == "")
	{
		alert("Nama Kepala Desa/Lurah belum diisi !")
		form1.nama_kep_des.focus()
		return (false)
	}

	 if(form1.nip_lrh.value.length != "" && form1.nip_lrh.value.length != 9)
	{
		alert("NIP Lurah  harus 9 digit !")
		form1.nip_lrh.focus()
		return (false)
	}
*/
	 if(form1.nama_pet_reg.value == "")
	{
		alert("Nama Petugas Pencatat/Registrar belum diisi !")
		form1.nama_pet_reg.focus()
		return (false)
	}
	 if(form1.nip_pet_reg.value == "")
	{
		alert("NIP Petugas Pencatat/Registra belum diisi !")
		form1.nip_pet_reg.focus()
		return (false)
	}

	 if(form1.nip_pet_reg.value.length != "" && form1.nip_pet_reg.value.length != 9)
	{
		alert("NIP Petugas Pencatat/Registra  harus 9 digit !")
		form1.nip_pet_reg.focus()
		return (false)
	}
        form1.kon.disabled = true;
        //form1.sim.disabled = true;
        form1.kel.disabled = true;
    // form1.submit();

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
        return false
}

/*function dd()
{

	if(form1.tgl_akta_lhr_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_akta_lhr_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_akta_lhr_dd.value.charAt(i)) || form1.tgl_akta_lhr_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_akta_lhr_dd.focus()
				form1.tgl_akta_lhr_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_akta_lhr_dd.value > 31 || form1.tgl_akta_lhr_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.tgl_akta_lhr_dd.focus()
			form1.tgl_akta_lhr_dd.value=""
			return(false)
		}
		form1.tgl_akta_lhr_mm.focus()
		return false
	}
}

function mm()
{
	if(form1.tgl_akta_lhr_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_akta_lhr_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_akta_lhr_mm.value.charAt(i)) || form1.tgl_akta_lhr_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_akta_lhr_mm.focus()
				form1.tgl_akta_lhr_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_akta_lhr_mm.value > 12 || form1.tgl_akta_lhr_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.tgl_akta_lhr_mm.focus()
			form1.tgl_akta_lhr_mm.value=""
			return(false)
		}


		form1.tgl_akta_lhr_yy.focus()
		return false
	}
}
function yy()
{
	d = new Date(form1.tgl_akta_lhr_mm.value+"/"+form1.tgl_akta_lhr_dd.value+"/"+form1.tgl_akta_lhr_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_akta_lhr_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_akta_lhr_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_akta_lhr_yy.value.charAt(i)) || form1.tgl_akta_lhr_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_akta_lhr_yy.focus()
				form1.tgl_akta_lhr_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_akta_lhr_yy.value < 1800 || form1.tgl_akta_lhr_yy.value > d3 || form1.tgl_akta_lhr_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_akta_lhr_yy.focus()
			form1.tgl_akta_lhr_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_akta_lhr_yy.focus()
			form1.tgl_akta_lhr_yy.value=""
			form1.tgl_akta_lhr_mm.focus()
			form1.tgl_akta_lhr_mm.value=""
			form1.tgl_akta_lhr_dd.focus()
			form1.tgl_akta_lhr_dd.value=""

			return(false)
		}

		form1.nama_kep_des.focus()
		return false
	}
}*/

function char(s)
{
	for (i=0; i < s.value.length; i++)
	{
		 if(!((s.value.charAt(i) >= 'A' && s.value.charAt(i) <= 'Z') || (s.value.charAt(i) >= 'a' && s.value.charAt(i) <= 'z') || (s.value.charAt(i) == ' ') || (s.value.charAt(i) == ',') || (s.value.charAt(i) == '.') || (s.value.charAt(i) == "'")))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   s.focus()
		}
	}
        return false
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