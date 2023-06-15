function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}



//Validations for WNI

function validate()
{
	if(no_kk.value == "")
	{
		alert("Please enter the no_kk")
		no_kk.focus()
		no_kk.value=""
		return(false)
	}
	else if(isNaN(no_kk.value))
	{
		alert("No_kk should be number")
		no_kk.focus()
		no_kk.value=""
		return(false)
	}
	else if(nama_lgkp.value == "")
	{
		alert("Nama Lengkap belum diisi")
		nama_lgkp.focus()
		nama_lgkp.value=""
		return false
	}

	else if(jenis_klmin.options[0].selected == true)
	{
		alert("Jenis Kelamin belum diisi")
		jenis_klmin.options.focus()
		return false
	}

	else if(aga_ma.options[0].selected == true)
	{
		alert("Please select Agama")
		aga_ma.options.focus()
		return(false)
	}
	else if(tmpt_lhr.value == "")
	{
		alert("Tempat Lahir belum diisi")
		tmpt_lhr.focus()
		tmpt_lhr.value=""
		return(false)
	}
	else if(no_akta_lh_dd.value > 31 || no_akta_lh_dd.value == "")
	{
		alert("Enter the correct date & cannot be empty")
		no_akta_lh_dd.focus()
		no_akta_lh_dd.value=""
		return(false)
	}
	else if(no_akta_lh_mon.value > 12 || no_akta_lh_mon.value == "")
	{
		alert("Enter the correct month & cannot be empty")
		no_akta_lh_mon.focus()
		no_akta_lh_mon.value=""
		return(false)
	}
	else if(no_akta_lh_yy.value.length < 4 || no_akta_lh_yy.value == "" )
	{
		alert("Enter the correct year & cannot be empty")
		no_akta_lh_yy.focus()
		no_akta_lh_yy.value=""
		return(false)
	}
	else if(no_akta_lhr_dd.value > 31 || no_akta_lhr_yy.value == "")
	{
		alert("Enter the correct date & cannot be empty")
		no_akta_lhr_dd.focus()
		no_akta_lhr_dd.value=""
		return(false)
	}
	else if(no_akta_lhr_mm.value > 12 || no_akta_lhr_yy.value == "")
	{
		alert("Enter the correct month & cannot be empty")
		no_akta_lhr_mm.focus()
		no_akta_lhr_mm.value=""
		return(false)
	}
	else if(no_akta_lhr_yy.value.length < 4 || no_akta_lhr_yy.value == "" )
	{
		alert("Enter the correct year & cannot be empty")
		no_akta_lhr_yy.focus()
		no_akta_lhr_yy.value=""
		return(false)
	}
	else if(no_akta_kwn.value == "")
	{
		alert("Nomor Akta Perkawinan/Buku Nikah belum diisi !")
		akta_kwn.options[1].selected = true
		return(false)
	}

	else if(no_akta_crai.value == "")
	{
		alert("Nomor Akta Perceraian/Surat Cerai belum diisi !")
		no_akta_crai.options[1].selected = true
		return(false)
	}

	else if(stat_hbkel.options[0].selected == true)
	{
		alert("Please select Hbkel")
		stat_hbkel.options.focus()
		return(false)
	}
	else if(pddk_akh.options[0].selected == true)
	{
		alert("Pendidikan Terakhir belum diisi!")
		pddk_akh.options.focus()
		return(false)
	}
	else if(jenis_pkrjn.options[0].selected == true)
	{
		alert("Jenis Pekerjaan belum diisi !")
		jenis_pkrjn.options.focus()
		return(false)
	}
	else if (trim(nama_lgkp_ibu.value) == "")
	{
		alert("Nama Lengkap Ibu belum diisi !")
		nama_lgkp_ibu.focus()
		nama_lgkp_ibu.value=""
		return (false)
	}
	else if(nama_lgkp_ayh.value == "")
	{
		alert("Nama Lengkap Ayah belum diisi !")
		nama_lgkp_ayh.focus()
		nama_lgkp_ayh.value=""
		return (false)
	}
	else if(nama_ket_rt.value == "")
	{
		alert("Nama Ketua RT belum diisi !")
		nama_lgkp_ayh.focus()
		nama_lgkp_ayh.value=""
		return (false)
	}

	else if(nama_pet_reg.value == "")
	{
		alert("Nama Petugas Registrar belum diisi !")
		nama_pet_reg.focus()
		nama_pet_reg.value=""
		return (false)
	}

	else if(!isNaN(nama_lgkp_ibu.value))
	{
		alert("Should be only characters !")
		nama_lgkp_ibu.focus()
		nama_lgkp_ibu.value=""
		return (false)
	}

	else if(!isNaN(nama_lgkp_ayh.value))
	{
		alert("Should be only characters !")
		nama_lgkp_ayh.focus()
		nama_lgkp_ayh.value=""
		return (false)
	}

	else if(!isNaN(nama_ket_rt.value))
	{
		alert("Should be only characters !")
		nama_ket_rt.focus()
		nama_ket_rt.value=""
		return (false)
	}

	else if(!isNaN(nama_ket_rw.value))
	{
		alert("Should be only characters !")
		nama_ket_rw.focus()
		nama_ket_rw.value=""
		return (false)
	}

	else if(!isNaN(nama_pet_reg.value))
	{
		alert("Should be only characters !")
		nama_pet_reg.focus()
		nama_pet_reg.value=""
		return (false)
	}
	else if(isNaN(nip_pet_reg.value))
	{
		alert("Should be numeric !")
		nip_pet_reg.focus()
		nip_pet_reg.value=""
		return false
	}

	var temp = nama_lgkp.value
	var temp1 = nama_lgkp_ibu.value
	var temp2 = nama_lgkp_ayh.value
	var temp3 = nama_ket_rt.value
	var temp4 = nama_ket_rw.value
	var temp5 = nama_pet_reg.value
	var temp6 = nip_pet_reg.value

	var obj = /^(\s*)([\W\w]*)(\b\s*$)/

	if (obj.test(temp) || obj.test(temp1) || obj.test(temp2) || obj.test(temp3) || obj.test(temp4) || obj.test(temp5) || obj.test(temp6))
	{
		temp = temp.replace(obj, '$2');
		temp1 = temp1.replace(obj, '$2');
		temp2 = temp2.replace(obj, '$2');
		temp3 = temp3.replace(obj, '$2');
		temp4 = temp4.replace(obj, '$2');
		temp5 = temp5.replace(obj, '$2');
		temp6 = temp6.replace(obj, '$2');
	}

	var obj = / +/g;

	temp = temp.replace(obj, " ");
	temp1 = temp1.replace(obj, " ");
	temp2 = temp2.replace(obj, " ");
	temp3 = temp3.replace(obj, " ");
	temp4 = temp4.replace(obj, " ");
	temp5 = temp5.replace(obj, " ");
	temp6 = temp6.replace(obj, " ");

	if (temp == " " || temp1 == " " || temp2 == " " || temp3 == " " || temp4 == " " || temp5 == " " || temp6 == " ")
	{
		temp = "";
		temp1 = "";
		temp2 = "";
		temp3 = "";
		temp4 = "";
		temp5 = "";
		temp6 = "";
	}

	s = "1. Apakah ejaan dan penulisam Nama Lengkap sudah benar ?\n2. Apakah pilihan Jenis Kelamin sudah benar ?\n3. Apakah Tempat Lahir sudah benar ?\n4. Apakah Tanggal Berakhir Paspor ?\n5. Apakah Tanggal Lahir ?\n6. Apakah pilihan Agama sudah benar ?\n7. Apakah ejaan dan penulisam Nama Lengkap Ibu sudah benar ?\n8. Apakah ejaan dan penulisam Nama Lengkap Ayah sudah benar ?\n9. Apakah Nama Ketua RT sudah benar ?"

	if(confirm(s) == true)
	{
		document.writeln("Accepted the enteries!..")
	}
}

