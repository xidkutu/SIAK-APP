
function tab12()
{

	if(form1.tgl_pembktan_kwn_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_pembktan_kwn_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_pembktan_kwn_dd.value.charAt(i)) || form1.tgl_pembktan_kwn_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_pembktan_kwn_dd.disabled = false;
				form1.tgl_pembktan_kwn_dd.focus()
				form1.tgl_pembktan_kwn_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_pembktan_kwn_dd.value > 31 || form1.tgl_pembktan_kwn_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
                        form1.tgl_pembktan_kwn_dd.disabled = false;
			form1.tgl_pembktan_kwn_dd.focus()
			form1.tgl_pembktan_kwn_dd.value=""
			return(false)
		}
                form1.tgl_pembktan_kwn_mm.disabled = false;
		form1.tgl_pembktan_kwn_mm.focus()
		return false
	}
}

function tab13()
{
	if(form1.tgl_pembktan_kwn_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_pembktan_kwn_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_pembktan_kwn_mm.value.charAt(i)) || form1.tgl_pembktan_kwn_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_pembktan_kwn_mm.disabled = false;
				form1.tgl_pembktan_kwn_mm.focus()
				form1.tgl_pembktan_kwn_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_pembktan_kwn_mm.value > 12 || form1.tgl_pembktan_kwn_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
                        form1.tgl_pembktan_kwn_mm.disabled = false;
			form1.tgl_pembktan_kwn_mm.focus()
			form1.tgl_pembktan_kwn_mm.value=""
			return(false)
		}
                form1.tgl_pembktan_kwn_yy.disabled = false;
		form1.tgl_pembktan_kwn_yy.focus()
		return false
	}
}
function tab14()
{
	d = new Date(form1.tgl_pembktan_kwn_mm.value+"/"+form1.tgl_pembktan_kwn_dd.value+"/"+form1.tgl_pembktan_kwn_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_pembktan_kwn_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_pembktan_kwn_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_pembktan_kwn_yy.value.charAt(i)) || form1.tgl_pembktan_kwn_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_pembktan_kwn_yy.disabled = false;
				form1.tgl_pembktan_kwn_yy.focus()
				form1.tgl_pembktan_kwn_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_pembktan_kwn_yy.value < 1900 || form1.tgl_pembktan_kwn_yy.value > d3 || form1.tgl_lhr_ibu_istri_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
                        form1.tgl_pembktan_kwn_yy.disabled = false;
			form1.tgl_pembktan_kwn_yy.focus()
			form1.tgl_pembktan_kwn_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
                        form1.tgl_pembktan_kwn_yy.disabled = false;
			form1.tgl_pembktan_kwn_yy.focus()
			form1.tgl_pembktan_kwn_yy.value=""
                        form1.tgl_pembktan_kwn_mm.disabled = false;
			form1.tgl_pembktan_kwn_mm.focus()
			form1.tgl_pembktan_kwn_mm.value=""
                        form1.tgl_pembktan_kwn_dd.disabled = false;
			form1.tgl_pembktan_kwn_dd.focus()
			form1.tgl_pembktan_kwn_dd.value=""

			return(false)
		}
                form1.tgl_mlapor_dd.disabled = false;
		form1.tgl_mlapor_dd.focus()
		return false
	}

}

function tab15()
{

	if(form1.tgl_mlapor_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_mlapor_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_mlapor_dd.value.charAt(i)) || form1.tgl_mlapor_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_mlapor_dd.disabled = false;
				form1.tgl_mlapor_dd.focus()
				form1.tgl_mlapor_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_mlapor_dd.value > 31 || form1.tgl_mlapor_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
                        form1.tgl_mlapor_dd.disabled = false;
			form1.tgl_mlapor_dd.focus()
			form1.tgl_mlapor_dd.value=""
			return(false)
		}
                form1.tgl_mlapor_mm.disabled = false;
		form1.tgl_mlapor_mm.focus()
		return false
	}
}

