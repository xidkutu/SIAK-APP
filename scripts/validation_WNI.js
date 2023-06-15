//Validations for WNI
function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function checkStatHb(stat_kwn)
{
if ((document.all['stat_hbkel'].value==2) ||
(document.all['stat_hbkel'].value==3))
  {
    if (stat_kwn!=2)
     {
alert("Status Hubungan dlm Keluarga salah!!");
document.all['stat_hbkel'].focus();
return (false);
     }
  }

if ((document.all['jenis_klmin'].value==1) && (document.all['stat_hbkel'].value==3))
{
alert("Status Hubungan dlm Keluarga salah!!");
document.all['stat_hbkel'].focus();
return false;
}

if ((document.all['jenis_klmin'].value==2) && (document.all['stat_hbkel'].value==2))
{
alert("Status Hubungan dlm Keluarga salah!!");
document.all['stat_hbkel'].focus();
return false;
}
}
function KKValidate(itm)
{
var kksemula=itm.value;

if (trim(kksemula)=="")
{
	alert("Kode Nomor Kartu Keluarga belum diisi !");
	itm.focus();
	itm.select();
	return false;
}
if (trim(kksemula) == "0")
{
	alert("Kode Nomor Kartu Keluarga belum diisi !");
	itm.value="";
	itm.focus();
	return false;
}

if (parseInt(trim(kksemula).length,10) != 16)
{
	alert("Kode Nomor Kartu Keluarga harus 16 digit !");
	itm.focus();
	return false;
}

if(isNaN(kksemula))
	{
		alert("Kode Nomor Kartu Keluarga Salah !!" )
		itm.value="";
	        itm.focus();
	        return false;
	}
if (trim(kksemula.substring(0,1))=="-")
   {
    		alert("Kode Nomor Kartu Keluarga Salah !!" )
		itm.value="";
	        itm.focus();
	        return false;
   }


if (document.all['nama_kel'].selectedIndex==0)
{
    alert("Nama Kelurahan belum disini !");
    document.all['nama_kel'].focus();
    return false;
}
}
var temp,temp1,temp2
function validates1()
{
	if(form1.nama_kel.options[0].selected == true)
	{
		alert("Kode-Nama Desa/Kelurahan belum diisi !.")
		form1.nama_kel.focus()
		return false
   	}
   	if(form1.no_kk.value == "")
	{
		alert("Nomor Kartu Keluarga belum diisi !")
		form1.no_kk.focus()
		form1.no_kk.value=""
		return(false)
	}
	if(form1.no_kk.value.length != 16)
	{
		alert("Pengisian Nomor KK 16 digit !")
		form1.no_kk.focus()
		form1.no_kk.value=""
		return(false)
	}

	if(form1.nik.value == "")
	{
		alert("Pengisian Nomor Induk Kependudukan belum diisi !")
		form1.nik.focus()
		form1.nik.value=""
		return(false)
	}
	if(form1.nik.value.length != 16)
	{
		alert("Pengisian Nomor Induk Kependudukan 16 digit !")
		form1.nik.focus()
		form1.nik.value=""
		return(false)
	}
}
function validates11()
{
	if(form1.nama_kel.options[0].selected == true)
	{
		alert("Kode-Nama Desa/Kelurahan belum diisi !.")
		form1.nama_kel.focus()
		return false
   	}

	if(form1.nik.value == "")
	{
		alert("Pengisian Nomor Induk Kependudukan belum diisi !")
		form1.nik.focus()
		form1.nik.value=""
		return(false)
	}
	if(form1.nik.value.length != 16)
	{
		alert("Pengisian Nomor Induk Kependudukan 16 digit !")
		form1.nik.focus()
		form1.nik.value=""
		return(false)
	}
}

function LeapYear(year) {
    if ((year/4)   != Math.floor(year/4))   return false;
    if ((year/100) != Math.floor(year/100)) return true;
    if ((year/400) != Math.floor(year/400)) return false;
    return true;
}



function parseMonth(tgl_obj,bln_obj,thn_obj)
{
var bln="";
var tgl="";
var yr="";
yr=thn_obj.value;

 if ( ((tgl_obj!=null) && (parseInt(tgl_obj.value,10)!=0) && (trim(tgl_obj.value)!=""))
       &&
 ((bln_obj!=null) && (parseInt(bln_obj.value,10)!=0) && (trim(bln_obj.value)!=""))
        &&
((thn_obj!=null) && (parseInt(thn_obj.value,10)!=0) && (trim(thn_obj.value)!="") && yr.length==4))
    {
               tgl=parseInt(tgl_obj.value,10);
               bln=parseInt(bln_obj.value,10);
               yr=parseInt(thn_obj.value,10);

       switch(bln)
        {
                case  1:
                      if (tgl>31)
                         {
                            return false;
                         }
                break;
                case  2:
                      if  (LeapYear(thn_obj.value))
                         {
                           if (tgl>29)
                              {
                            return false;
                              }
                         }
                     else
                        {
                           if (tgl>28)
                              {
                            return false;
                              }
                        }
                break;
                case  3:
                      if (tgl>31)
                         {
                             return false;
                         }
                break;
                case  4:
                      if (tgl>30)
                         {
                             return false;
                        }
                break;
                case  5:
                      if (tgl>31)
                         {
                            return false;
                         }
                break;
                case  6:
                      if (tgl>30)
                         {
                               return false;
                         }
                break;
                case  7:
                      if (tgl>31)
                         {
                               return false;
                         }
                break;
                case  8:
                      if (tgl>31)
                         {
                                return false;
                         }
                break;
                case  9:
                      if (tgl>30)
                         {
                                return false;
                         }
                break;
                case  10:
                      if (tgl>31)
                         {
                             return false;
                         }
                break;
                case  11:
                      if (tgl>30)
                         {
                                 return false;
                         }
                break;
                case  12:
                      if (tgl>31)
                         {
                                 return false;
                         }
                break;

        }
    }
return true;
}

