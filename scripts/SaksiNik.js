function simpan()
{
if (konfirmasi()==false)
  return false;
if (kelahiran()==false)
  return false;
	if(form1.nik_sksi1.value == "")
	{
		alert("NIK Saksi-I belum diisi !")
		  tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return false
	}
       if(form1.nik_sksi1.value.length != 16 && form1.nik_sksi1.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		  tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return false
	}
	if(form1.nik_sksi1.value.substring(0,1) == 'A' && form1.nik_sksi1.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		  tp1.setSelectedIndex(4)
		form1.nik_sksi1.focus()
		return false
	}
        if (form1.jenis_pekerjaan_saksi1.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(4)
		form1.jenis_pekerjaan_saksi1.focus()
		return false
	   }
	if(form1.nik_sksi2.value == "")
	{
		alert("NIK Saksi-II belum diisi !")
		  tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return false
	}
       if(form1.nik_sksi2.value.length != 16 && form1.nik_sksi2.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		  tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return false
	}
	if(form1.nik_sksi2.value.substring(0,1) == 'A' && form1.nik_sksi2.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		  tp1.setSelectedIndex(5)
		form1.nik_sksi2.focus()
		return false
	}
        if (form1.jenis_pekerjaan_saksi2.options[0].selected == true)
	   {
		alert("Jenis Pekerjaan belum diisi!")
		tp1.setSelectedIndex(5)
		form1.jenis_pekerjaan_saksi2.focus()
		return false
	   }
if(form1.jenis_dft_lhr.options[0].selected==true)
{
alert("Belum pilih Jenis Daftar Kelahiran!");
tp1.setSelectedIndex(6)
form1.jenis_dft_lhr.disabled =false;
form1.jenis_dft_lhr.focus();
return false;
}
if(form1.dsrhk_cttlhr.options[0].selected==true)
{
alert("Belum pilih Dasar Hukum Pencatatan Kelahiran!");
tp1.setSelectedIndex(6)
form1.dsrhk_cttlhr.disabled =false;
form1.dsrhk_cttlhr.focus();
return false;
}
var v=form1.doc_per.length;
var chk = false;

     for(i=0;i<v;i++)
     {
        if(form1.doc_per.options[i].selected)
        {
           chk=true;
        }
     }
if(chk==false)
{
alert("Belum pilih Dokumen Persyaratan Kelahiran!");
tp1.setSelectedIndex(6)
return false;
}
/*
if(form1.nama_kep_des.value=="")
{
alert("Belum isi Nama Kepala Desa/Lurah!");
tp1.setSelectedIndex(6)
form1.nama_kep_des.disabled =false;
form1.nama_kep_des.focus();
return false;
}

if(form1.nip_lrh.value=="" || isNaN(form1.nip_lrh.value) || form1.nip_lrh.value.length!=9)
{
form1.nip_lrh.value==""
tp1.setSelectedIndex(6)
form1.nip_lrh.disabled =false;
form1.nip_lrh.focus();
alert("Belum isi NIP Kepala Desa/Lurah!");
return false;
}
*/
if(form1.nama_pet_reg.value=="")
{
tp1.setSelectedIndex(6)
form1.nama_pet_reg.disabled =false;
form1.nama_pet_reg.focus();
alert("Belum isi Nama Petugas Pencatat/Registrar!");
return false;
}
if(form1.nip_pet_reg.value=="" || isNaN(form1.nip_pet_reg.value) || form1.nip_pet_reg.value.length!=9)
{
tp1.setSelectedIndex(6)
form1.nip_pet_reg.value==""
form1.nip_pet_reg.disabled =false;
form1.nip_pet_reg.focus();
alert("Belum isi NIP Petugas Pencatat/Registrar!");
return false;
}


        if (form1.nik_bayi.value == form1.nik_sksi1.value) {
           alert("Pengisian NIK Bayi dan Saksi I tidak boleh sama!")
           tp1.setSelectedIndex(4)
	   form1.nik_sksi1.focus()
	   return(false)
        }

        if (form1.nik_bayi.value == form1.nik_sksi2.value) {
           alert("Pengisian NIK Bayi dan Saksi II tidak boleh sama!")
           tp1.setSelectedIndex(5)
	   form1.nik_sksi2.focus()
	   return(false)
        }

        if (form1.nik_sksi1.value == form1.nik_sksi2.value) {
           alert("Pengisian Saksi I dan Saksi II tidak boleh sama!")
           tp1.setSelectedIndex(5)
	   form1.nik_sksi2.focus()
	   return(false)
        }
        form1.kon.disabled = true;
        //form1.sim.disabled = true;
        form1.kel.disabled = true;
        document.form1.action="SaksiInput.jsp";
        document.form1.submit();
}

function saksi(step, kecFlag)
{

if (validateNIK(form1.nik_bayi, "Bayi", tp1, 0)==false) {
  return false;
}
if (step>0 && kecFlag==true) {
  if (form1.radiobutton[0].checked==true) {//NIK IBU ADA
    if(validateNIK(form1.nik_ibu, "Ibu", tp1, 1)==false)
       return false;
  } else if (form1.radiobutton[1].selected) {
//NIK IBU TIDAK ADA
}
if (!form1.radiobutton1[0].checked && !form1.radiobutton1[1].checked) {
  alert("Belum Pilih Kewarganegaraan Ibu");
  return false;
}

if (form1.radiobutton3[0].checked==true) {//NIK IBU ADA
  if (validateNIK(form1.nik_ayh, "Ayah", tp1, 2)==false)
  return false;
} else if (form1.radiobutton3[1].selected) {
//NIK IBU TIDAK ADA
}

/*if (!form1.radiobutton4[0].checked && !form1.radiobutton4[1].checked) {
  alert("Belum Pilih Kewarganegaraan Ayah");
  return false;
}
*/

if (form1.nik_plpor.value!="") {
  if(validateNIK(form1.nik_plpor, "Pelapor", tp1, 3)==false)
  return false;
}
}
  if (validateNIK(form1.nik_sksi1, "Saksi I", tp1, 4)==false)
  return false;
  if (validateNIK(form1.nik_sksi2, "Saksi II", tp1, 5)==false)
  return false;

        document.form1.action="Pencatatan_Kabupaten_Edit.jsp";
        document.form1.submit();
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
   form1.tmpt_dilhr.disabled = kecFlag;
   form1.pukul_lhr1.disabled = kecFlag;
   form1.pukul_lhr2.disabled = kecFlag;
   form1.wkt_pkl_lhr.disabled = kecFlag;
   form1.jenis_klahir.disabled = kecFlag;
   form1.anak_ke_lhr.disabled = kecFlag;
   form1.pnlng_klahir.disabled = kecFlag;
   form1.brt_bayi.disabled = kecFlag;
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
     form1.jenis_pkrjn_ibu.disabled = false;
     form1.jenis_pkrjn_ibu.disabled = false;
     disabledFieldAyah(!kecFlag);
     form1.jenis_pkrjn_ayh.disabled = false;
     setFieldPelaporEnabled(kecFlag, 0);
     form1.jenis_pkrjn_plpor.disabled = false;
}