function tab16()
{
	if(form1.tgl_mlapor_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_mlapor_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_mlapor_mm.value.charAt(i)) || form1.tgl_mlapor_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_mlapor_mm.disabled = false;
				form1.tgl_mlapor_mm.focus()
				form1.tgl_mlapor_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_mlapor_mm.value > 12 || form1.tgl_mlapor_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
                        form1.tgl_mlapor_mm.disabled = false;
			form1.tgl_mlapor_mm.focus()
			form1.tgl_mlapor_mm.value=""
			return(false)
		}
                form1.tgl_mlapor_yy.disabled = false;
		form1.tgl_mlapor_yy.focus()
		return false
	}
}
function tab17()
{
	d = new Date(form1.tgl_mlapor_mm.value+"/"+form1.tgl_mlapor_dd.value+"/"+form1.tgl_mlapor_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_mlapor_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_mlapor_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_mlapor_yy.value.charAt(i)) || form1.tgl_mlapor_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_mlapor_yy.disabled = false;
				form1.tgl_mlapor_yy.focus()
				form1.tgl_mlapor_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_mlapor_yy.value < 1900 || form1.tgl_mlapor_yy.value > d3 || form1.tgl_lhr_ibu_istri_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
                        form1.tgl_mlapor_yy.disabled = false;
			form1.tgl_mlapor_yy.focus()
			form1.tgl_mlapor_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
                         form1.tgl_mlapor_yy.disabled = false;
			form1.tgl_mlapor_yy.focus()
			form1.tgl_mlapor_yy.value=""
                         form1.tgl_mlapor_mm.disabled = false;
			form1.tgl_mlapor_mm.focus()
			form1.tgl_mlapor_mm.value=""
                         form1.tgl_mlapor_dd.disabled = false;
			form1.tgl_mlapor_dd.focus()
			form1.tgl_mlapor_dd.value=""

			return(false)
		}
                form1.pukul_lhr1.disabled = false;
		form1.pukul_lhr1.focus()
		return false
	}

}

function tab18()
{

	if(form1.tgl_dft_kwn_ln_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_dft_kwn_ln_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_dft_kwn_ln_dd.value.charAt(i)) || form1.tgl_dft_kwn_ln_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_dft_kwn_ln_dd.disabled = false;
				form1.tgl_dft_kwn_ln_dd.focus()
				form1.tgl_dft_kwn_ln_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_dft_kwn_ln_dd.value > 31 || form1.tgl_dft_kwn_ln_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
                        form1.tgl_dft_kwn_ln_dd.disabled = false;
			form1.tgl_dft_kwn_ln_dd.focus()
			form1.tgl_dft_kwn_ln_dd.value=""
			return(false)
		}
                form1.tgl_dft_kwn_ln_mm.disabled = false;
		form1.tgl_dft_kwn_ln_mm.focus()
		return false
	}
}