function validate1()
{
	if(akta_lhr.options[2].selected == true)
	{
		no_akta_lhr.disabled = true
		gol_drh.options.focus()
		return(false)
	}
	else
	{
		no_akta_lhr.disabled = false

		if(no_akta_lhr.value == "")
		{
			alert("Nomor Akta/Surat Kenal Lahir belum diisi")
			no_akta_lhr.focus()
			no_akta_lhr.value=""
			return (false)
		}
	}
}

function validate2()
{
	if(aga_ma.options[6].selected == true)
	{
		agama.disabled = false
		agama.focus()
		agama.value=""
		return(false)
	}
}

function validate3()
{
	if(stat_kwn.options[1].selected == true)
	{
		akta_kwn.options.disabled = true
		no_akta_kwn.disabled = true
		tgl_kwn_dd.disabled = true
		tgl_kwn_mm.disabled = true
		tgl_kwn_yy.disabled = true
		akta_crai.options.disabled = true
		no_akta_crai.disabled = true
		tgl_crai_dd.disabled = true
		tgl_crai_mm.disabled = true
		tgl_crai_yy.disabled = true
		stat_hbkel.options.focus()
		return(false)
	}
	else if(stat_kwn.options[2].selected == true)
	{
		akta_kwn.options.disabled = false
		no_akta_kwn.disabled = false
		tgl_kwn_dd.disabled = false
		tgl_kwn_mm.disabled = false
		tgl_kwn_yy.disabled = false
		akta_crai.options.disabled = true
		no_akta_crai.disabled = true
		tgl_crai_dd.disabled = true
		tgl_crai_mm.disabled = true
		tgl_crai_yy.disabled = true
		stat_hbkel.options.focus()

		/*if(jenis_klmin.options[1].selected == true && jenis_klmin.options[1].selected == true)
		{
			today = new Date()

			mm = no_akta_lhr_mm.value
			yy = no_akta_lhr_yy.value

			tmm = today.getMonth()
			tyy = today.getYear()

			years = parseInt(tyy) - parseInt(yy)

			if(mm < 12)
			{
				alert("Your age is " +  (years-1) + " years")
			}

			else if(mm >= 12)
			{
				 alert("Your age is " +  (years) + " years")
			 }
			 else
			 {
				 alert("Your age is " +  years + " years")
			 }

		}*/

		return(false)
	}
	else if(stat_kwn.options[3].selected == true || stat_kwn.options[4].selected == true)
	{
		akta_kwn.options.disabled = true
		no_akta_kwn.disabled = true
		tgl_kwn_dd.disabled = true
		tgl_kwn_mm.disabled = false
		tgl_kwn_yy.disabled = false
		akta_crai.options.disabled = false
		no_akta_crai.disabled = false
		tgl_crai_dd.disabled = false
		tgl_crai_mm.disabled = false
		tgl_crai_yy.disabled = false
		stat_hbkel.options.focus()
		return(false)
	}
}