function validate()
{
	var i = parseInt(form1.no_akta_lh_mon.value,10)
	var j = parseInt(form1.no_akta_lhr_mm.value,10)
	var k = parseInt(form1.tgl_kwn_mm.value,10)
	var m = parseInt(form1.tgl_crai_mm.value,10)

	tmp = form1.nama_lgkp.value
	tmp1 = form1.tmpt_lhr.value
	tmp2 = form1.nama_lgkp_ibu.value

	var obj = /^(\s*)([\W\w]*)(\b\s*$)/

	if (obj.test(tmp) || obj.test(tmp1) || obj.test(tmp2))
	{
		tmp = tmp.replace(obj, '$2');
		tmp1 = tmp1.replace(obj, '$2');
		tmp2 = tmp2.replace(obj, '$2');
	}

	var obj = / +/g;

	tmp = tmp.replace(obj, " ");
	form1.nama_lgkp.value=tmp
	tmp1 = tmp1.replace(obj, " ");
	form1.tmpt_lhr.value=tmp1
	tmp2 = tmp2.replace(obj, " ");
	form1.nama_lgkp_ibu.value=tmp2

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

	if(form1.jenis_klmin.options[0].selected == true)
	{
		alert("Jenis Kelamin belum diisi !")
		form1.jenis_klmin.focus()
		return false
	}


        if(form1.tmpt_lhr.value == "")
	{
		alert("Tempat Lahir belum diisi !.")
		form1.tmpt_lhr.focus()
		form1.tmpt_lhr.value=""
		return(false)
	}
        if(form1.no_akta_lhr_dd.value == "")
	{
		alert("Tanggal Lahir belum diisi !.")
		form1.no_akta_lhr_dd.focus()
		form1.no_akta_lhr_dd.value=""
		return(false)
	}
	if( form1.no_akta_lhr_dd.value.length != 2)
	{
		alert("Pengisian tanggal harus dengan format dd !.")
		form1.no_akta_lhr_dd.focus()
		form1.no_akta_lhr_dd.value=""
		return(false)
	}
	if(form1.no_akta_lhr_mm.value == "")
	{
		alert("Tanggal Lahir belum diisi !.")
		form1.no_akta_lhr_mm.focus()
		form1.no_akta_lhr_mm.value=""
		return(false)
	}
	if( form1.no_akta_lhr_mm.value.length != 2)
	{
		alert("Pengisian bulan harus dengan format mm !.")
		form1.no_akta_lhr_mm.focus()
		form1.no_akta_lhr_mm.value=""
		return(false)
	}
	if(form1.no_akta_lhr_yy.value == "" )
	{
		alert("Tanggal Lahir belum diisi !.")
		form1.no_akta_lhr_yy.focus()
		form1.no_akta_lhr_yy.value=""
		return(false)
	}
	if(form1.no_akta_lhr_yy.value.length != 4)
	{
		alert("Pengisian tahun harus dengan format yyyy !.")
		form1.no_akta_lhr_yy.focus()
		form1.no_akta_lhr_yy.value=""
		return(false)
	}
	if(form1.akta_lhr.options[0].selected == true)
	{
		alert("Akta Kelahiran/Surat Kenal Lahir belum diisi !.")
		form1.akta_lhr.focus()
		return (false)
	}
	if(form1.akta_lhr.options[2].selected == true && trim(form1.no_akta_lhr.value) == "")
	{
		alert("Nomor Akta Kelahiran/Surat Kenal Lahir belum diisi !.")
		form1.no_akta_lhr.focus()
		return (false)
	}

	var nowDate = new Date(form1.no_akta_lhr_yy.value,form1.no_akta_lhr_mm.value,form1.no_akta_lhr_dd.value)

	todayDate = new Date()

	var one_year=1000*60*60*24*365

	var years = Math.ceil(todayDate-nowDate)/(one_year)


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
	if(form1.aga_ma.options[7].selected == true && trim(form1.agama.value) == "")
	{
		alert("Agama belum diisi")
		form1.agama.focus()
		return (false)
	}

	 if(form1.stat_kwn.options[0].selected == true)
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
/*
    if ((form1.jenis_pkrjn.options[11].selected == true && years < 5) && (form1.stat_kwn.options[2].selected == true || form1.stat_kwn.options[3].selected == true || form1.stat_kwn.options[4].selected == true))
	{
		alert("Jenis Pekerjaan tidak sesuai dengan usia !.")
		form1.jenis_pkrjn.focus()
		return false
	}

    if ((form1.jenis_pkrjn.options[34].selected == true && years < 15) || (form1.jenis_pkrjn.options[50].selected == true && years < 45) || (form1.jenis_pkrjn.options[57].selected == true && years < 15) || (form1.jenis_pkrjn.options[58].selected == true && years < 15) || (form1.jenis_pkrjn.options[35].selected == true && years < 15) || (form1.jenis_pkrjn.options[24].selected == true && years < 15) || (form1.jenis_pkrjn.options[31].selected == true && years < 15) || (form1.jenis_pkrjn.options[56].selected == true && years < 15) || (form1.jenis_pkrjn.options[68].selected == true && years < 17) || (form1.jenis_pkrjn.options[40].selected == true && years < 17) || (form1.jenis_pkrjn.options[67].selected == true && years < 17) || (form1.jenis_pkrjn.options[30].selected == true && years < 17))
	{
		alert ("Jenis Pekerjaan tidak sesuai dengan usia !.")
		form1.jenis_pkrjn.focus()
		return false
	}
*/

    if (form1.nik_ibu.value != "" && form1.nik_ibu.value.length < 16)
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

    if(trim(form1.nama_lgkp_ibu.value) == "")
	{
		alert("Nama Lengkap Ibu belum diisi !")
		form1.nama_lgkp_ibu.focus()
		form1.nama_lgkp_ibu.value=""
		return (false)
	}
    if(trim(form1.nama_pet_reg.value) == "")
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

/*For Load*/
	return test(tmp,tmp1,tmp2)
//	return test()

	var temp = form1.nama_lgkp.value
	var temp1 = form1.nama_lgkp_ibu.value
	var temp2 = form1.nama_lgkp_ayh.value
	var temp3 = form1.nama_ket_rt.value
	var temp4 = form1.nama_ket_rw.value
	var temp5 = form1.nama_pet_reg.value
	var temp6 = form1.nip_pet_reg.value

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
form1.b.disabled=true;
}

function test(tmp,tmp1,tmp2)
{
	var t1=1,t2=1,t3=1,t4=1,t5=1

	//alert("In test ")

	for(i = 0; i < form1.namalgkp1.value; i=i+5)
	{

		if(form1.namalgkp[i].value.toUpperCase() == tmp.toUpperCase())
		{
			t1 = 0
			//alert("in 1st if = " + form1.namalgkp[i].value+","+form1.nama_lgkp.value+t1)
		}
		else
		{
			t1=2
			//alert("in 1st else = " + form1.namalgkp[i].value+","+form1.nama_lgkp.value+t1)
		}

		if(form1.namalgkp[i+1].value.toUpperCase() == tmp1.toUpperCase())
		{
			t2 = 0
			//alert("in 2nd if = " + form1.namalgkp[i+1].value+","+form1.tmpt_lhr.value+t2)
		}
		else
		{
			t2=2
			//alert("in 2nd else = " + form1.namalgkp[i+1].value+","+form1.tmpt_lhr.value+t2)
		}

	d = form1.no_akta_lhr_dd.value
	m1 = form1.no_akta_lhr_mm.value
	y = form1.no_akta_lhr_yy.value

	tgl_lhr = d+"-"+m1+"-"+y

		if((form1.namalgkp[i+2].value) == (tgl_lhr))
		{
			t3 = 0
			//alert("in 3rd if = " + form1.namalgkp[i+2].value+","+tgl_lhr+t3)
		}
		else
		{
			t3=2
			//alert("in 3rd else = " + form1.namalgkp[i+2].value+","+tgl_lhr+t3)
		}

	if(form1.nik_ibu.value != "")
	{
			if(form1.namalgkp[i+3].value == form1.nik_ibu.value)
			{
			       t4 = 0
			//       alert("in 4th if = " + form1.namalgkp[i+3].value+","+form1.nik_ibu.value+t4)
			}
			else
			{
				t4=2
			//	alert("in 4th else = " + form1.namalgkp[i+3].value+","+form1.nik_ibu.value+t4)
		        }
	}
	if(form1.namalgkp[i+4].value.toUpperCase() == tmp2.toUpperCase())
	{
	       t5 = 0
	       //alert("in 5th if = " + form1.namalgkp[i+4].value+","+form1.nama_lgkp_ibu.value+t5)
	}
	else
	{
		t5=2
		//alert("in 5th else = " + form1.namalgkp[i+4].value+","+tmp2+t5)
	}
	if((t1 == 0 && t2 == 0 && t3==0) && (t4==0 || t5==0))
	{
		//alert("In break = " + t1+","+t2+","+t3+","+t4+","+t5)
		break
	}
}

return test1(t1,t2,t3,t4,t5)
}