function tab19()
{
	if(form1.tgl_dft_kwn_ln_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_dft_kwn_ln_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_dft_kwn_ln_mm.value.charAt(i)) || form1.tgl_dft_kwn_ln_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_dft_kwn_ln_mm.disabled = false;
				form1.tgl_dft_kwn_ln_mm.focus()
				form1.tgl_dft_kwn_ln_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_dft_kwn_ln_mm.value > 12 || form1.tgl_dft_kwn_ln_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
                        form1.tgl_dft_kwn_ln_mm.disabled = false;
			form1.tgl_dft_kwn_ln_mm.focus()
			form1.tgl_dft_kwn_ln_mm.value=""
			return(false)
		}
                form1.tgl_dft_kwn_ln_yy.disabled = false;
		form1.tgl_dft_kwn_ln_yy.focus()
		return false
	}
}
function tab20()
{
	d = new Date(form1.tgl_dft_kwn_ln_mm.value+"/"+form1.tgl_dft_kwn_ln_dd.value+"/"+form1.tgl_dft_kwn_ln_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_dft_kwn_ln_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_dft_kwn_ln_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_dft_kwn_ln_yy.value.charAt(i)) || form1.tgl_dft_kwn_ln_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_dft_kwn_ln_yy.disabled = false;
				form1.tgl_dft_kwn_ln_yy.focus()
				form1.tgl_dft_kwn_ln_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_dft_kwn_ln_yy.value < 1900 || form1.tgl_dft_kwn_ln_yy.value > d3 || form1.tgl_lhr_ibu_istri_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
                        form1.tgl_dft_kwn_ln_yy.disabled = false;
			form1.tgl_dft_kwn_ln_yy.focus()
			form1.tgl_dft_kwn_ln_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
                        form1.tgl_dft_kwn_ln_yy.disabled = false;
			form1.tgl_dft_kwn_ln_yy.focus()
			form1.tgl_dft_kwn_ln_yy.value=""
                        form1.tgl_dft_kwn_ln_mm.disabled = false;
			form1.tgl_dft_kwn_ln_mm.focus()
			form1.tgl_dft_kwn_ln_mm.value=""
                        form1.tgl_dft_kwn_ln_dd.disabled = false;
			form1.tgl_dft_kwn_ln_dd.focus()
			form1.tgl_dft_kwn_ln_dd.value=""

			return(false)
		}
                form1.ijn_dut_kwn_wna.disabled = false;
		form1.ijn_dut_kwn_wna.focus()
		return false
	}

}
/*
function tab21()
{

	if(form1.tgl_akta_kwn_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_akta_kwn_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_akta_kwn_dd.value.charAt(i)) || form1.tgl_akta_kwn_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_akta_kwn_dd.disabled = false;
				form1.tgl_akta_kwn_dd.focus()
				form1.tgl_akta_kwn_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_akta_kwn_dd.value > 31 || form1.tgl_akta_kwn_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
                        form1.tgl_akta_kwn_dd.disabled = false;
			form1.tgl_akta_kwn_dd.focus()
			form1.tgl_akta_kwn_dd.value=""
			return(false)
		}
                form1.tgl_akta_kwn_mm.disabled = false;
		form1.tgl_akta_kwn_mm.focus()
		return false
	}
}

function tab22()
{
	if(form1.tgl_akta_kwn_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_akta_kwn_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_akta_kwn_mm.value.charAt(i)) || form1.tgl_akta_kwn_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_akta_kwn_mm.disabled = false;
				form1.tgl_akta_kwn_mm.focus()
				form1.tgl_akta_kwn_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_akta_kwn_mm.value > 12 || form1.tgl_akta_kwn_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
                        form1.tgl_akta_kwn_mm.disabled = false;
			form1.tgl_akta_kwn_mm.focus()
			form1.tgl_akta_kwn_mm.value=""
			return(false)
		}
                form1.tgl_akta_kwn_yy.disabled = false;
		form1.tgl_akta_kwn_yy.focus()
		return false
	}
}
function tab23()
{
	d = new Date(form1.tgl_akta_kwn_mm.value+"/"+form1.tgl_akta_kwn_dd.value+"/"+form1.tgl_akta_kwn_yy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(form1.tgl_akta_kwn_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_akta_kwn_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_akta_kwn_yy.value.charAt(i)) || form1.tgl_akta_kwn_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
                                form1.tgl_akta_kwn_yy.disabled = false;
				form1.tgl_akta_kwn_yy.focus()
				form1.tgl_akta_kwn_yy.value=""
				return(false)
			}
		}
		  if(form1.tgl_akta_kwn_yy.value < 1900 || form1.tgl_akta_kwn_yy.value > d3 || form1.tgl_akta_kwn_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
                        form1.tgl_akta_kwn_yy.disabled = false;
			form1.tgl_akta_kwn_yy.focus()
			form1.tgl_akta_kwn_yy.value=""
			return(false)
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_akta_kwn_yy.focus()
			form1.tgl_akta_kwn_yy.value=""
			form1.tgl_akta_kwn_mm.focus()
			form1.tgl_akta_kwn_mm.value=""
			form1.tgl_akta_kwn_dd.focus()
			form1.tgl_akta_kwn_dd.value=""

			return(false)
		}
                form1.nama_kep_des.disabled = false;
		form1.nama_kep_des.focus()
		return false
	}

}
*/

function setSaveEnabled(flag) {
  form1.sim.disabled = !flag;
  form1.kon.disabled = flag;
}


function setFieldAyahSuamiEnabled(flag, wn) {
   form1.nik_ayah_suami.disabled = flag;
   form1.nama_ayah_suami.disabled = !flag;
   form1.tgl_lhr_ayah_suami_dd.disabled = !flag;
   form1.tgl_lhr_ayah_suami_mm.disabled = !flag;
   form1.tgl_lhr_ayah_suami_yy.disabled = !flag;
   form1.jenis_pkrjn_ayah_suami.disabled = !flag;
   form1.alamat_ayah_suami.disabled = !flag;
   form1.rt_ayah_suami.disabled = !flag;
   form1.rw_ayah_suami.disabled = !flag;
   form1.dusun_ayah_suami.disabled = !flag;
   form1.kodepos_ayah_suami.disabled = !flag;
   form1.telp_ayah_suami.disabled = !flag;
   form1.nama_prop_ayah_suami.disabled = !flag;
   form1.nama_kab_ayah_suami.disabled = !flag;
   form1.nama_kec_ayah_suami.disabled = !flag;
   form1.nama_kel_ayah_suami.disabled = !flag;
}

