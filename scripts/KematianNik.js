function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function matiNik()
{
	if(trim(form1.nik_jnsah.value) == "")
	{
		alert("NIK Jenazah belum diisi !")
		tp1.setSelectedIndex(0)
		form1.nik_jnsah.focus()
		return false
	}
       if(form1.nik_jnsah.value.length != 16 && form1.nik_jnsah.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_jnsah.focus()
		return(false)
	}
	if(form1.nik_jnsah.value.substring(0,1) == 'A' && form1.nik_jnsah.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_jnsah.focus()
		return(false)
	}

	if(trim(form1.nik_sksi1.value) == "")
	{
		alert("NIK Saksi 1 belum diisi !")
		tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return false
	}
       if(form1.nik_sksi1.value.length != 16 && form1.nik_sksi1.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK Saksi 1 16 digit !")
		tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return(false)
	}
	if(form1.nik_sksi1.value.substring(0,1) == 'A' && form1.nik_sksi1.value.length != 17)
	{
		alert("Pengisian NIK Saksi 1 17 digit !")
		tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return(false)
	}

	if(trim(form1.nik_sksi2.value) == "")
	{
		alert("NIK Saksi 2 belum diisi !")
		tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return false
	}
       if(form1.nik_sksi2.value.length != 16 && form1.nik_sksi2.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK Saksi 2 16 digit !")
		tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return(false)
	}

	if(form1.nik_sksi2.value.substring(0,1) == 'A' && form1.nik_sksi2.value.length != 17)
	{
		alert("Pengisian NIK Saksi 2 17 digit !")
		tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return(false)
	}

	if(form1.nik_jnsah.value == form1.nik_sksi1.value)
	{
		alert("Pengisian NIK Jenazah dan Saksi 1 tidak boleh sama !")
		tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return(false)
	}

	if(form1.nik_jnsah.value == form1.nik_sksi2.value)
	{
		alert("Pengisian NIK Jenazah dan Saksi 2 tidak boleh sama !")
		tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return(false)
	}

	if(form1.nik_sksi1.value == form1.nik_sksi2.value)
	{
		alert("Pengisian NIK Saksi tidak boleh sama !")
		tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return(false)
	}

document.form1.action="Pencatatan_Kematian_Edit.jsp";
document.form1.submit();
form1.kon.disabled=true;
form1.sim.disabled=false;
/*
form1.jenis_dft_mt.disabled=false;
form1.dsrhk_cttmt.disabled=false;
form1.doc_per.disabled=false;
form1.nama_kep_des.disabled=false;
form1.nip_lrh.disabled=false;
form1.nama_pet_reg.disabled=false;
form1.nip_pet_reg.disabled=false;
*/
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