function validate4()
{
	 if(akta_kwn.options[1].selected == true)
	{
			no_akta_kwn.disabled = true
			tgl_kwn_dd.focus()
			tgl_kwn_dd.value=""
			return(false)
	}

	else if(akta_kwn.options[2].selected == true)
	{
		alert("Nomor Akta Perkawinan/Buku Nikah belum diisi !")
		no_akta_kwn.disabled = false
		no_akta_kwn.focus()
		no_akta_kwn.value=""
		return(false)
	}
}

function validate5()
{
	alert("Enter Nomor Akta Perkawinan")
	no_akta_kwn.focus()
	no_akta_kwn.value=""
	return(false)
}

function validate6()
{
	 if(akta_crai.options[1].selected == true)
	{
			no_akta_crai.disabled = true
			tgl_crai_dd.focus()
			tgl_crai_dd.value=""
			return(false)
	}

	else if(akta_crai.options[2].selected == true)
	{
		alert("Nomor Akta Perceraian/Surat Cerai belum diisi !")
		no_akta_crai.disabled = false
		no_akta_crai.focus()
		no_akta_crai.value=""
		return(false)
	}
}

function validate7()
{
	alert("Enter Nomor Akta Perceraian/Surat Cerai belum diisi !")
	no_akta_crai.focus()
	no_akta_crai.value=""
	return(false)
}

function validate8()
{
	 if(klain_fisik.options[1].selected == true)
	{
		pnydng_cct.disabled = true
		pddk_akh.focus()
		pddk_akh.value=""
		return(false)
	}

	else if(klain_fisik.options[2].selected == true)
	{
		pnydng_cct.disabled = false
		alert("Jenis Penyandang Cacat belum diisi !")
		pnydng_cct.focus()
		pnydng_cct.value=""
		return(false)
	}
}

function validate9()
{
	if(isNaN(nik_ibu.value))
	{
		alert("Should be numeric !")
		nik_ibu.focus()
		nik_ibu.value=""
		return false
	}
}

function validate10()
{
	if(isNaN(nik_ayh.value))
	{
		alert("Should be numeric !")
		nik_ayh.focus()
		nik_ayh.value=""
		return false
	}
}