function resetFieldAyahSuami(){
   //NIK Ibu
   form1.radiobutton[0].disabled = false;
   form1.radiobutton[1].disabled = false;
   //WN IBU
   form1.radiobutton1[0].disabled = false;
   form1.radiobutton1[1].disabled = false;

   if ((form1.radiobutton[0].checked || form1.radiobutton[1].checked) && (form1.radiobutton1[0].checked || form1.radiobutton1[1].checked)) {
      setFieldAyahSuamiEnabled(form1.radiobutton[1].checked, (form1.radiobutton1[0].checked?1:2))
   }
   setSaveEnabled(false);
}
function setFieldAyahIstriEnabled(flag, wn) {
   form1.nik_ayah_istri.disabled = flag;
   form1.nama_ayah_istri.disabled = !flag;
   form1.tgl_lhr_ayah_istri_dd.disabled = !flag;
   form1.tgl_lhr_ayah_istri_mm.disabled = !flag;
   form1.tgl_lhr_ayah_istri_yy.disabled = !flag;
   form1.jenis_pkrjn_ayah_istri.disabled = !flag;
   form1.alamat_ayah_istri.disabled = !flag;
   form1.rt_ayah_istri.disabled = !flag;
   form1.rw_ayah_istri.disabled = !flag;
   form1.dusun_ayah_istri.disabled = !flag;
   form1.kodepos_ayah_istri.disabled = !flag;
   form1.telp_ayah_istri.disabled = !flag;
   form1.nama_prop_ayah_istri.disabled = !flag;
   form1.nama_kab_ayah_istri.disabled = !flag;
   form1.nama_kec_ayah_istri.disabled = !flag;
   form1.nama_kel_ayah_istri.disabled = !flag;
}

function resetFieldAyahIstri(){
   //NIK Ibu
   form1.radiobutton4[0].disabled = false;
   form1.radiobutton4[1].disabled = false;
   //WN IBU
   form1.radiobutton5[0].disabled = false;
   form1.radiobutton5[1].disabled = false;

   if ((form1.radiobutton4[0].checked || form1.radiobutton4[1].checked) && (form1.radiobutton5[0].checked || form1.radiobutton5[1].checked)) {
      setFieldAyahIstriEnabled(form1.radiobutton4[1].checked, (form1.radiobutton5[0].checked?1:2))
   }
   setSaveEnabled(false);
}

function setFieldIbuSuamiEnabled(flag, wn) {
   form1.nik_ibu_suami.disabled = flag;
   form1.nama_ibu_suami.disabled = !flag;
   form1.tgl_lhr_ibu_suami_dd.disabled = !flag;
   form1.tgl_lhr_ibu_suami_mm.disabled = !flag;
   form1.tgl_lhr_ibu_suami_yy.disabled = !flag;
   form1.jenis_pkrjn_ibu_suami.disabled = !flag;
   form1.alamat_ibu_suami.disabled = !flag;
   form1.rt_ibu_suami.disabled = !flag;
   form1.rw_ibu_suami.disabled = !flag;
   form1.dusun_ibu_suami.disabled = !flag;
   form1.kodepos_ibu_suami.disabled = !flag;
   form1.telp_ibu_suami.disabled = !flag;
   form1.nama_prop_ibu_suami.disabled = !flag;
   form1.nama_kab_ibu_suami.disabled = !flag;
   form1.nama_kec_ibu_suami.disabled = !flag;
   form1.nama_kel_ibu_suami.disabled = !flag;
}
function resetFieldIbuSuami() {
   //NIK IbuSuami
   form1.radiobutton2[0].disabled = false;
   form1.radiobutton2[1].disabled = false;
   //WN IBU
   form1.radiobutton3[0].disabled = false;
   form1.radiobutton3[1].disabled = false;

   if ((form1.radiobutton2[0].checked || form1.radiobutton2[1].checked) && (form1.radiobutton3[0].checked || form1.radiobutton3[1].checked)) {
      setFieldIbuSuamiEnabled(form1.radiobutton2[1].checked, (form1.radiobutton3[0].checked?1:2))
   }
   setSaveEnabled(false);
}