function test1(a,b,c,d,e)
{
	//alert("In test1 = " + a+","+b+","+c+","+d+","+e)
	if((a == 0 && b == 0 && c == 0) && (d== 0 || e == 0))
	{
		alert("Pada Keluarga ini nomor NIK individu ini sudah Ada !.")
		return false
	}

	else
	{
	//	form1.nama_lgkp.focus()      //Modified by Rajesh
//		form1.nama_lgkp.select()

		con = confirm("Apakah ejaan dan penulisan nama lengkap sudah benar !.")

		if(con == false)
		{
	//		form1.nama_lgkp.focus()
 	//		form1.nama_lgkp.select()
 			con = false
 			return false
		}
		else
		{
			con = true
		}

		form1.jenis_klmin.options.focus()
		con1 = confirm("Apakah pilihan jenis kelamin sudah benar !.")

		if(con1 == false)
		{
			form1.jenis_klmin.options.focus()
			con1 = false
			return false
		}
		else
		{
			con1 = true
		}

		form1.tmpt_lhr.focus()
	//	form1.tmpt_lhr.select()
		con2 = confirm("Apakah Tempat Lahir sudah benar !.")

		if(con2 == false)
		{
			form1.tmpt_lhr.focus()
	//		form1.tmpt_lhr.select()
			con2 = false
			return false
		}
		else
		{
			con2 = true
		}


		form1.no_akta_lhr_dd.focus()
	//	form1.no_akta_lhr_dd.select()
		con3 = confirm("Apakah Tanggal Lahir sudah benar !.")

		if(con3 == false)
		{
			form1.no_akta_lhr_dd.focus()
	//		form1.no_akta_lhr_dd.select()
			con3 = false
			return false
		}
		else
		{
			con3 = true
		}

		form1.aga_ma.options.focus()
		con4 = confirm("Apakah pilihan Agama sudah benar !.")

		if(con4 == false)
		{
			form1.aga_ma.options.focus()
			con4 = false
			return false
		}
		else
		{
			con4 = true
		}

		form1.nama_lgkp_ibu.focus()
	//	form1.nama_lgkp_ibu.select()
		con5 = confirm("Apakah ejaan dan penulisan nama lengkap ibu sudah benar  !")

		if(con5 == false)
		{
			form1.nama_lgkp_ibu.focus()
	//		form1.nama_lgkp_ibu.select()
			con5 = false
			return false
		}
		else
		{
			con5 = true
		}

		form1.nama_ket_rt.focus()
	//	form1.nama_ket_rt.select()

		con6 = confirm("Apakah nama ketua RT sudah benar !.")

		if(con6 == false)
		{
			form1.nama_ket_rt.focus()
	//		form1.nama_ket_rt.select()
			con6 = false
			return false
		}
		else
		{
			con6 = true
		}


		if(con == true && con1 == true && con2 == true && con3 == true && con4 == true && con5 == true && con6 == true)
		{
                        form1.b.style.visibility='hidden';
			return true

	/*		form1.b.disabled=true
			form1.bat.disabled=true

			form1.b.submit()*/
		}
		else
		{
			return false
		}
	}
}

function validate1()
{
	if(form1.akta_lhr.options[1].selected == true)
	{
               form1.no_akta_lhr.value="";
		form1.no_akta_lhr.disabled = true
                form1.gol_drh.focus();
		return false
	}

	else if(form1.akta_lhr.options[2].selected == true)
	{
		form1.no_akta_lhr.disabled = false
                form1.no_akta_lhr.focus();
		return(false)
	}
}

function validate2()
{
	if(form1.aga_ma.options[7].selected == true)
	{
		form1.agama.disabled = false
		form1.agama.focus()
		return(false)
	}
}

function validate3()
{
  if(form1.stat_kwn.options[1].selected == true)
	{
                form1.akta_kwn.selectedIndex=1;
                form1.akta_crai.selectedIndex=1;
		form1.akta_kwn.disabled=true
		form1.no_akta_kwn.disabled = true
		form1.tgl_kwn_dd.disabled = true
		form1.tgl_kwn_mm.disabled = true
		form1.tgl_kwn_yy.disabled = true
		form1.akta_crai.disabled = true
		form1.no_akta_crai.disabled = true
		form1.tgl_crai_dd.disabled = true
		form1.tgl_crai_mm.disabled = true
		form1.tgl_crai_yy.disabled = true
                form1.stat_hbkel.focus();
  		return(false)
	}

     if(form1.stat_kwn.options[2].selected == true)
	{
                form1.akta_kwn.disabled=false;
                form1.akta_crai.selectedIndex=1;
                form1.akta_kwn.focus();
		form1.akta_crai.options.disabled = true
		form1.no_akta_crai.disabled = true
		form1.tgl_crai_dd.disabled = true
		form1.tgl_crai_mm.disabled = true
		form1.tgl_crai_yy.disabled = true
		form1.no_akta_kwn.disabled = true
		form1.tgl_kwn_dd.disabled = true
		form1.tgl_kwn_mm.disabled = true
		form1.tgl_kwn_yy.disabled = true
		return(false)
	}
	if(form1.stat_kwn.options[3].selected == true || form1.stat_kwn.options[4].selected == true)
	{
                form1.akta_kwn.selectedIndex=1;
		form1.akta_kwn.options.disabled = true
                form1.no_akta_kwn.value="";
		form1.no_akta_kwn.disabled = true
                form1.tgl_kwn_dd.value="";
                form1.tgl_kwn_mm.value="";
                form1.tgl_kwn_yy.value="";
		form1.tgl_kwn_dd.disabled = true
		form1.tgl_kwn_mm.disabled = true
		form1.tgl_kwn_yy.disabled = true
		form1.akta_crai.options.disabled = false
		form1.no_akta_crai.disabled = true
		form1.tgl_crai_dd.disabled = true
		form1.tgl_crai_mm.disabled = true
		form1.tgl_crai_yy.disabled = true
                form1.akta_crai.focus();
		return(false)
	}

}