function tab()
{
	if(no_akta_lh_dd.value.length > 1)
	{
		if(isNaN(no_akta_lh_dd.value))
		{
			alert("Should be numeric!")
			no_akta_lh_dd.focus()
			no_akta_lh_dd.value=""
			return(false)
		}

		no_akta_lh_mon.focus()
		return false
	}
}

function tab1()
{
	if(no_akta_lh_mon.value.length > 1)
	{
		if(isNaN(no_akta_lh_mon.value))
		{
			alert("Should be numeric!")
			no_akta_lh_mon.focus()
			no_akta_lh_mon.value=""
			return(false)
		}
		no_akta_lh_yy.focus()
		return false
	}
}

function tab2()
{
	 if(no_akta_lh_yy.value.length > 3)
	{
		if(isNaN(no_akta_lh_yy.value))
		{
			alert("Should be numeric!")
			no_akta_lh_yy.focus()
			no_akta_lh_yy.value=""
			return(false)
		}
		nama_lgkp.focus()
		return false
	}
}

function tab3()
{
	if(no_akta_lhr_dd.value.length > 1)
	{
		if(isNaN(no_akta_lhr_dd.value))
		{
			alert("Should be numeric!")
			no_akta_lhr_dd.focus()
			no_akta_lhr_dd.value=""
			return(false)
		}
		no_akta_lhr_mm.focus()
		return false
	}
}

function tab4()
{
	if(no_akta_lhr_mm.value.length > 1)
	{
		if(isNaN(no_akta_lhr_mm.value))
		{
			alert("Should be numeric!")
			no_akta_lhr_mm.focus()
			no_akta_lhr_mm.value=""
			return(false)
		}

		no_akta_lhr_yy.focus()
		return false
	}
}
function tab5()
{
	if(no_akta_lhr_yy.value.length > 3)
	{
		if(isNaN(no_akta_lhr_yy.value))
		{
			alert("Should be numeric!")
			no_akta_lhr_yy.focus()
			no_akta_lhr_yy.value=""
			return(false)
		}
		akta_lhr.options.focus()
		return false
	}
}
function tab6()
{
	if(tgl_kwn_dd.value.length > 1)
	{
		if(isNaN(tgl_kwn_dd.value))
		{
			alert("Should be numeric!")
			no_akta_lhr_yy.focus()
			no_akta_lhr_yy.value=""
			return(false)
		}
		tgl_kwn_mm.focus()
		return false
	}
}
function tab7()
{
	if(tgl_kwn_mm.value.length > 1)
	{
		if(isNaN(tgl_kwn_mm.value))
		{
			alert("Should be numeric!")
			tgl_kwn_mm.focus()
			tgl_kwn_mm.value=""
			return(false)
		}

		tgl_kwn_yy.focus()
		return false
	}
}
function tab8()
{
	if(tgl_kwn_yy.value.length > 3)
	{
		if(isNaN(tgl_kwn_yy.value))
		{
			alert("Should be numeric!")
			tgl_kwn_yy.focus()
			tgl_kwn_yy.value=""
			return(false)
		}
		akta_crai.options.focus()
		return false
	}
}
function tab9()
{
	if(tgl_crai_dd.value.length > 1)
	{
		if(isNaN(tgl_crai_dd.value))
		{
			alert("Should be numeric!")
			tgl_crai_dd.focus()
			tgl_crai_dd.value=""
			return(false)
		}
		tgl_crai_mm.focus()
		return false
	}
}
function tab10()
{
	 if(tgl_crai_mm.value.length > 1)
	{
		if(isNaN(tgl_crai_dd.value))
		{
			alert("Should be numeric!")
			tgl_crai_dd.focus()
			tgl_crai_dd.value=""
			return(false)
		}
		tgl_crai_yy.focus()
		return false
	}
}
function tab11()
{
	if(tgl_crai_yy.value.length > 3)
	{
		stat_hbkel.options.focus()
		return false
	}
}
function tab12()
{
	if(no_akta_lhr45.value.length > 1)
	{
		no_akta_lhr225.focus()
		return false
	}
}
function tab13()
{
	if(no_akta_lhr225.value.length > 1)
	{
		no_akta_lhr325.focus()
		return false
	}
}
function tab14()
{
	if(no_akta_lhr325.value.length > 3)
	{
		button.focus()
		return false
	}
}