function setFieldIbuIstriEnabled(flag, wn) {
   form1.nik_ibu_istri.disabled = flag;
   form1.nama_ibu_istri.disabled = !flag;
   form1.tgl_lhr_ibu_istri_dd.disabled = !flag;
   form1.tgl_lhr_ibu_istri_mm.disabled = !flag;
   form1.tgl_lhr_ibu_istri_yy.disabled = !flag;
   form1.jenis_pkrjn_ibu_istri.disabled = !flag;
   form1.alamat_ibu_istri.disabled = !flag;
   form1.rt_ibu_istri.disabled = !flag;
   form1.rw_ibu_istri.disabled = !flag;
   form1.dusun_ibu_istri.disabled = !flag;
   form1.kodepos_ibu_istri.disabled = !flag;
   form1.telp_ibu_istri.disabled = !flag;
   form1.nama_prop_ibu_istri.disabled = !flag;
   form1.nama_kab_ibu_istri.disabled = !flag;
   form1.nama_kec_ibu_istri.disabled = !flag;
   form1.nama_kel_ibu_istri.disabled = !flag;
}
function resetFieldIbuIstri() {
   //NIK IbuIstri
   form1.radiobutton6[0].disabled = false;
   form1.radiobutton6[1].disabled = false;
   //WN IBU
   form1.radiobutton7[0].disabled = false;
   form1.radiobutton7[1].disabled = false;

   if ((form1.radiobutton6[0].checked || form1.radiobutton6[1].checked) && (form1.radiobutton7[0].checked || form1.radiobutton7[1].checked)) {
      setFieldIbuIstriEnabled(form1.radiobutton6[1].checked, (form1.radiobutton7[0].checked?1:2))
   }
   setSaveEnabled(false);
}

function addAnak(listAnak, nama_anak, no_akta_anak, tgl_akta_anak_dd, tgl_akta_anak_mm, tgl_akta_anak_yy) {
   if (trim(nama_anak.value)=="" || trim(no_akta_anak.value)=="" || trim(tgl_akta_anak_dd.value)=="" || trim(tgl_akta_anak_mm.value)=="" || trim(tgl_akta_anak_yy.value)=="" || validasiTanggal(tgl_akta_anak_dd, tgl_akta_anak_mm, tgl_akta_anak_yy, true, 8))
      alert("Data Anak tidak lengkap");
    else
          {
   var itm = document.createElement("OPTION");
   itm.value=listAnak.length+1;
   tgl_akta = tgl_akta_anak_dd.value + "-" + tgl_akta_anak_mm.value + "-" + tgl_akta_anak_yy.value;
   itm.text= listAnak.length+1 + ". " + nama_anak.value +
             " No Akta Lahir : " + no_akta_anak.value +
             " Tgl Akta Lahir : " + tgl_akta;
   listAnak.add(itm);
   form1.daftarAnak.value = form1.daftarAnak.value+"^"+nama_anak.value+"|"+no_akta_anak.value+"|"+tgl_akta;
   if (form1.daftarAnak.value.lastIndexOf("^")==0) {
      form1.daftarAnak.value = form1.daftarAnak.value.substring(1);
   }
   nama_anak.value = "";
   no_akta_anak.value = "";
   tgl_akta_anak_dd.value = "";
   tgl_akta_anak_mm.value = "";
   tgl_akta_anak_yy.value = "";
   tp1.setSelectedIndex(8);
   nama_anak.focus();
          }
}

function refreshAllAnak(listAnak)
{
 var idx=listAnak.selectedIndex;
 var strdata=form1.daftarAnak.value;
 var str=new String(strdata);
 var splitString=str.split("^");
 strdata="";

 for(i=0;i<listAnak.length;i++)
   {
           if (idx!=i)
           {
             strdata=strdata+splitString[i]+"^";
           }
   }
strdata=strdata.substr(0,strdata.length-1)
form1.daftarAnak.value=strdata;
 listAnak.options.remove(idx);
}

function removeAnak(listAnak) {
    if (listAnak.length>0)
         {
              refreshAllAnak(listAnak);
         }
}