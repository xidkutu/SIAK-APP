function penuser()
{
	var i = parseInt(form1.no_akta_lh_mm.value,10)

	switch(i)
	{
	       case 4:

			if(form1.no_akta_lh_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !.")
				form1.no_akta_lh_dd.focus()
				form1.no_akta_lh_dd.value=""
				return(false)
			}

		case 6:

			if(form1.no_akta_lh_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !.")
				form1.no_akta_lh_dd.focus()
				form1.no_akta_lh_dd.value=""
				return(false)
			}

		case 9:

			if(form1.no_akta_lh_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !.")
				form1.no_akta_lh_dd.focus()
				form1.no_akta_lh_dd.value=""
				return(false)
			}


		case 11:

			if(form1.no_akta_lh_dd.value > 30)
			{
				alert("Isian tanggal tidak benar,periksa kembali !.")
				form1.no_akta_lh_dd.focus()
				form1.no_akta_lh_dd.value=""
				return(false)
			}
	}

	if(form1.nama_lgkp.value == "")
	{
		alert("Nama Lengkap belum diisi !")
		form1.nama_lgkp.focus()
		form1.nama_lgkp.value=""
		return false
	}
        if(form1.tmpt_lhr.value == "")
	{
		alert("Tempat Lahir belum diisi !.")
		form1.tmpt_lhr.focus()
		form1.tmpt_lhr.value=""
		return(false)
	}
        if(form1.no_akta_lh_dd.value == "")
	{
		alert("Tanggal Lahir belum diisi !.")
		form1.no_akta_lh_dd.focus()
		form1.no_akta_lh_dd.value=""
		return(false)
	}
	if( form1.no_akta_lh_dd.value.length != 2)
	{
		alert("Pengisian tanggal harus dengan format dd !.")
		form1.no_akta_lh_dd.focus()
		form1.no_akta_lh_dd.value=""
		return(false)
	}
	if(form1.no_akta_lh_mm.value == "")
	{
		alert("Tanggal Lahir belum diisi !.")
		form1.no_akta_lh_mm.focus()
		form1.no_akta_lh_mm.value=""
		return(false)
	}
	if( form1.no_akta_lh_mm.value.length != 2)
	{
		alert("Pengisian bulan harus dengan format mm !.")
		form1.no_akta_lh_mm.focus()
		form1.no_akta_lh_mm.value=""
		return(false)
	}
	if(form1.no_akta_lh_yy.value == "" )
	{
		alert("Tanggal Lahir belum diisi !.")
		form1.no_akta_lh_yy.focus()
		form1.no_akta_lh_yy.value=""
		return(false)
	}
	if(form1.no_akta_lh_yy.value.length != 4)
	{
		alert("Pengisian tahun harus dengan format yyyy !.")
		form1.no_akta_lh_yy.focus()
		form1.no_akta_lh_yy.value=""
		return(false)
	}
	if(form1.jenis_klmin.options[0].selected == true)
	{
		alert("Jenis Kelamin belum diisi !")
		form1.jenis_klmin.focus()
		return false
	}
        if (num(form1.nip_pguna) && form1.nip_pguna.value.length==9) {
	  if(form1.gol.options[0].selected == true)
	  {
		alert("Pangkat/Golongan belum diisi !")
		form1.gol.focus()
		return false
	  }
        }

	if(form1.jabatan.value == "")
	{
		alert("Jabatan belum diisi !.")
		form1.jabatan.focus()
		return(false)
	}

	 if(form1.nip_pguna.value == "")
	{
		alert("NIP belum diisi !")
		form1.nip_pguna.focus()
		return (false)
	}
	if (form1.gol_pguna.value!="") {
	  if(form1.nip_pguna.value.length != 9)
	  {
		alert("NIP harus 9 digit !")
		form1.nip_pguna.focus()
		return (false)
	  }
	}
	if(form1.nama_ktr.value == "")
	{
		alert("Nama Kantor belum diisi !.")
		form1.nama_ktr.focus()
		return(false)
	}
	if(form1.alamat_ktr.value == "")
	{
		alert("Alamat Kantor belum diisi !.")
		form1.alamat_ktr.focus()
		return(false)
	}
	if(form1.tlp_ktr.value == "")
	{
		alert("Telepon/Fax belum diisi !.")
		form1.tlp_ktr.focus()
		return(false)
	}
}

function tab1()
{
	if(form1.no_akta_lh_dd.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lh_dd.value.length;i++)
		{
			if(isNaN(form1.no_akta_lh_dd.value.charAt(i)) || form1.no_akta_lh_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.no_akta_lh_dd.focus()
				form1.no_akta_lh_dd.value=""
				return(false)
			}
		}
		if(form1.no_akta_lh_dd.value > 31 || form1.no_akta_lh_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.no_akta_lh_dd.focus()
			form1.no_akta_lh_dd.value=""
			return(false)
		}

		form1.no_akta_lh_mm.focus()
		return false
	}
}
function tab2()
{

	if(form1.no_akta_lh_mm.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lh_mm.value.length;i++)
		{
			if(isNaN(form1.no_akta_lh_mm.value.charAt(i)) || form1.no_akta_lh_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.no_akta_lh_mm.focus()
				form1.no_akta_lh_mm.value=""
				return(false)
			}
		}
		if(form1.no_akta_lh_mm.value > 12 || form1.no_akta_lh_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.no_akta_lh_mm.focus()
			form1.no_akta_lh_mm.value=""
			return(false)
		}
		form1.no_akta_lh_yy.focus()
		return false
	}
}

function tab3()
{
	d = new Date();
	d1 = d.getYear()


	 if(form1.no_akta_lh_yy.value.length > 3)
	{
		for(i = 0; i < form1.no_akta_lh_yy.value.length;i++)
		{
			if(isNaN(form1.no_akta_lh_yy.value.charAt(i)) || form1.no_akta_lh_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.no_akta_lh_yy.focus()
				form1.no_akta_lh_yy.value=""
				return(false)
			}
		}
		if(form1.no_akta_lh_yy.value < 1900 || form1.no_akta_lh_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.no_akta_lh_yy.focus()
			form1.no_akta_lh_yy.value=""
			return(false)
		}

		if(form1.nama_lgkp.value != "")
		{
			form1.jenis_klmin.options.focus()
			return false
		}
		else
		{
			form1.nama_lgkp.focus()
			return false
		}
	}
}


function char(s)
{
	for (i=0; i < s.value.length; i++)
	{
		 if(!((s.value.charAt(i) >= 'A' && s.value.charAt(i) <= 'Z') || (s.value.charAt(i) >= 'a' && s.value.charAt(i) <= 'z') || (s.value.charAt(i) == ' ') || (s.value.charAt(i) == ',') || (s.value.charAt(i) == '.') || (s.value.charAt(i) == "'")))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   s.focus()
		   s.value=""
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
			s1.value=""
		}
	}
}