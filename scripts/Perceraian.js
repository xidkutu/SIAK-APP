

function cerai()
{
	// *************** Validations for Data Perceraian *********************


 if(form1.ktrunan_suami.options[0].selected == true)
{
alert("Belum Pilih Keturunan Suami!");
tp1.setSelectedIndex(0)
form1.ktrunan_suami.focus()
return(false)
}

if(form1.stat_kwn_sblm_nkh_suami.options[0].selected == true)
{
alert("Belum Pilih Status Perkawinan Sebelum Nikah Suami!");
tp1.setSelectedIndex(0)
form1.stat_kwn_sblm_nkh_suami.focus()
return(false)
}

if(form1.crai_ke_suami.value=="")
{
alert("Belum Pilih Perceraian Yang Ke bagi Suami!");
tp1.setSelectedIndex(0)
form1.crai_ke_suami.focus()
return(false)
}
if(form1.kwn_ke_suami.value=="")
{
alert("Belum Pilih Perkawinan Yang Ke bagi Suami!");
tp1.setSelectedIndex(0)
form1.kwn_ke_suami.focus()
return(false)
}


if(form1.ktrunan_istri.options[0].selected == true)
{
alert("Belum Pilih Keturunan Istri!");
tp1.setSelectedIndex(1)
form1.ktrunan_istri.focus();
 return(false)
}

if(form1.stat_kwn_sblm_nkh_istri.options[0].selected == true)
{
alert("Belum Pilih Status Perkawinan Sebelum Nikah Istri!");
tp1.setSelectedIndex(1)
form1.stat_kwn_sblm_nkh_istri.focus();
		return(false)
}

if(form1.kwn_ke_istri.value=="")
{
alert("Belum Pilih Perkawinan Yang Ke bagi Istri!");
tp1.setSelectedIndex(1)
form1.kwn_ke_istri.focus();
return(false)
}

if(form1.jml_ank.value=="")
{
alert("Belum Pilih Jumlah Anak!");
tp1.setSelectedIndex(1)
form1.jml_ank.focus();
return(false)
}

if(parseInt(form1.jml_ank.value,10)>0 && form1.yg_btgung_pmel_ank.options[0].selected == true)
{
alert("Belum Pilih Yang Bertanggung Jawab Dalam Pemeliharaan Anak!");
tp1.setSelectedIndex(1)
form1.yg_btgung_pmel_ank.disable = false;
form1.yg_btgung_pmel_ank.focus();
return(false)
} else if(parseInt(form1.jml_ank.value,10)==0) {
form1.yg_btgung_pmel_ank.options[0].selected = true;
form1.yg_btgung_pmel_ank.disable = true;
}
 if(form1.yg_aju_crai.options[0].selected == true)
	{
		alert("Yang Mengajukan Perceraian belum diisi !")
		tp1.setSelectedIndex(3)
		form1.yg_aju_crai.options.focus()
		return(false)
	}
if (trim(form1.no_akta_kwn.value)=="")
{
   alert("No akta kawin belum diisi !")
   form1.no_akta_kwn.focus();
   return false;
}

if (trim(form1.tgl_akta_kwn_dd.value)=="")
{
   alert("Tanggal akta kawin belum diisi !")
   form1.tgl_akta_kwn_dd.focus();
   return false;
}

if (trim(form1.tgl_akta_kwn_mm.value)=="")
{
   alert("Tanggal akta kawin belum diisi !")
   form1.tgl_akta_kwn_mm.focus();
   return false;
}

if (trim(form1.tgl_akta_kwn_yy.value)=="")
{
   alert("Tanggal akta kawin belum diisi !")
   form1.tgl_akta_kwn_yy.focus();
   return false;
}
form1.tgl_akta_kwn.value=form1.tgl_akta_kwn_dd.value+"-"+form1.tgl_akta_kwn_mm.value+"-"+form1.tgl_akta_kwn_yy.value;
 if (form1.tmpt_ctt_kwn.value == "")
    {
             alert("Tempat Pencatatan Perkawinan belum diisi !");
              tp1.setSelectedIndex(3)
             form1.tmpt_ctt_kwn.focus();
             form1.tmpt_ctt_kwn.value=""
             return false;
    }

 if(form1.no_srt_ket_pn.value == "")
	{
		alert("Nomor Surat Keterangan Panitera Pengadilan Negeri belum diisi !")
		tp1.setSelectedIndex(3)
		form1.no_srt_ket_pn.focus()
		form1.no_srt_ket_pn.value=""
		return(false)
	}

	if(form1.tgl_srt_ket_pn_dd.value == "")
	{
		alert("Tanggal Keterangan Panitera Pengadilan Negeri belum diisi!")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_ket_pn_dd.focus()
		form1.tgl_srt_ket_pn_dd.value=""
		return(false)
	}
	if(form1.tgl_srt_ket_pn_dd.value.length != 2)
	{
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_ket_pn_dd.focus()
		form1.tgl_srt_ket_pn_dd.value=""
		return(false)
	}
	if(form1.tgl_srt_ket_pn_mm.value == "")
	{
		alert("Bulan Keterangan Panitera Pengadilan Negeri belum diisi !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_ket_pn_mm.focus()
		form1.tgl_srt_ket_pn_mm.value=""
		return(false)
	}
	if(form1.tgl_srt_ket_pn_mm.value.length != 2)
	{
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_ket_pn_mm.focus()
		form1.tgl_srt_ket_pn_mm.value=""
		return(false)
	}
	if(form1.tgl_srt_ket_pn_yy.value == "" )
	{
		alert("Tahun Keterangan Panitera Pengadilan Negeri belum diisi !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_ket_pn_yy.focus()
		form1.tgl_srt_ket_pn_yy.value=""
		return(false)
	}
	if(form1.tgl_srt_ket_pn_yy.value.length != 4)
	{
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_ket_pn_yy.focus()
		form1.tgl_srt_ket_pn_yy.value=""
		return(false)
	}
        validasiTanggal(form1.tgl_srt_ket_pn_dd, form1.tgl_srt_ket_pn_mm, form1.tgl_srt_ket_pn_yy, true, 3)


	if(form1.no_kep_pngadil.value == "")
	{
		alert("Nomor Keputusan Pengadilan belum diisi !")
		tp1.setSelectedIndex(3)
		form1.no_kep_pngadil.focus()
		form1.no_kep_pngadil.value=""
		return(false)
	}


	if(form1.tgl_srt_kep_pngadil_dd.value == "")
	{
		alert("Tanggal Surat Keputusan Pengadilan belum diisi !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_kep_pngadil_dd.focus()
		form1.tgl_srt_kep_pngadil_dd.value=""
		return(false)
	}
	if(form1.tgl_srt_kep_pngadil_dd.value.length != 2)
	{
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_kep_pngadil_dd.focus()
		form1.tgl_srt_kep_pngadil_dd.value=""
		return(false)
	}
	if(form1.tgl_srt_kep_pngadil_mm.value == "")
	{
		alert("Bulan Surat Keputusan Pengadilan belum diisi !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_kep_pngadil_mm.focus()
		form1.tgl_srt_kep_pngadil_mm.value=""
		return(false)
	}
	if(form1.tgl_srt_kep_pngadil_mm.value.length != 2)
	{
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_kep_pngadil_mm.focus()
		form1.tgl_srt_kep_pngadil_mm.value=""
		return(false)
	}
	if(form1.tgl_srt_kep_pngadil_yy.value == "" )
	{
		alert("Tahun Surat Keputusan Pengadilan belum diisi !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_kep_pngadil_yy.focus()
		form1.tgl_srt_kep_pngadil_yy.value=""
		return(false)
	}
	if(form1.tgl_srt_kep_pngadil_yy.value.length != 4)
	{
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_srt_kep_pngadil_yy.focus()
		form1.tgl_srt_kep_pngadil_yy.value=""
		return(false)
	}
        validasiTanggal(form1.tgl_srt_kep_pngadil_dd, form1.tgl_srt_kep_pngadil_mm, form1.tgl_srt_kep_pngadil_yy, true, 3)

	if(form1.lbg_pngadil_kel_kep.options[0].selected == true)
	{
		alert("Lembaga Pengadilan yang Mengeluarkan Keputusan belum diisi !")
		tp1.setSelectedIndex(3)
		form1.lbg_pngadil_kel_kep.focus()
		return false
	}

	if(form1.tmpt_lbg_pngadil.value == "")
	{
		alert("Tempat Lembaga Pengadilan belum diisi !")
		tp1.setSelectedIndex(3)
		form1.tmpt_lbg_pngadil.focus()
		return(false)
	}

	if(form1.sbab_crai.options[0].selected == true)
	{
		alert("Sebab Perceraian belum diisi !")
		tp1.setSelectedIndex(3)
		form1.sbab_crai.focus()
		return false
	}

	if(form1.dd_mlpor.value == "")
	{
		alert("Tanggal belum diisi !")
		tp1.setSelectedIndex(3)
		form1.dd_mlpor.focus()
		form1.dd_mlpor.value=""
		return(false)
	}

	if(form1.dd_mlpor.value.length != 2)
	{
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.dd_mlpor.focus()
		form1.dd_mlpor.value=""
		return(false)
	}
	if(form1.mm_mlpor.value == "")
	{
		alert("Bulan belum diisi !")
		tp1.setSelectedIndex(3)
		form1.mm_mlpor.focus()
		form1.mm_mlpor.value=""
		return(false)
	}
	if(form1.mm_mlpor.value.length != 2)
	{
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.mm_mlpor.focus()
		form1.mm_mlpor.value=""
		return(false)
	}
	if(form1.yy_mlpor.value == "" )
	{
		alert("Tahun belum diisi !")
		tp1.setSelectedIndex(3)
		form1.yy_mlpor.focus()
		form1.yy_mlpor.value=""
		return(false)
	}
	if(form1.yy_mlpor.value.length != 4)
	{
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(3)
		form1.yy_mlpor.focus()
		form1.yy_mlpor.value=""
		return(false)
	}

	if(form1.tgl_daft_crai_drln_dd.value !="" && form1.tgl_daft_crai_drln_dd.value.length != 2)
	{
		alert("Pengisian tanggal harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_daft_crai_drln_dd.focus()
		form1.tgl_daft_crai_drln_dd.value=""
		return(false)
	}
	if(form1.tgl_daft_crai_drln_mm.value != "" && form1.tgl_daft_crai_drln_mm.value.length != 2)
	{
		alert("Pengisian bulan harus 2 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_daft_crai_drln_mm.focus()
		form1.tgl_daft_crai_drln_mm.value=""
		return(false)
	}
	if(form1.tgl_daft_crai_drln_yy.value != "" && form1.tgl_daft_crai_drln_yy.value.length != 4)
	{
		alert("Pengisian tahun harus 4 digit !")
		tp1.setSelectedIndex(3)
		form1.tgl_daft_crai_drln_yy.focus()
		form1.tgl_daft_crai_drln_yy.value=""
		return(false)
	}
        validasiTanggal(form1.dd_mlpor, form1.mm_mlpor, form1.yy_mlpor, true, 3)

        if (form1.tgl_daft_crai_drln_dd.value!="" || form1.tgl_daft_crai_drln_mm.value!="" || form1.tgl_daft_crai_drln_yy.value!="") {
           validasiTanggal(form1.tgl_daft_crai_drln_dd, form1.tgl_daft_crai_drln_mm, form1.tgl_daft_crai_drln_yy, true, 3)
        }

	// ***************	 Validations for Data Administrasi *******************


     if(form1.dsrhk_cttcrai.options[0].selected == true)
	{
		alert("Dasar Hukum Pencatatan Perceraian belum diisi !")
		tp1.setSelectedIndex(4)
		form1.dsrhk_cttcrai.options.focus()
		return(false)
	}


	 if(form1.nama_pet_reg.value == "")
	{
		alert("Nama Petugas Pencatat/Registrar belum diisi !")
		tp1.setSelectedIndex(4)
		form1.nama_pet_reg.focus()
		return (false)
	}
	 if(form1.nip_pet_reg.value == "")
	{
		alert("NIP Petugas Pencatat/Registrar belum diisi !")
		tp1.setSelectedIndex(4)
		form1.nip_pet_reg.focus()
		return (false)
	}
	 if(form1.nip_pet_reg.value.length != "" && form1.nip_pet_reg.value.length != 9)
	{
		alert("NIP Petugas Pencatat/Registrar  harus 9 digit !")
		tp1.setSelectedIndex(4)
		form1.nip_pet_reg.focus()
		return (false)
	}
        form1.kon.disabled = true;
        //form1.sim.disabled = true;
        form1.kel.disabled = true;
        form1.submit();

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
        return false
}

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




function tab7(itm,itmnext)
{

	if(itm.value.length > 1)
	{


	 for(i = 0; i < itm.value.length;i++)
		{
			if(isNaN(itm.value.charAt(i)) || itm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				itm.focus()
				itm.value=""
				return(false)
			}
		}
		if(itm.value > 31 || itm.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !")
			itm.focus()
			itm.value=""
			return(false)
		}
		itmnext.focus()
		return false
	}
}

function tab8(itm,itmnext)
{
	if(itm.value.length > 1)
	{
		for(i = 0; i < itm.value.length;i++)
		{
			if(isNaN(itm.value.charAt(i)) || itm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				itm.focus()
				itm.value=""
				return(false)
			}
		}
		if(itm.value > 12 || itm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !")
			itm.focus()
			itm.value=""
			return(false)
		}
		itmnext.focus()
		return false
	}
}

function tab9(eld,elm,ely,itmnext)
{
	d = new Date(elm.value+"/"+eld.value+"/"+ely.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(ely.value.length > 3)
	{
		for(i = 0; i < ely.value.length;i++)
		{
			if(isNaN(ely.value.charAt(i)) || ely.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				ely.focus()
				ely.value=""
				return(false)
			}
		}
		  if(ely.value < 1900 || ely.value > d3 || ely.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
			ely.focus()
			ely.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !")
			ely.focus()
			ely.value=""
			elm.focus()
			elm.value=""
			eld.focus()
			eld.value=""

			return(false)
		}
      if (itmnext!=null)  itmnext.focus()
		return false
	}

}

function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function setSaveEnabled(flag) {
  form1.sim.disabled = !flag;
  form1.kon.disabled = flag;
}
function tanggungAnak(jumlahAnak) {
  if (jumlahAnak>0) {
     form1.yg_btgung_pmel_ank.disabled = false;
     tp1.setSelectedIndex(1);
     form1.yg_btgung_pmel_ank.focus();
  } else {
     form1.yg_btgung_pmel_ank.disabled = true;
  }
}