function validate4()
{
	 if(form1.akta_kwn.options[1].selected == true)
	{
                         form1.no_akta_kwn.value = ""
			form1.no_akta_kwn.disabled = true
			form1.tgl_kwn_dd.value=""
                       form1.tgl_kwn_mm.value=""
                        form1.tgl_kwn_yy.value=""
                        form1.tgl_kwn_dd.disabled = true
                        form1.tgl_kwn_mm.disabled = true
                         form1.tgl_kwn_yy.disabled = true

                        form1.stat_hbkel.focus();
			return(false)
	}

	if(form1.akta_kwn.options[2].selected == true)
	{
		form1.no_akta_kwn.disabled = false
                 form1.tgl_kwn_dd.disabled = false
                form1.tgl_kwn_mm.disabled = false
                form1.tgl_kwn_yy.disabled = false
               form1.no_akta_kwn.focus();
		return(false)
	}
}

function validate6()
{
	 if(form1.akta_crai.options[2].selected == true)
	{
			form1.no_akta_crai.disabled = false
			form1.tgl_crai_dd.disabled = false
			form1.tgl_crai_mm.disabled = false
			form1.tgl_crai_yy.disabled = false
                        form1.no_akta_crai.focus();
			//form1.tgl_crai_dd.value=""
			return(false)
	}

	if(form1.akta_crai.options[1].selected == true)
	{
                form1.no_akta_crai.value = ""
		form1.no_akta_crai.disabled = true
                 form1.tgl_crai_dd.value="";
                form1.tgl_crai_mm.value="";
                form1.tgl_crai_yy.value="";
                form1.tgl_crai_dd.disabled = true
                form1.tgl_crai_mm.disabled = true
                form1.tgl_crai_yy.disabled = true
                form1.stat_hbkel.focus();
		return(false)
	}
}

function validate8()
{
	 if(form1.klain_fisik.options[1].selected == true)
	{
		form1.pnydng_cct.disabled = true
		return(false)
	}

	if(form1.klain_fisik.options[2].selected == true)
	{
		form1.pnydng_cct.disabled = false
               form1.pnydng_cct.focus();
		return(false)
	}
}

