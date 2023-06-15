function checkHbKel(hbkel)
{
  if ((form1.stat_hbkel_temp.value==1)
             &&
          (hbkel.options[hbkel.selectedIndex].value!=1))
    {
      alert("Status hubungan dlm keluarga salah !!");
      hbkel.selectedIndex=1;
      hbkel.focus();
       return(false);
    }
}

function valid()
{
	if(form1.nama_lgkp.value == "")
	{
		alert("Nama Lengkap belum diisi !")
		form1.nama_lgkp.focus()
		form1.nama_lgkp.value=""
		return false
	}
	if(form1.no_akta_lh_yy.value != "" && form1.no_akta_lh_yy.value.length != 4)
	{
		alert("Pengisian tahun harus dengan format yyyy !.")
		form1.no_akta_lh_yy.focus()
		form1.no_akta_lh_yy.value=""
		return(false)
	}
        if(form1.tmpt_lhr.value == "")
	{
		alert("Tempat Lahir belum diisi !.")
		form1.tmpt_lhr.focus()
		form1.tmpt_lhr.value=""
		return(false)
	}

	/*if(form1.akta_lhr.options[0].selected == true)
	{
		alert("Akta Kelahiran/Surat Kenal Lahir belum diisi !.")
		form1.akta_lhr.focus()
		return (false)
	}
	if(form1.akta_lhr.options[1].selected == true && form1.no_akta_lhr.value == "")
	{
		alert("Nomor Akta Kelahiran/Surat Kenal Lahir belum diisi !.")
		form1.no_akta_lhr.focus()
		return (false)
	}

	var nowDate = new Date(form1.no_akta_lhr_yy.value,form1.no_akta_lhr_mm.value,form1.no_akta_lhr_dd.value)

	todayDate = new Date()

	var one_year=1000*60*60*24*365

	var years = Math.ceil(todayDate-nowDate)/(one_year)*/


	if(form1.gol_drh.options[0].selected == true)
	{
		alert("Golongan Darah belum diisi !.")
		form1.gol_drh.focus()
		return (false)
	}

	if(form1.aga_ma.options[0].selected == true)
	{
		alert("Agama belum diisi")
		form1.aga_ma.focus()
		return (false)
	}
	if(form1.aga_ma.options[6].selected == true && form1.agama.value == "")
	{
		alert("Isi Agama yang Sesuai !")
		form1.agama.focus()
		return (false)
	}
/*	 if(form1.stat_kwn.options[0].selected == true)
	{
		alert("Status Perkawinan belum diisi !.")
		form1.stat_kwn.focus()
		return (false)
	}
	if(form1.stat_kwn.options[2].selected == true && form1.akta_kwn.options[0].selected == true)
	{
        	alert("Akta Perkawinan/Buku Nikah belum diisi !.")
		form1.akta_kwn.focus()
		return (false)
	}
	if(form1.jenis_klmin.options[1].selected == true && (form1.stat_kwn.options[2].selected == true || form1.stat_kwn.options[3].selected == true || form1.stat_kwn.options[4].selected == true))
	{
		if(years < 17)
		{
			alert("Penduduk ini masih di bawah usia perkawinan !.")
			form1.stat_kwn.options.focus()
			return false
		}
	}

	if((form1.jenis_klmin.options[1].selected == true && years < 17 ) && (form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '1 - Suami' || form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '4 - Menantu' || form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '6 - OrangTua' || form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '7 - Mertua'))
	{
		alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !.")
		form1.stat_hbkel.options.focus()
		return false
	}
	if((form1.jenis_klmin.options[2].selected == true && years < 15 ) && (form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '2 - Istri' || form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '4 - Menantu' || form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '6 - OrangTua' || form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '7 - Mertua'))
	{
		alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !.")
		form1.stat_hbkel.options.focus()
		return false
	}
	if(form1.jenis_klmin.options[1].selected == true && years < 17 && form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '1 - Kepala Keluarga')
	{
		alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !.")
		form1.stat_hbkel.options.focus()
		return false
	}
	if(form1.jenis_klmin.options[2].selected == true && years < 15 && form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '1 - Kepala Keluarga')
	{
		alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !.")
		form1.stat_hbkel.options.focus()
		return false
	}
	if(form1.jenis_klmin.options[2].selected == true && (form1.stat_kwn.options[2].selected == true || form1.stat_kwn.options[3].selected == true || form1.stat_kwn.options[4].selected == true))
	{
		if(years < 15)
		{
			alert("Penduduk ini masih di bawah usia perkawinan !.")
			form1.stat_kwn.options.focus()
			return false
		}
	}

	 if(form1.akta_kwn.options[2].selected == true && form1.no_akta_kwn.value == "")
	 {
		 alert("Nomor Akta Perkawinan/Buku Nikah belum diisi !.")
		 form1.no_akta_kwn.focus()
		 form1.no_akta_kwn.value=""
	 }

	 if(form1.stat_kwn.options[3].selected == true && form1.akta_crai.options[0].selected == true)
	{
		alert("Akta Perceraian/Surat Cerai  belum diisi !.")
		form1.akta_crai.focus()
		return (false)
	}
	 if(form1.stat_kwn.options[4].selected == true && form1.akta_crai.options[0].selected == true)
	{
		alert("Akta Perceraian/Surat Cerai  belum diisi !.")
		form1.akta_crai.focus()
		return (false)
	}

	if(form1.stat_hbkel.options[0].selected == true)
	{
		alert("Status Hubungan dlm Keluarga belum diisi !.")
		form1.stat_hbkel.focus()
		return (false)
	}
	if(form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '1 - Suami' && form1.jenis_klmin.options[2].selected == true)
	{
		alert("Data salah, SHDK suami/istri tidak cocok dengan jenis kelamin!.")
		form1.stat_hbkel.focus()
		return false
	}
	if(form1.stat_hbkel.options[form1.stat_hbkel.selectedIndex].text == '2 - Istri' &&form1.jenis_klmin.options[1].selected == true)
	{
		alert("Data salah, SHDK suami/istri tidak cocok dengan jenis kelamin!.")
		form1.stat_hbkel.focus()
		return false
	}

	 if(form1.klain_fisik.options[0].selected == true)
	{
		alert("Kelainan Fisik dan Mental  belum diisi")
		form1.klain_fisik.focus()
		return (false)
	}
	if(form1.klain_fisik.options[2].selected == true && form1.pnydng_cct.options[0].selected == true)
	{
		alert("Penyandang Cacat belum diisi !.")
		form1.pnydng_cct.focus()
		return (false)
	}
	if(form1.pddk_akh.options[0].selected == true)
	{
		alert("Pendidikan Terakhir belum diisi !.")
		form1.pddk_akh.focus()
		return (false)
	}
	if((form1.pddk_akh.options[3].selected == true && years < 9) || (form1.pddk_akh.options[4].selected == true && years < 12) || (form1.pddk_akh.options[5].selected == true && years < 15) || (form1.pddk_akh.options[6].selected == true && years < 15) || (form1.pddk_akh.options[7].selected == true && years < 15) || (form1.pddk_akh.options[8].selected == true && years < 17) || (form1.pddk_akh.options[9].selected == true && years < 17) || (form1.pddk_akh.options[10].selected == true && years < 17))
	{
		alert ("Pendidikan Akhir tidak sesuai dengan usia !.")
		form1.pddk_akh.focus()
		return false
	}

	if(form1.jenis_pkrjn.options[0].selected == true)
	{
		alert("Jenis Pekerjaan belum diisi !.")
		form1.jenis_pkrjn.focus()
		return (false)
	}

	if((form1.jenis_pkrjn.options[1].selected == true && years < 5) && (form1.stat_kwn.options[2].selected == true || form1.stat_kwn.options[3].selected == true || form1.stat_kwn.options[4].selected == true))
	{
		alert ("Jenis Pekerjaan tidak sesuai dengan usia !.")
		form1.jenis_pkrjn.focus()
		return false
	}

	if((form1.jenis_pkrjn.options[2].selected == true && years < 15) || (form1.jenis_pkrjn.options[3].selected == true && years < 45) || (form1.jenis_pkrjn.options[5].selected == true && years < 15) || (form1.jenis_pkrjn.options[6].selected == true && years < 15) || (form1.jenis_pkrjn.options[7].selected == true && years < 15) || (form1.jenis_pkrjn.options[8].selected == true && years < 15) || (form1.jenis_pkrjn.options[9].selected == true && years < 15) || (form1.jenis_pkrjn.options[10].selected == true && years < 15) || (form1.jenis_pkrjn.options[11].selected == true && years < 17) || (form1.jenis_pkrjn.options[12].selected == true && years < 17) || (form1.jenis_pkrjn.options[13].selected == true && years < 17) || (form1.jenis_pkrjn.options[14].selected == true && years < 17))
	{
		alert ("Jenis Pekerjaan tidak sesuai dengan usia !.")
		form1.jenis_pkrjn.focus()
		return false
	}*/

	if(form1.nik_ibu.value != "" && form1.nik_ibu.value.length < 16)
	{
		alert("NIK Ibu harus 16 digits !.")
		form1.nik_ibu.focus()
		return false
	}
	if(form1.nik_ayh.value != "" &&  form1.nik_ayh.value.length < 16)
	{
		alert("NIK Ayah harus 16 digits !.")
		form1.nik_ayh.focus()
		return false
	}
/*
	if(form1.nama_ket_rt.value == "")
	{
		alert("Nama Ketua RT belum diisi !")
		form1.nama_ket_rt.focus()
		form1.nama_ket_rt.value=""
		return (false)
	}
*/
	if(form1.nama_pet_reg.value == "")
	{
		alert("Nama Petugas Registrar belum diisi !")
		form1.nama_pet_reg.focus()
		form1.nama_pet_reg.value=""
		return (false)
	}
	 if(form1.nip_pet_reg.value.length != "" && form1.nip_pet_reg.value.length != 9)
	{
		alert("NIP Petugas Registrar harus 9 digit !")
		form1.nip_pet_reg.focus()
		form1.nip_pet_reg.value=""
		return (false)
	}
}
function validsk()
{
	if(form1.nama_lgkp.value == "")
	{
		alert("Nama Lengkap belum diisi !")
		form1.nama_lgkp.focus()
		form1.nama_lgkp.value=""
		return false
	}
	if(form1.sk_tgl_yyyy.value != "" && form1.sk_tgl_yyyy.value.length != 4)
	{
		alert("Pengisian tahun harus dengan format yyyy !.")
		form1.sk_tgl_yyyy.focus()
		form1.sk_tgl_yyyy.value=""
		return(false)
	}



	if(form1.nama_pet_reg.value == "")
	{
		alert("Nama Petugas Registrar belum diisi !")
		form1.nama_pet_reg.focus()
		form1.nama_pet_reg.value=""
		return (false)
	}
	 if(form1.nip_pet_reg.value.length != "" && form1.nip_pet_reg.value.length != 9)
	{
		alert("NIP Petugas Registrar harus 9 digit !")
		form1.nip_pet_reg.focus()
		form1.nip_pet_reg.value=""
		return (false)
	}
}
function validsd()
{
	if(form1.nama_lgkp.value == "")
	{
		alert("Nama Lengkap belum diisi !")
		form1.nama_lgkp.focus()
		form1.nama_lgkp.value=""
		return false
	}
	if(form1.ijazah_yyyy.value != "" && form1.ijazah_yyyy.value.length != 4)
	{
		alert("Pengisian tahun harus dengan format yyyy !.")
		form1.ijazah_yyyy.focus()
		form1.ijazah_yyyy.value=""
		return(false)
	}



	if(form1.nama_pet_reg.value == "")
	{
		alert("Nama Petugas Registrar belum diisi !")
		form1.nama_pet_reg.focus()
		form1.nama_pet_reg.value=""
		return (false)
	}
	 if(form1.nip_pet_reg.value.length != "" && form1.nip_pet_reg.value.length != 9)
	{
		alert("NIP Petugas Registrar harus 9 digit !")
		form1.nip_pet_reg.focus()
		form1.nip_pet_reg.value=""
		return (false)
	}
}
function validKendali()
{


}