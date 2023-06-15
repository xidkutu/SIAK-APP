function konfirmasi(step, kecFlag) {

  if (validateNIK(form1.nik_jnsah, "Jenasah", tp1, 0)==false) {
     return false;
  }
if (step>0 && kecFlag==true) {
if (form1.radiobutton[0].selected==true) {//NIK IBU ADA
  if (validateNIK(form1.nik_ibu, "Ibu", tp1, 1)==false) {
     return false;
  }
} else if (form1.radiobutton[1].selected) {
//NIK IBU TIDAK ADA
}
if (!form1.radiobutton1[0].checked && !form1.radiobutton1[1].checked) {
  alert("Belum Pilih Kewarganegaraan Ibu");
  return false;
}

if (form1.radiobutton3[0].selected==true) {//NIK IBU ADA
  if (validateNIK(form1.nik_ayh, "Ayah", tp1, 2)==false) {
     return false;
  }
} else if (form1.radiobutton3[1].selected) {
//NIK IBU TIDAK ADA
}
if (!form1.radiobutton4[0].checked && !form1.radiobutton4[1].checked) {
  alert("Belum Pilih Kewarganegaraan Ayah");
  return false;
}
if (form1.nik_plpor.value!="") {
  if (validateNIK(form1.nik_plpor, "Pelapor", tp1, 3)==false) {
     return false;
  }
}
}

  if (validateNIK(form1.nik_sksi1, "Saksi I", tp1, 4)==false) {
     return false;
  }
  if (validateNIK(form1.nik_sksi2, "Saksi II", tp1, 5)==false) {
     return false;
  }
        form1.kon.disabled = true;
        //form1.sim.disabled = true;
        form1.kel.disabled = true;
        form1.action = "Pencatatan_Kematian_Edit.jsp";
        form1.submit();
}
function saksimati()
{
if (confirmasi(false)==false) {
  return false;
}
if (kematian(false)==false) {
  return false;
}
form1.jenis_dft_mt.disabled=false;
form1.dsrhk_cttmt.disabled=false;
form1.doc_per.disabled=false;

if(form1.jenis_dft_mt.options[0].selected==true)
{
tp1.setSelectedIndex(6)
form1.jenis_dft_mt.focus()
alert("Belum pilih Jenis Daftar Kematian!");
return false;
}
if(form1.dsrhk_cttmt.options[0].selected==true)
{
tp1.setSelectedIndex(6)
form1.dsrhk_cttmt.focus()
alert("Belum pilih Dasar Hukum Pencatatan Kematian!");
return false;
}
        if(form1.doc_per.options.selectedIndex==-1)
        {
          tp1.setSelectedIndex(6)
          alert("Belum pilih Dokumen Persyaratan Kematian!");
          return false;
        }
/*
if(form1.nama_kep_des.value=="")
{
tp1.setSelectedIndex(6)
form1.nama_kep_des.focus()
alert("Nama Kepala Desa/Lurah belum diisi!");
return false;
}
if(form1.nip_lrh.value=="" || isNaN(form1.nip_lrh.value))
{
tp1.setSelectedIndex(6)
form1.nip_lrh.focus()
form1.nip_lrh.value==""
alert("Belum isi NIP Kepala Desa/Lurah!");
return false;
}
*/
if(form1.nama_pet_reg.value=="")
{
tp1.setSelectedIndex(6)
form1.nama_pet_reg.focus()
alert("Belum isi Nama Petugas Pencatat/Registrar!");
return false;
}
if(form1.nip_pet_reg.value=="" || isNaN(form1.nip_pet_reg.value))
{
tp1.setSelectedIndex(6)
form1.nip_pet_reg.focus()
form1.nip_pet_reg.value==""
alert("Belum isi NIP Petugas Pencatat/Registrar!");
return false;
}
        form1.kon.disabled = true;
        //form1.sim.disabled = true;
        form1.kel.disabled = true;
        form1.action = "MatiSaksi.jsp";
        form1.submit();

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

function setFieldPelaporEnabled(flag, wn) {
   form1.nik_plpor.disabled = !flag;
   form1.jenis_pkrjn_plpor.disabled = !flag;
   form1.no_akta_lhr_dd2.disabled = !flag;
   form1.no_akta_lhr_mm2.disabled = !flag;
   form1.no_akta_lhr_yy2.disabled = !flag;
}


function disabledFieldBayi(kecFlag) {
   form1.ktrunan_jnsah.disabled = kecFlag;
   form1.anak_ke_mt.disabled = kecFlag;
   form1.tgl_mati_dd.disabled = kecFlag;
   form1.tgl_mati_mm.disabled = kecFlag;
   form1.tgl_mati_yy.disabled = kecFlag;
   form1.pukul_mt1.disabled = kecFlag;
   form1.pukul_mt2.disabled = kecFlag;
   form1.wkt_pkl_mt.disabled = kecFlag;
   form1.sbab_mati.disabled = kecFlag;
   form1.tmpt_mati.disabled = kecFlag;
   form1.yg_mnerang.disabled = kecFlag;
   form1.pnetap_pn.disabled = kecFlag;
   form1.no_pnetap.disabled = kecFlag;
   form1.tgl_pnetap.disabled = kecFlag;
   form1.bln_pnetap.disabled = kecFlag;
   form1.thn_pnetap.disabled = kecFlag;
}

function disabledFieldIbu(kecFlag) {
   setFieldIbuEnabled(!kecFlag, 0)
   form1.nik_ibu.disabled = kecFlag;
   form1.radiobutton[0].disabled = kecFlag;
   form1.radiobutton[1].disabled = kecFlag;
   form1.radiobutton1[0].disabled = kecFlag;
   form1.radiobutton1[1].disabled = kecFlag
}
function disabledFieldAyah(kecFlag) {
   setFieldAyahEnabled(!kecFlag, 0)
   form1.nik_ayh.disabled = kecFlag;
   form1.radiobutton3[0].disabled = kecFlag;
   form1.radiobutton3[1].disabled = kecFlag;
   form1.radiobutton4[0].disabled = kecFlag;
   form1.radiobutton4[1].disabled = kecFlag;
}

function setupKecamatanInput(kecFlag) {
     disabledFieldBayi(!kecFlag);
     disabledFieldIbu(!kecFlag);
     disabledFieldAyah(!kecFlag);
     setFieldPelaporEnabled(kecFlag, 0);
}