function tab()
{
	form1.no_akta_lh_mon.value="";
        form1.no_akta_lh_yy.value="";

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

		form1.no_akta_lh_mon.focus()
		return false
	}
}
function tabsk()
{

	form1.sk_tgl_mm.value="";
        form1.sk_tgl_yyyy.value="";

if(form1.sk_tgl_dd.value.length > 1)
	{
		for(i = 0; i < form1.sk_tgl_dd.value.length;i++)
		{
			if(isNaN(form1.sk_tgl_dd.value.charAt(i)) || form1.sk_tgl_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.sk_tgl_dd.focus()
				form1.sk_tgl_dd.value=""
				return(false)
			}
		}
		if(form1.sk_tgl_dd.value > 31 || form1.sk_tgl_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.sk_tgl_dd.focus()
			form1.sk_tgl_dd.value=""
			return(false)
		}

		form1.sk_tgl_mm.focus()
		return false
	}
}
function tabsd()
{

	form1.ijazah_mm.value="";
        form1.ijazah_yyyy.value="";

if(form1.ijazah_dd.value.length > 1)
	{
		for(i = 0; i < form1.ijazah_dd.value.length;i++)
		{
			if(isNaN(form1.ijazah_dd.value.charAt(i)) || form1.ijazah_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.ijazah_dd.focus()
				form1.ijazah_dd.value=""
				return(false)
			}
		}
		if(form1.ijazah_dd.value > 31 || form1.ijazah_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.ijazah_dd.focus()
			form1.ijazah_dd.value=""
			return(false)
		}

		form1.ijazah_mm.focus()
		return false
	}
}
function tabtglsat()
{

	form1.tglsatu_mm.value="";
        form1.tglsatu_yyyy.value="";

if(form1.tglsatu_dd.value.length > 1)
	{
		for(i = 0; i < form1.tglsatu_dd.value.length;i++)
		{
			if(isNaN(form1.tglsatu_dd.value.charAt(i)) || form1.tglsatu_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tglsatu_dd.focus()
				form1.tglsatu_dd.value=""
				return(false)
			}
		}
		if(form1.tglsatu_dd.value > 31 || form1.tglsatu_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.tglsatu_dd.focus()
			form1.tglsatu_dd.value=""
			return(false)
		}

		form1.tglsatu_mm.focus()
		return false
	}
}
function tabtgldua()
{

	form1.tgldua_mm.value="";
        form1.tgldua_yyyy.value="";

if(form1.tgldua_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgldua_dd.value.length;i++)
		{
			if(isNaN(form1.tgldua_dd.value.charAt(i)) || form1.tgldua_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgldua_dd.focus()
				form1.tgldua_dd.value=""
				return(false)
			}
		}
		if(form1.tgldua_dd.value > 31 || form1.tgldua_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.tgldua_dd.focus()
			form1.tgldua_dd.value=""
			return(false)
		}

		form1.tgldua_mm.focus()
		return false
	}
}
function tab1()
{
      form1.no_akta_lh_yy.value="";

     if(form1.no_akta_lh_mon.value.length > 1)
	{
		for(i = 0; i < form1.no_akta_lh_mon.value.length;i++)
		{
			if(isNaN(form1.no_akta_lh_mon.value.charAt(i)) || form1.no_akta_lh_mon.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.no_akta_lh_mon.focus()
				form1.no_akta_lh_mon.value=""
				return(false)
			}
		}
		if(form1.no_akta_lh_mon.value > 12 || form1.no_akta_lh_mon.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.no_akta_lh_mon.focus()
			form1.no_akta_lh_mon.value=""
			return(false)
		}
		form1.no_akta_lh_yy.focus()
		return false
	}
}
function tabsk1()
{
      form1.sk_tgl_yyyy.value="";

     if(form1.sk_tgl_mm.value.length > 1)
	{
		for(i = 0; i < form1.sk_tgl_mm.value.length;i++)
		{
			if(isNaN(form1.sk_tgl_mm.value.charAt(i)) || form1.sk_tgl_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.sk_tgl_mm.focus()
				form1.sk_tgl_mm.value=""
				return(false)
			}
		}
		if(form1.sk_tgl_mm.value > 12 || form1.sk_tgl_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.sk_tgl_mm.focus()
			form1.sk_tgl_mm.value=""
			return(false)
		}
		form1.sk_tgl_yyyy.focus()
		return false
	}
}
function tabsd1()
{
      form1.ijazah_yyyy.value="";

     if(form1.ijazah_mm.value.length > 1)
	{
		for(i = 0; i < form1.ijazah_mm.value.length;i++)
		{
			if(isNaN(form1.ijazah_mm.value.charAt(i)) || form1.ijazah_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.ijazah_mm.focus()
				form1.ijazah_mm.value=""
				return(false)
			}
		}
		if(form1.ijazah_mm.value > 12 || form1.ijazah_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.ijazah_mm.focus()
			form1.ijazah_mm.value=""
			return(false)
		}
		form1.ijazah_yyyy.focus()
		return false
	}
}
function tabtglsat1()
{
      form1.tglsatu_yyyy.value="";

     if(form1.tglsatu_mm.value.length > 1)
	{
		for(i = 0; i < form1.tglsatu_mm.value.length;i++)
		{
			if(isNaN(form1.tglsatu_mm.value.charAt(i)) || form1.tglsatu_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tglsatu_mm.focus()
				form1.tglsatu_mm.value=""
				return(false)
			}
		}
		if(form1.tglsatu_mm.value > 12 || form1.tglsatu_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.tglsatu_mm.focus()
			form1.tglsatu_mm.value=""
			return(false)
		}
		form1.tglsatu_yyyy.focus()
		return false
	}
}
function tabtgldua1()
{
      form1.tgldua_yyyy.value="";

     if(form1.tgldua_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgldua_mm.value.length;i++)
		{
			if(isNaN(form1.tgldua_mm.value.charAt(i)) || form1.tgldua_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgldua_mm.focus()
				form1.tgldua_mm.value=""
				return(false)
			}
		}
		if(form1.tgldua_mm.value > 12 || form1.tgldua_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.tgldua_mm.focus()
			form1.tgldua_mm.value=""
			return(false)
		}
		form1.tgldua_yyyy.focus()
		return false
	}
}
function tab2()
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

         if (!parseMonth(form1.no_akta_lh_dd,form1.no_akta_lh_mon,form1.no_akta_lh_yy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.no_akta_lh_dd.value=""
                  form1.no_akta_lh_yy.value="";
                  form1.no_akta_lh_dd.focus();
                  return false;
                }

            if(trim(form1.nama_lgkp.value) != "")
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
function tabsk2()
{
	d = new Date();
	d1 = d.getYear()

if(form1.sk_tgl_yyyy.value.length > 3)
	{
		for(i = 0; i < form1.sk_tgl_yyyy.value.length;i++)
		{
			if(isNaN(form1.sk_tgl_yyyy.value.charAt(i)) || form1.sk_tgl_yyyy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.sk_tgl_yyyy.focus()
				form1.sk_tgl_yyyy.value=""
				return(false)
			}
		}
		if(form1.sk_tgl_yyyy.value < 1900 || form1.sk_tgl_yyyy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.sk_tgl_yyyy.focus()
			form1.sk_tgl_yyyy.value=""
			return(false)
		}

         if (!parseMonth(form1.sk_tgl_dd,form1.sk_tgl_mm,form1.sk_tgl_yyyy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.sk_tgl_dd.value=""
                  form1.sk_tgl_yyyy.value="";
                  form1.sk_tgl_dd.focus();
                  return false;
                }

            if(trim(form1.nama_lgkp.value) != "")
		{
			//form1.jenis_klmin.options.focus()
			return false
		}
		else
		{
			form1.nama_lgkp.focus()
			return false
		}


	}
}
function tabsd2()
{
	d = new Date();
	d1 = d.getYear()

if(form1.ijazah_yyyy.value.length > 3)
	{
		for(i = 0; i < form1.ijazah_yyyy.value.length;i++)
		{
			if(isNaN(form1.ijazah_yyyy.value.charAt(i)) || form1.ijazah_yyyy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.ijazah_yyyy.focus()
				form1.ijazah_yyyy.value=""
				return(false)
			}
		}
		if(form1.ijazah_yyyy.value < 1900 || form1.ijazah_yyyy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.ijazah_yyyy.focus()
			form1.ijazah_yyyy.value=""
			return(false)
		}

         if (!parseMonth(form1.ijazah_dd,form1.ijazah_mm,form1.ijazah_yyyy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.ijazah_dd.value=""
                  form1.ijazah_yyyy.value="";
                  form1.ijazah_dd.focus();
                  return false;
                }

            if(trim(form1.nama_lgkp.value) != "")
		{
			//form1.jenis_klmin.options.focus()
			return false
		}
		else
		{
			form1.nama_lgkp.focus()
			return false
		}


	}
}
function tabtglsat2()
{
	d = new Date();
	d1 = d.getYear()

if(form1.tglsatu_yyyy.value.length > 3)
	{
		for(i = 0; i < form1.tglsatu_yyyy.value.length;i++)
		{
			if(isNaN(form1.tglsatu_yyyy.value.charAt(i)) || form1.tglsatu_yyyy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tglsatu_yyyy.focus()
				form1.tglsatu_yyyy.value=""
				return(false)
			}
		}
		if(form1.tglsatu_yyyy.value < 1900 || form1.tglsatu_yyyy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tglsatu_yyyy.focus()
			form1.tglsatu_yyyy.value=""
			return(false)
		}

         if (!parseMonth(form1.tglsatu_dd,form1.tglsatu_mm,form1.tglsatu_yyyy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.tglsatu_dd.value=""
                  form1.tglsatu_yyyy.value="";
                  form1.tglsatu_dd.focus();
                  return false;
                }

            if(trim(form1.no_srt_dep.value) != "")
		{
			//form1.jenis_klmin.options.focus()
			return false
		}
		else
		{
			form1.no_srt_dep.focus()
			return false
		}


	}
}
function tabtgldua2()
{
	d = new Date();
	d1 = d.getYear()

if(form1.tgldua_yyyy.value.length > 3)
	{
		for(i = 0; i < form1.tgldua_yyyy.value.length;i++)
		{
			if(isNaN(form1.tgldua_yyyy.value.charAt(i)) || form1.tgldua_yyyy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgldua_yyyy.focus()
				form1.tgldua_yyyy.value=""
				return(false)
			}
		}
		if(form1.tgldua_yyyy.value < 1900 || form1.tgldua_yyyy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgldua_yyyy.focus()
			form1.tgldua_yyyy.value=""
			return(false)
		}

         if (!parseMonth(form1.tgldua_dd,form1.tgldua_mm,form1.tgldua_yyyy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.tgldua_dd.value=""
                  form1.tgldua_yyyy.value="";
                  form1.tgldua_dd.focus();
                  return false;
                }

            if(trim(form1.no_srt_dep.value) != "")
		{
			//form1.jenis_klmin.options.focus()
			return false
		}
		else
		{
			form1.no_srt_dep.focus()
			return false
		}


	}
}
function tab3()
{

       form1.no_akta_lhr_mm.value="";
       form1.no_akta_lhr_yy.value="";

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
		form1.no_akta_lhr_mm.focus();
		return false
	}
}

function tab4()
{
       form1.no_akta_lhr_yy.value="";
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

                if (!parseMonth(form1.no_akta_lhr_dd,form1.no_akta_lhr_mm,form1.no_akta_lhr_yy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.no_akta_lhr_dd.value="";
                  form1.no_akta_lhr_yy.value="";
                  form1.no_akta_lhr_dd.focus();
                    return false;
                }

		form1.akta_lhr.options.focus()



		return false
	}
}

function tab6()
{
    form1.tgl_kwn_mm.value="";
    form1.tgl_kwn_yy.value="";

	if(form1.tgl_kwn_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_kwn_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_kwn_dd.value.charAt(i)) || form1.tgl_kwn_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_kwn_dd.focus()
				form1.tgl_kwn_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_kwn_dd.value > 31 || form1.tgl_kwn_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.tgl_kwn_dd.focus()
			form1.tgl_kwn_dd.value=""
			return(false)
		}

		form1.tgl_kwn_mm.focus()
		return false
	}
}
function tab7()
{

       form1.tgl_kwn_yy.value="";
	if(form1.tgl_kwn_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_kwn_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_kwn_mm.value.charAt(i)) || form1.tgl_kwn_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_kwn_mm.focus()
				form1.tgl_kwn_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_kwn_mm.value > 12 || form1.tgl_kwn_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.tgl_kwn_mm.focus()
			form1.tgl_kwn_mm.value=""
			return(false)
		}

		form1.tgl_kwn_yy.focus()
		return false
	}
}
function tab8()
{
	d = new Date()
	d1 = d.getYear()



	if(form1.tgl_kwn_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_kwn_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_kwn_yy.value.charAt(i)) || form1.tgl_kwn_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_kwn_yy.focus()
				form1.tgl_kwn_yy.value=""
				return(false)
			}
		}
		 if(form1.tgl_kwn_yy.value < 1800 || form1.tgl_kwn_yy.value > d1 || form1.tgl_kwn_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_kwn_yy.focus()
			form1.tgl_kwn_yy.value=""
			return(false)
		}
         if (!parseMonth(form1.tgl_kwn_dd,form1.tgl_kwn_mm,form1.tgl_kwn_yy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.tgl_kwn_dd.value="";
                  form1.tgl_kwn_yy.value="";
                  form1.tgl_kwn_dd.focus();
                  return false;
                }

	}
}
function tab9()
{

     form1.tgl_crai_mm.value="";
     form1.tgl_crai_yy.value="";

	if(form1.tgl_crai_dd.value.length > 1)
	{
		for(i = 0; i < form1.tgl_crai_dd.value.length;i++)
		{
			if(isNaN(form1.tgl_crai_dd.value.charAt(i)) || form1.tgl_crai_dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_crai_dd.focus()
				form1.tgl_crai_dd.value=""
				return(false)
			}
		}
		if(form1.tgl_crai_dd.value > 31 || form1.tgl_crai_dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali !.")
			form1.tgl_crai_dd.focus()
			form1.tgl_crai_dd.value=""
			return(false)
		}
		form1.tgl_crai_mm.focus()
		return false
	}
}
function tab10()
{
       form1.tgl_crai_yy.value="";
	 if(form1.tgl_crai_mm.value.length > 1)
	{
		for(i = 0; i < form1.tgl_crai_mm.value.length;i++)
		{
			if(isNaN(form1.tgl_crai_mm.value.charAt(i)) || form1.tgl_crai_mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_crai_mm.focus()
				form1.tgl_crai_mm.value=""
				return(false)
			}
		}
		if(form1.tgl_crai_mm.value > 12 || form1.tgl_crai_mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali !.")
			form1.tgl_crai_mm.focus()
			form1.tgl_crai_mm.value=""
			return(false)
		}
		form1.tgl_crai_yy.focus()
		return false
	}
}
function tab11()
{
	d = new Date();
	d1 = d.getYear()

	if(form1.tgl_crai_yy.value.length > 3)
	{
		for(i = 0; i < form1.tgl_crai_yy.value.length;i++)
		{
			if(isNaN(form1.tgl_crai_yy.value.charAt(i)) || form1.tgl_crai_yy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi !")
				form1.tgl_crai_yy.focus()
				form1.tgl_crai_yy.value=""
				return(false)
			}
		}
		 if(form1.tgl_crai_yy.value < 1800 || form1.tgl_crai_yy.value > d1 || form1.tgl_crai_yy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali !.")
			form1.tgl_crai_yy.focus()
			form1.tgl_crai_yy.value=""
			return(false)
		}

         if (!parseMonth(form1.tgl_crai_dd,form1.tgl_crai_mm,form1.tgl_crai_yy))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  form1.tgl_crai_dd.value="";
                  form1.tgl_crai_yy.value="";
                  form1.tgl_crai_dd.focus();
                  return false;
                }

		form1.stat_hbkel.options.focus();
		return(false)
	}
}

function char(s)
{

	for (i=0; i < s.value.length; i++)
	{
		 if(!((s.value.charAt(i) >= 'A' && s.value.charAt(i) <= 'Z') || (s.value.charAt(i) >= 'a' && s.value.charAt(i) <= 'z') || (s.value.charAt(i) == ' ') || (s.value.charAt(i) == ',') || (s.value.charAt(i) == '.') || (s.value.charAt(i) == "'") || (s.value.charAt(i) == "-")))
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

	/*if(form1.nik_ibu.value != "")
	{
		form1.nama_lgkp_ibu.disabled=true
	}
	else if(form1.nik_ibu.value == "")
	{
		form1.nama_lgkp_ibu.disabled=false
	}
	if(form1.nik_ayh.value != "")
	{
		form1.nama_lgkp_ayh.disabled = true
	}
	else if(form1.nik_ayh.value == "")
	{
		form1.nama_lgkp_ayh.disabled = false
	}*/

        return(false)
}
function validateKK1()
{

	if(form1.nama_kel.value == "")
	{
		alert("Nama Desa/Kelurahan belum diisi!")
		form1.nama_kel.focus()
		return false
	}
	if(form1.jenis.options[0].selected == true)
	{
		alert("Jenis Dokumen belum diisi !.")
		form1.jenis.focus()
		return false
   	}
   	if(form1.jab_kec.value == "" && form1.nama_pejbt_kec2.value == "" && form1.nip_pejbt_cmt.value == "" && form1.jab_kel.value == "" && form1.nama_pejbt_kel.value == "" && form1.nip_lrh.value == "" )
   	{
		alert("Kecamatan or Kelurahan belum diisi !.")
		form1.jab_kec.focus()
		return false
	}

   	if(form1.jenis.options[2].selected == true && form1.radiobutton[0].checked != true && form1.radiobutton[1].checked != true && form1.radiobutton[2].checked != true)
   	{
		alert("Atas Nama Pejabat belum diisi !.")
		return false
	}
	 if((form1.jenis.options[1].selected == true) && (form1.jab_kec.value != "" || form1.nama_pejbt_kec2.value != "" || form1.nip_pejbt_cmt.value != ""))
	{
		if(form1.jab_kec.value == "" || form1.nama_pejbt_kec2.value == "" || form1.nip_pejbt_cmt.value == "")
		{
			alert("Jabatan di Kecamatan, Nama Pejabat di Kecamatan , NIP Pejabat di Kecamatan belum diisi !. belum diisi !.")
			form1.jab_kec.focus()
			return false
		}
	}
	if((form1.jenis.options[1].selected == true) && (form1.jab_kel.value != "" || form1.nama_pejbt_kel.value != "" || form1.nip_lrh.value != ""))
	{
		if(form1.jab_kel.value == "" || form1.nama_pejbt_kel.value == "" || form1.nip_lrh.value == "")
		{
			alert("Jabatan di Kelurahan, Nama Pejabat di Kelurahan, NIP Lurah belum diisi !.")
			form1.jab_kel.focus()
			return false
		}
	}
	if((form1.radiobutton[0].checked == true && form1.jab_kec.value == "") || (form1.radiobutton[1].checked == true && form1.jab_kec.value == ""))
	{
		alert("Jabatan di Kecamatan belum diisi !.")
		form1.jab_kec.focus()
		return false
	}
	if((form1.radiobutton[0].checked == true && form1.nama_pejbt_kec2.value == "") || (form1.radiobutton[1].checked == true && form1.nama_pejbt_kec2.value == ""))
	{
		alert("Nama Pejabat di Kecamatan belum diisi !.")
		form1.nama_pejbt_kec2.focus()
		return false
	}
	if((form1.radiobutton[0].checked == true && form1.nip_pejbt_cmt.value == "") || (form1.radiobutton[1].checked == true && form1.nip_pejbt_cmt.value == ""))
	{
		alert("NIP Pejabat di Kecamatan belum diisi !.")
		form1.nip_pejbt_cmt.focus()
		return false
	}
	if(form1.radiobutton[2].checked == true && form1.jab_kel.value == "")
	{
		alert("Jabatan di Kelurahan belum diisi !.")
		form1.jab_kel.focus()
		return false
	}
	if(form1.radiobutton[2].checked == true && form1.nama_pejbt_kel.value == "")
	{
		alert("Nama Pejabat di Kelurahan belum diisi !.")
		form1.nama_pejbt_kel.focus()
		return false
	}
	if(form1.radiobutton[2].checked == true && form1.nip_lrh.value == "")
	{
		alert("NIP Lurah belum diisi !.")
		form1.nip_lrh.focus()
		return false
	}
}
function validateKK1ADV()
{

	if(form1.nama_kel.value == "")
	{
		alert("Nama Desa/Kelurahan belum diisi!")
		form1.nama_kel.focus()
		return false
	}
	if(form1.jenis.options[0].selected == true)
	{
		alert("Jenis Dokumen belum diisi !.")
		form1.jenis.focus()
		return false
   	}
   	if(form1.jab_kec.value == "" && form1.nama_pejbt_kec2.value == "" && form1.nip_pejbt_cmt.value == "" && form1.jab_kel.value == "" && form1.nama_pejbt_kel.value == "" && form1.nip_lrh.value == "" )
   	{
		alert("Kecamatan or Kelurahan belum diisi !.")
		form1.jab_kec.focus()
		return false
	}

   	if(form1.jenis.options[2].selected == true && form1.radiobutton[0].checked != true && form1.radiobutton[1].checked != true && form1.radiobutton[2].checked != true)
   	{
		alert("Atas Nama Pejabat belum diisi !.")
		return false
	}
	 if((form1.jenis.options[1].selected == true) && (form1.jab_kec.value != "" || form1.nama_pejbt_kec2.value != "" || form1.nip_pejbt_cmt.value != ""))
	{
		if(form1.jab_kec.value == "" || form1.nama_pejbt_kec2.value == "" || form1.nip_pejbt_cmt.value == "")
		{
			alert("Jabatan di Kecamatan, Nama Pejabat di Kecamatan , NIP Pejabat di Kecamatan belum diisi !. belum diisi !.")
			form1.jab_kec.focus()
			return false
		}
	}
	if((form1.jenis.options[1].selected == true) && (form1.jab_kel.value != "" || form1.nama_pejbt_kel.value != "" || form1.nip_lrh.value != ""))
	{
		if(form1.jab_kel.value == "" || form1.nama_pejbt_kel.value == "" || form1.nip_lrh.value == "")
		{
			alert("Jabatan di Kelurahan, Nama Pejabat di Kelurahan, NIP Lurah belum diisi !.")
			form1.jab_kel.focus()
			return false
		}
	}
	if((form1.radiobutton[0].checked == true && form1.jab_kec.value == "") || (form1.radiobutton[1].checked == true && form1.jab_kec.value == ""))
	{
		alert("Jabatan di Kecamatan belum diisi !.")
		form1.jab_kec.focus()
		return false
	}
	if((form1.radiobutton[0].checked == true && form1.nama_pejbt_kec2.value == "") || (form1.radiobutton[1].checked == true && form1.nama_pejbt_kec2.value == ""))
	{
		alert("Nama Pejabat di Kecamatan belum diisi !.")
		form1.nama_pejbt_kec2.focus()
		return false
	}
	if((form1.radiobutton[0].checked == true && form1.nip_pejbt_cmt.value == "") || (form1.radiobutton[1].checked == true && form1.nip_pejbt_cmt.value == ""))
	{
		alert("NIP Pejabat di Kecamatan belum diisi !.")
		form1.nip_pejbt_cmt.focus()
		return false
	}
	if(form1.radiobutton[2].checked == true && form1.jab_kel.value == "")
	{
		alert("Jabatan di Kelurahan belum diisi !.")
		form1.jab_kel.focus()
		return false
	}
	if(form1.radiobutton[2].checked == true && form1.nama_pejbt_kel.value == "")
	{
		alert("Nama Pejabat di Kelurahan belum diisi !.")
		form1.nama_pejbt_kel.focus()
		return false
	}
	if(form1.radiobutton[2].checked == true && form1.nip_lrh.value == "")
	{
		alert("NIP Lurah belum diisi !.")
		form1.nip_lrh.focus()
		return false
	}
}


function validateKK()
{
	if(form1.jenis.options[1].selected == true)
	{
		form1.radiobutton[0].disabled=true
		form1.radiobutton[1].disabled=true
		form1.radiobutton[2].disabled=true
	}
	if(form1.jenis.options[1].selected == true && form1.jab_kec.value == "" && form1.nama_pejbt_kec2.value == "" && form1.nip_pejbt_cmt.value == "")
	{
		form1.radiobutton[0].disabled=true
		form1.radiobutton[1].disabled=true
		form1.radiobutton[2].disabled=true

		form1.jab_kec.disabled=false
		form1.nama_pejbt_kec2.disabled=false
		form1.nip_pejbt_cmt.disabled=false
		form1.jab_kec.focus()

	}
	if(form1.jenis.options[1].selected == true && form1.jab_kel.value == "" && form1.nama_pejbt_kel.value == "" && form1.nip_lrh.value == "")
	{
		form1.radiobutton[0].disabled=true
		form1.radiobutton[1].disabled=true
		form1.radiobutton[2].disabled=true

		form1.jab_kel.disabled=false
		form1.nama_pejbt_kel.disabled=false
		form1.nip_lrh.disabled=false
	}
	 if(form1.jenis.options[2].selected == true)
	{
		form1.radiobutton[0].disabled=false
		form1.radiobutton[1].disabled=false
		form1.radiobutton[2].disabled=false

		form1.jab_kec.disabled=true
		form1.nama_pejbt_kec2.disabled=true
		form1.nip_pejbt_cmt.disabled=true

		form1.jab_kel.disabled=true
		form1.nama_pejbt_kel.disabled=true
		form1.nip_lrh.disabled=true
	}

}

function  radioValid1()
{
	form1.jab_kec.disabled=false
	form1.nama_pejbt_kec2.disabled=false
	form1.nip_pejbt_cmt.disabled=false

	form1.jab_kel.disabled=true
	form1.nama_pejbt_kel.disabled=true
	form1.nip_lrh.disabled=true

	form1.jab_kec.focus()
	form1.sim.disabled=false
}
function  radioValid2()
{
	form1.jab_kec.disabled=false
	form1.nama_pejbt_kec2.disabled=false
	form1.nip_pejbt_cmt.disabled=false

	form1.jab_kel.disabled=true
	form1.nama_pejbt_kel.disabled=true
	form1.nip_lrh.disabled=true

	form1.jab_kec.focus()
       form1.sim.disabled=false
}
function  radioValid3()
{
	form1.jab_kel.disabled=false
	form1.nama_pejbt_kel.disabled=false
	form1.nip_lrh.disabled=false

	form1.jab_kec.disabled=true
	form1.nama_pejbt_kec2.disabled=true
	form1.nip_pejbt_cmt.disabled=true

	form1.jab_kel.focus()
       form1.sim.disabled=false
}

function ex()
{
   v=window.history.length;
   history.go(-v);
}

function ex1()
{
  window.history.back()
}

function edit()
{
	if(form1.ubah.value == "UBAH")
	{
		form1.jab_kec.disabled = false
		form1.nama_pejbt_kec2.disabled = false
		form1.nip_pejbt_cmt.disabled = false

		form1.jab_kel.disabled=false
		form1.nama_pejbt_kel.disabled=false
		form1.nip_lrh.disabled = false

		form1.jab_kec.focus()
		form1.sim.disabled = false

	}
}


function wnavalidate()
{
	if(form1.jenis.options[1].selected == true)
	{
		form1.radiobutton[0].disabled=true
		form1.radiobutton[1].disabled=true

		form1.jab_kec.disabled=true
		form1.nama_pejbt_kec2.disabled=true
		form1.nip_pejbt_cmt.disabled=true

	}
	 if(form1.jenis.options[2].selected == true)
	{
		form1.radiobutton[0].disabled=false
		form1.radiobutton[1].disabled=false

		form1.jab_kec.disabled=true
		form1.nama_pejbt_kec2.disabled=true
		form1.nip_pejbt_cmt.disabled=true
 	}
}

function  radioValid11()
{
	form1.jab_kec.disabled=false
	form1.nama_pejbt_kec2.disabled=false
	form1.nip_pejbt_cmt.disabled=false

	form1.jab_kec.focus()
	form1.sim.disabled=false
}
function  radioValid22()
{
	form1.jab_kec.disabled=false
	form1.nama_pejbt_kec2.disabled=false
	form1.nip_pejbt_cmt.disabled=false

	form1.jab_kec.focus()
        form1.sim.disabled=false
}

function wnavalidate1()
{
	if(form1.jenis.options[0].selected == true)
	{
		alert("Jenis Dokumen belum diisi !.")
		form1.jenis.focus()
		return false
   	}
   	if(form1.jenis.options[2].selected == true && form1.radiobutton[0].checked != true && form1.radiobutton[1].checked != true && form1.radiobutton[2].checked != true)
   	{
		alert("Atas Nama Pejabat belum diisi !.")
		return false
	}
	if(form1.jab_kec.value == "")
	{
		alert("Jabatan di Kabupaten/Kota belum diisi !.")
		form1.jab_kec.focus()
		return false
	}
	if(form1.nama_pejbt_kec2.value == "")
	{
		alert("Nama Pejabat di Kabupaten/Kota belum diisi !.")
		form1.nama_pejbt_kec2.focus()
		return false
	}
	if(form1.nip_pejbt_cmt.value == "")
	{
		alert("NIP Pejabat di Kabupaten/Kota belum diisi !.")
		form1.nip_pejbt_cmt.focus()
		return false
	}
}

function edit1()
{
	if(form1.ubah.value == "UBAH")
	{
		form1.jab_kec.disabled = false
		form1.nama_pejbt_kec2.disabled = false
		form1.nip_pejbt_cmt.disabled = false

		form1.jab_kec.focus()
		form1.sim.disabled = false

	}
}

function edit11()
{
	if(form1.ubah.value == "UBAH")
	{
		form1.no_ktp.disabled = false
		form1.tmpt_sbl.disabled = false
		form1.no_paspor.disabled = false

		form1.no_akta_lh_dd.disabled = false
		form1.no_akta_lh_mon.disabled = false
		form1.no_akta_lh_yy.disabled = false

		form1.nama_lgkp.disabled = false
		form1.tmpt_lhr.disabled = false
		//form1.akta_lhr.options.disabled = false

		//form1.no_akta_lhr.disabled = false
		form1.gol_drh.options.disabled = false
		form1.aga_ma.options.disabled = false

		form1.nik_ibu.disabled = false
		form1.nik_ayh.disabled = false
		form1.nama_lgkp_ayh.disabled = false
		form1.nama_ket_rt.disabled = false
		form1.nama_ket_rw.disabled = false
		form1.nama_pet_reg.disabled = false
		form1.nip_pet_reg.disabled = false
		form1.sim.disabled = false

	}
}

function checkpkrjn(pdk,pkr)
{
   switch(pdk)
   {
     case 1:
             if  ((parseInt(pkr,10)==40) || (parseInt(pkr,10)==67) || (parseInt(pkr,10)==30) || (parseInt(pkr,10)==41))
                 {
                    alert("Jenis Pekerjaan tidak sesuai dengan Pendidikan Terakhir ");
                         document.all['jenis_pkrjn'].selectedIndex=0;
                         document.all['jenis_pkrjn'].focus();
                     return false;
                 }
        break;
     case 2:
                 if  ((parseInt(pkr,10)==40) || (parseInt(pkr,10)==67) || (parseInt(pkr,10)==30))
                 {
                         alert("Jenis Pekerjaan tidak sesuai dengan Pendidikan Terakhir ");
                         document.all['jenis_pkrjn'].selectedIndex=0;
                         document.all['jenis_pkrjn'].focus();
                     return false;
                 }
        break;
 }
}