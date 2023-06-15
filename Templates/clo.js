function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
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

 if ( ((tgl_obj!=null) && (parseInt(tgl_obj.value)!=0) && (trim(tgl_obj.value)!=""))
       &&
 ((bln_obj!=null) && (parseInt(bln_obj.value)!=0) && (trim(bln_obj.value)!=""))
        &&
((thn_obj!=null) && (parseInt(thn_obj.value)!=0) && (trim(thn_obj.value)!="") && yr.length==4))
    {
               tgl=parseInt(tgl_obj.value);
               bln=parseInt(bln_obj.value);
               yr=parseInt(thn_obj.value);

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

function checkBerlaku(obj1,obj2,obj3)
{
var today = new Date();
var year=today.getYear();
var mon=today.getMonth();
var day=today.getDate();

if (year<2000)
{
year=year+1900;
}

var dt1 = new Date(year,mon,day);
var dt2=new Date(obj3.value,obj2.value-1,obj1.value);

if(dt1>dt2)
{
    return false;
}
return true;
}


function ValiBio()
{
if(trim(wnabiodata.nama_klrga.value)=="")
{
 	alert("Nama Kepala Keluarga belum diisi!");
	wnabiodata.nama_klrga.focus();
 	wnabiodata.nama_klrga.select();
 	return false;
}

if(wnabiodata.jenis_klmin.options[0].selected==true)
	{
		alert("Jenis kelamin belum diisi !");
		wnabiodata.jenis_klmin.focus();
		return false;
	}

if(trim(wnabiodata.tmpt_lhr.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !");
 			wnabiodata.tmpt_lhr.select();
			wnabiodata.tmpt_lhr.focus();
			return false;
}
if(trim(wnabiodata.t1.value)=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.t1.select();
	 wnabiodata.t1.focus();
	 return false;
}
if(wnabiodata.t1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali!!!");
	 wnabiodata.t1.value="";
	 wnabiodata.t1.focus();
	 return false;
}
if(wnabiodata.t1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.t1.focus();
			wnabiodata.t1.value="";
			return false

}
if(wnabiodata.t1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t1.value="";
		wnabiodata.t1.focus();
		return false;
}

if(trim(wnabiodata.t2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.t2.value="";
			wnabiodata.t2.focus();
			return false;
}
if(wnabiodata.t2.value=="00")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.t2.value="";
			wnabiodata.t2.focus();
			return false;
}
if(wnabiodata.t2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.t2.focus();
			wnabiodata.t2.select();
			return false

}

if(wnabiodata.t2.value==2)
{
	if (wnabiodata.t1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t1.value="";
		wnabiodata.t1.focus();
		return false;
	}
}

if(wnabiodata.t2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t2.value="";
	wnabiodata.t2.focus();
	return false;
}
if(trim(wnabiodata.t3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.t3.value="";
	wnabiodata.t3.focus();
	return false;

}
if(wnabiodata.t3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.t3.value="";
		wnabiodata.t3.focus();
		return false;
}
var z=new Date();
var y=z.getYear();
var m=z.getMonth();
var d=z.getDay();
var abc=new Date(wnabiodata.t2.value+"/"+wnabiodata.t1.value+"/"+wnabiodata.t3.value);
if(wnabiodata.t3.value<1800 || wnabiodata.t3.value>y)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t3.value="";
		wnabiodata.t3.focus();
		return false;
}
if(abc>z)
{
                alert("Periksa pemasukan kebenaran data Tanggal !!");
                wnabiodata.t3.value="";
                wnabiodata.t2.value=""
                wnabiodata.t1.value=""
		wnabiodata.t1.focus();
		return false;
}

if(trim(wnabiodata.kwrngrn.value)=="")
{
 	alert("Kewarganegaraan belum diisi !");
 	wnabiodata.kwrngrn.select();
	wnabiodata.kwrngrn.focus();
	return false;
}
	if(wnabiodata.agama.options[0].selected==true)
	{
		alert(" Apakah pilihan Jenis Agama belum diisi !");
		wnabiodata.agama.focus();
		return false;
	}


if(wnabiodata.gol_drh.options[0].selected==true)
{
	alert(" Golongan Darah belum diisi !");
	wnabiodata.gol_drh.focus();
	return false;
}

if(wnabiodata.stat_kwn.options[0].selected==true)
{
	alert(" Status Perkawinan belum diisi !");
	wnabiodata.stat_kwn.focus();
	return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==1 || wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3)
{
if(wnabiodata.jenis_klmin.options[1].selected==true)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
                //alert("kk age is "+diff);
                if (diff<17)
                {
                 wnabiodata.stat_kwn.focus();
                 alert("Pendunuk ini masih dibawah usia Perkawinan !");
                 return false;
                }
       }
else if(wnabiodata.jenis_klmin.options[2].selected==true)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
                //alert("kk ee age is "+diff);
                if (diff<14)
                {
wnabiodata.stat_kwn.focus();
                 alert("Pendunuk ini masih dibawah usia Perkawinan !");

                 return false;
                }
       }
}
if(wnabiodata.stat_hbkel.options[0].selected==true)
{
	alert(" Status Hubungan dalam keluarga belum diisi !");
	wnabiodata.stat_hbkel.focus();
	return false;
}

var idx=wnabiodata.stat_hbkel.selectedIndex

if(((parseInt(idx)==3) || (parseInt(idx)==5)) || ((parseInt(idx)==8) || (parseInt(idx)==10)))
{

null;
}
else
{
 if(wnabiodata.jenis_klmin.options[1].selected==true)
	{
  var t3=wnabiodata.t3.value;
  var t2=wnabiodata.t2.value;
  var t1=wnabiodata.t1.value;

  var td=new Date();


		var now=new Date(t3, t2, t1);

                var one_day=1000*60*60*24*365;
                //Calculate difference btw the two dates, and convert to days
                var diff=(Math.ceil(td-now)/one_day);
                //alert("age is "+diff);
                if (diff<17)
                {
                 alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !");
                 wnabiodata.t1.focus();
                 return false;
                }
	}
     else if(wnabiodata.jenis_klmin.options[2].selected==true)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
               //alert("age is in "+diff);
                if (diff<15)
                {

                 alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !");
                 wnabiodata.t1.focus();
                 return false;
                }
	}
}


if(wnabiodata.jenis_klmin.options[wnabiodata.jenis_klmin.selectedIndex].value==1 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
		wnabiodata.stat_hbkel.focus();
		return false;
}

if(wnabiodata.jenis_klmin.options[wnabiodata.jenis_klmin.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
		wnabiodata.stat_hbkel.focus();
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==5)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}

if(wnabiodata.pddk_akh.options[0].selected==true)
{
	alert(" Status Pendidikan Terakhir belum diisi !");
	wnabiodata.pddk_akh.focus();
	return false;
}
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
if((wnabiodata.pddk_akh.options[1].selected == true && diff < 9) ||
(wnabiodata.pddk_akh.options[2].selected == true && diff < 12) ||
(wnabiodata.pddk_akh.options[3].selected == true && diff < 15) ||
(wnabiodata.pddk_akh.options[4].selected == true && diff < 15) ||
(wnabiodata.pddk_akh.options[5].selected == true && diff < 17) ||
(wnabiodata.pddk_akh.options[6].selected == true && diff < 17) ||
(wnabiodata.pddk_akh.options[7].selected == true && diff < 17))
	{       wnabiodata.pddk_akh.focus();
		alert ("Pendidikan Terakhir tidak sesuai dengan usia !.");
		return false;
	}

if(wnabiodata.jenis_pkrjn.options[0].selected==true)
{
	alert(" Status Jenis Pekerjaan  belum diisi !");
	wnabiodata.jenis_pkrjn.focus();
	return false;
}
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value+1;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(Math.ceil(td-now)/(one_day*365));
if((wnabiodata.jenis_pkrjn.options[1].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[2].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[3].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[4].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[5].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[6].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[7].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[8].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[9].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[10].selected == true && diff < 17)||
(wnabiodata.jenis_pkrjn.options[11].selected == true && diff < 17))
	{       wnabiodata.jenis_pkrjn.focus();
		alert ("Umur tidak sesuai dengan Jenis Perkerjaan? !.");
		return false;
	}
if(trim(wnabiodata.datng_dari.value)=="")
{
	 alert("Datang dari belum diisi !");
 	wnabiodata.datng_dari.select();
	wnabiodata.datng_dari.focus();
	return false;
}
if(trim(wnabiodata.tujuan_dtng.value)=="")
{
 	alert("Tujuan Kedatangan belum diisi !");
 	wnabiodata.tujuan_dtng.select();
	wnabiodata.tujuan_dtng.focus();
	return false;
}
if(trim(wnabiodata.num_paspor.value)=="")
{
 	alert("Nomor Paspor belum diisi !");
 	wnabiodata.num_paspor.select();
	 wnabiodata.num_paspor.focus();
 	return false;
}

while (wnabiodata.num_paspor.value.substring(0,1) == ' ')
	{
        wnabiodata.num_paspor.value = wnabiodata.num_paspor.value.substring(1, wnabiodata.num_paspor.length);
	}

	while (wnabiodata.num_paspor.value.substring(wnabiodata.num_paspor.value.length-1,wnabiodata.num_paspor.value.length) == ' ')
 	{
      wnabiodata.num_paspor.value = wnabiodata.num_paspor.value.substring(0, wnabiodata.num_paspor.value.length-1);
	}
var objpassl=new Object();
var tv;
var s=wnabiodata.kk.value;

var r=wnabiodata.num_paspor.value;
//alert("kk valu"+s+"  "+r);
for (tv=2;tv<=s-1;tv++)
{
bc="a"+tv;
objpassl=document.all[bc];
//alert("objval "+objpassl.value+"   "+r);
if(objpassl.value==r.toLowerCase())
{
alert("Pada Keluarga ini nomor Individu ini sudah Ada !!! ");
wnabiodata.num_paspor.select();
wnabiodata.num_paspor.focus();
return false;
}
tv=tv+3;
}

if(trim(wnabiodata.tp1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tp1.select();
	 wnabiodata.tp1.focus();
	 return false;
}
if(wnabiodata.tp1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tp1.select();
	 wnabiodata.tp1.focus();
	 return false;
}
if(wnabiodata.tp1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tp1.focus();
			wnabiodata.tp1.select();
			return false

}
if(wnabiodata.tp1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
}


if(trim(wnabiodata.tp2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}
if(wnabiodata.tp2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}
if(wnabiodata.tp2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tp2.focus();
			wnabiodata.tp2.select();
			return false

}

if(wnabiodata.tp2.value==2)
{
	if (wnabiodata.tp1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
	}
}

if(wnabiodata.tp2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali !!");
	wnabiodata.tp2.select();
	wnabiodata.tp2.focus();
	return false;
}
if(trim(wnabiodata.tp3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tp3.select();
	wnabiodata.tp3.focus();
	return false;

}
if(wnabiodata.tp3.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tp3.select();
	wnabiodata.tp3.focus();
	return false;

}
if(wnabiodata.tp3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}

var z=new Date();
var y=z.getYear();
if(wnabiodata.tp3.value<1800 || wnabiodata.tp3.value>y)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}



if(trim(wnabiodata.tb1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tb1.select();
	 wnabiodata.tb1.focus();
	 return false;
}
if(wnabiodata.tb1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tb1.select();
	 wnabiodata.tb1.focus();
	 return false;
}
if(wnabiodata.tb1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tb1.focus();
			wnabiodata.tb1.select();
			return false

}
if(wnabiodata.tb1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
}


if(trim(wnabiodata.tb2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}
if(wnabiodata.tb2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}
if(wnabiodata.tb2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");;
			wnabiodata.tb2.focus();
			wnabiodata.tb2.select();
			return false

}
if(wnabiodata.tb2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.tb2.select();
	wnabiodata.tb2.focus();
	return false;
}
if(wnabiodata.tb2.value==2)
{
	if (wnabiodata.tb1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
	}
}

if(trim(wnabiodata.tb3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tb3.select();
	wnabiodata.tb3.focus();
	return false;

}
if(wnabiodata.tb3=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tb3.select();
	wnabiodata.tb3.focus();
	return false;

}
if(wnabiodata.tb3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb3.select();
		wnabiodata.tb3.focus();
		return false;
}

if(wnabiodata.dok_imgr.options[0].selected==true)
{
	alert(" Dokumen Imigrasi belum diisi ! ");
	wnabiodata.dok_imgr.focus();
	return false;
}

if(trim(wnabiodata.num_dok.value)=="")
{
 			alert("Nomor Dokumen belum diisi !!!");
                        wnabiodata.num_dok.select();
			wnabiodata.num_dok.focus();
			return false;
}
if(trim(wnabiodata.tmpt_dtbit.value)=="")
{
 			alert("Tempat Diterbitkan belum diisi !!!");
                        wnabiodata.tmpt_dtbit.select();
			wnabiodata.tmpt_dtbit.focus();
			return false;
}
if(trim(wnabiodata.tt1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tt1.select();
	 wnabiodata.tt1.focus();
	 return false;
}
if(wnabiodata.tt1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tt1.select();
	 wnabiodata.tt1.focus();
	 return false;
}
if(wnabiodata.tt1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tt1.focus();
			wnabiodata.tt1.select();
			return false

}
if(wnabiodata.tt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
}


if(trim(wnabiodata.tt2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}
if(wnabiodata.tt2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}
if(wnabiodata.tt2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tt2.focus();
			wnabiodata.tt2.select();
			return false

}

if(wnabiodata.tt2.value==2)
{
	if (wnabiodata.tt1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
	}
}

if(wnabiodata.tt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tt2.select();
	wnabiodata.tt2.focus();
	return false;
}


if(trim(wnabiodata.tt3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tt3.select();
	wnabiodata.tt3.focus();
	return false;

}
if(wnabiodata.tt3.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tt3.select();
	wnabiodata.tt3.focus();
	return false;

}
if(wnabiodata.tt3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt3.select();
		wnabiodata.tt3.focus();
		return false;
}



if(trim(wnabiodata.tl1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.tl1.select();
	 wnabiodata.tl1.focus();
	 return false;
}
if(wnabiodata.tl1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.tl1.select();
	 wnabiodata.tl1.focus();
	 return false;
}
if(wnabiodata.tl1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tl1.focus();
			wnabiodata.tl1.select();
			return false

}
if(wnabiodata.tl1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
}


if(trim(wnabiodata.tl2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}
if(wnabiodata.tl2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}
if(wnabiodata.tl2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tl2.focus();
			wnabiodata.tl2.select();
			return false

}

if(wnabiodata.tl2.value==2)
{
	if (wnabiodata.tl1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
	}
}

if(wnabiodata.tl2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tl2.select();
	wnabiodata.tl2.focus();
	return false;
}


if(trim(wnabiodata.tl3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tl3.select();
	wnabiodata.tl3.focus();
	return false;

}
if(trim(wnabiodata.tl3.value)=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tl3.select();
	wnabiodata.tl3.focus();
	return false;

}
if(wnabiodata.tl3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.tl3.select();
		wnabiodata.tl3.focus();
		return false;
}


if(trim(wnabiodata.tmpt_dtng_pert.value)=="")
{
 	alert("Tempat Kedatangan Pertama belum diisi !");
 	wnabiodata.tmpt_dtng_pert.select();
	wnabiodata.tmpt_dtng_pert.focus();
	return false;
}
if(trim(wnabiodata.ttt1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.ttt1.select();
	 wnabiodata.ttt1.focus();
	 return false;
}
if(wnabiodata.ttt1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.ttt1.select();
	 wnabiodata.ttt1.focus();
	 return false;
}
if(wnabiodata.ttt1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.ttt1.focus();
			wnabiodata.ttt1.select();
			return false

}
if(wnabiodata.ttt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
}


if(trim(wnabiodata.ttt2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}
if(wnabiodata.ttt2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}
if(wnabiodata.ttt2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.ttt2.focus();
			wnabiodata.ttt2.select();
			return false

}
if(wnabiodata.ttt2.value==2)
{
	if (wnabiodata.ttt1.value>29)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
	}
}

if(wnabiodata.ttt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.ttt2.select();
	wnabiodata.ttt2.focus();
	return false;
}


if(trim(wnabiodata.ttt3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.ttt3.select();
	wnabiodata.ttt3.focus();
	return false;

}
if(wnabiodata.ttt3=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.ttt3.select();
	wnabiodata.ttt3.focus();
	return false;

}
if(wnabiodata.ttt3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.ttt3.select();
		wnabiodata.ttt3.focus();
		return false;
}
if(trim(wnabiodata.nama_spsor.value)=="")
{
 	alert("Nama Sponsor belum diisi !");
	wnabiodata.nama_spsor.select();
	wnabiodata.nama_spsor.focus();
	return false;
}
if(wnabiodata.tipe_spsor.options[0].selected==true)
{
	alert(" Tipe Sponsor belum diisi ! ");
	wnabiodata.tipe_spsor.focus();
	return false;
}
if(trim(wnabiodata.alamat_spsor.value)=="")
{
 	alert("Alamat Sponsor belum diisi !");
	wnabiodata.alamat_spsor.select();
	wnabiodata.alamat_spsor.focus();
	return false;
}
/*
if(wnabiodata.nrt.value=="")
{
 	alert("RT No belum diisi !");
	wnabiodata.nrt.select();
	wnabiodata.nrt.focus();
	return false;
}
if(wnabiodata.nrt.value.length < 3)
{
	alert("kode RT No 3 digit !!");
	wnabiodata.nrt.select();
	wnabiodata.nrt.focus();
	return false;
}
*/

if(trim(wnabiodata.t4.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.t4.select();
	 wnabiodata.t4.focus();
	 return false;
}
if(trim(wnabiodata.t4.value)=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.t4.select();
	 wnabiodata.t4.focus();
	 return false;
}
if(wnabiodata.t4.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.t4.focus();
			wnabiodata.t4.select();
			return false

}
if(wnabiodata.t4.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
}


if(trim(wnabiodata.t5.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali  !!!");
                        wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}
if(wnabiodata.t5.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali  !!!");
                        wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}
if(wnabiodata.t5.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.t5.focus();
			wnabiodata.t5.select();
			return false

}

if(wnabiodata.t5.value==2)
{
	if (wnabiodata.t4.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
	}
}

if(wnabiodata.t5.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t5.select();
	wnabiodata.t5.focus();
	return false;
}


if(trim(wnabiodata.t6.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.t6.select();
	wnabiodata.t6.focus();
	return false;

}
if(wnabiodata.t6.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.t6.select();
	wnabiodata.t6.focus();
	return false;

}
if(wnabiodata.t6.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t6.select();
		wnabiodata.t6.focus();
		return false;
}

if (!checkBerlaku(document.all['tb1'],document.all['tb2'],document.all['tb3']))
{
         alert(" Tanggal Berakhir Paspor salah !!");
         document.all['tb1'].value="";
         document.all['tb2'].value="";
         document.all['tb3'].value="";
         document.all['tb1'].focus();
         return false;
}


if(trim(wnabiodata.nama_klrga.value)!="")
{
if(!(confirm(" Apakah Nama Keluarga sudah benar ?")))
	{
                wnabiodata.nama_klrga.focus();
		return false;
	}

}
if(trim(wnabiodata.nama_pertma.value)!="")
{
if(!(confirm(" Apakah Nama pertama sudah benar ?")))
	{
                wnabiodata.nama_pertma.focus();
		return false;
	}
}
if(wnabiodata.jenis_klmin.options[0].selected==false)
{
if(!(confirm(" Apakah pilihan Jenis Kelamin sudah benar ?")))
	{
                wnabiodata.jenis_klmin.focus();
		return false;
	}
}
if(trim(wnabiodata.t1.value)!="")
{
if(!(confirm(" Apakah tanggal lahir sudah benar ?")))
	{
                wnabiodata.t1.focus();
		return false;
	}

}

if(trim(wnabiodata.num_paspor.value)!="")
{
if(!(confirm(" Apakah Nomor Pasport sudah benar ?")))
	{
                wnabiodata.num_paspor.select();
                wnabiodata.num_paspor.focus();
		return false;
	}

}
if (wnabiodata.agama.options[6].selected==false)
	{
		if(!(confirm(" Apakah pilihan Agama sudah benar?")))
	        {
                wnabiodata.agama.focus();
		return false;
                }
	}


 wnabiodata.action="Create_Nokk.jsp";
 wnabiodata.submit();
 document.all['simbtn'].disabled=true;
}

function ValiBioAgt()
{
if(trim(wnabiodata.nama_klrga.value)=="")
{
 	alert("Nama Kepala Keluarga belum diisi!");
	wnabiodata.nama_klrga.focus();
 	wnabiodata.nama_klrga.select();
 	return false;
}

if(wnabiodata.jenis_klmin.options[0].selected==true)
	{
		alert("Jenis kelamin belum diisi !");
		wnabiodata.jenis_klmin.focus();
		return false;
	}

if(trim(wnabiodata.tmpt_lhr.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !");
 			wnabiodata.tmpt_lhr.select();
			wnabiodata.tmpt_lhr.focus();
			return false;
}
if(trim(wnabiodata.t1.value)=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.t1.select();
	 wnabiodata.t1.focus();
	 return false;
}
if(wnabiodata.t1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali!!!");
	 wnabiodata.t1.value="";
	 wnabiodata.t1.focus();
	 return false;
}
if(wnabiodata.t1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.t1.focus();
			wnabiodata.t1.value="";
			return false

}
if(wnabiodata.t1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t1.value="";
		wnabiodata.t1.focus();
		return false;
}

if(trim(wnabiodata.t2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.t2.value="";
			wnabiodata.t2.focus();
			return false;
}
if(wnabiodata.t2.value=="00")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.t2.value="";
			wnabiodata.t2.focus();
			return false;
}
if(wnabiodata.t2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.t2.focus();
			wnabiodata.t2.select();
			return false

}

if(wnabiodata.t2.value==2)
{
	if (wnabiodata.t1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t1.value="";
		wnabiodata.t1.focus();
		return false;
	}
}

if(wnabiodata.t2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t2.value="";
	wnabiodata.t2.focus();
	return false;
}
if(trim(wnabiodata.t3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.t3.value="";
	wnabiodata.t3.focus();
	return false;

}
if(wnabiodata.t3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.t3.value="";
		wnabiodata.t3.focus();
		return false;
}
var z=new Date();
var y=z.getYear();
var m=z.getMonth();
var d=z.getDay();
var abc=new Date(wnabiodata.t2.value+"/"+wnabiodata.t1.value+"/"+wnabiodata.t3.value);
if(wnabiodata.t3.value<1800 || wnabiodata.t3.value>y)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t3.value="";
		wnabiodata.t3.focus();
		return false;
}
if(abc>z)
{
                alert("Periksa pemasukan kebenaran data Tanggal !!");
                wnabiodata.t3.value="";
                wnabiodata.t2.value=""
                wnabiodata.t1.value=""
		wnabiodata.t1.focus();
		return false;
}

if(trim(wnabiodata.kwrngrn.value)=="")
{
 	alert("Kewarganegaraan belum diisi !");
 	wnabiodata.kwrngrn.select();
	wnabiodata.kwrngrn.focus();
	return false;
}
	if(wnabiodata.agama.options[0].selected==true)
	{
		alert(" Apakah pilihan Jenis Agama belum diisi !");
		wnabiodata.agama.focus();
		return false;
	}


if(wnabiodata.gol_drh.options[0].selected==true)
{
	alert(" Golongan Darah belum diisi !");
	wnabiodata.gol_drh.focus();
	return false;
}

if(wnabiodata.stat_kwn.options[0].selected==true)
{
	alert(" Status Perkawinan belum diisi !");
	wnabiodata.stat_kwn.focus();
	return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==1 || wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3)
{
if(wnabiodata.jenis_klmin.options[1].selected==true)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
                //alert("kk age is "+diff);
                if (diff<17)
                {
                 wnabiodata.stat_kwn.focus();
                 alert("Pendunuk ini masih dibawah usia Perkawinan !");
                 return false;
                }
       }
else if(wnabiodata.jenis_klmin.options[2].selected==true)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
                //alert("kk ee age is "+diff);
                if (diff<14)
                {
wnabiodata.stat_kwn.focus();
                 alert("Pendunuk ini masih dibawah usia Perkawinan !");

                 return false;
                }
       }
}
if(wnabiodata.stat_hbkel.options[0].selected==true)
{
	alert(" Status Hubungan dalam keluarga belum diisi !");
	wnabiodata.stat_hbkel.focus();
	return false;
}

var idx=wnabiodata.stat_hbkel.selectedIndex

if(((parseInt(idx)==3) || (parseInt(idx)==5)) || ((parseInt(idx)==8) || (parseInt(idx)==10)))
{

null;
}
else
{
 if(wnabiodata.jenis_klmin.options[1].selected==true)
	{
  var t3=wnabiodata.t3.value;
  var t2=wnabiodata.t2.value;
  var t1=wnabiodata.t1.value;

  var td=new Date();


		var now=new Date(t3, t2, t1);

                var one_day=1000*60*60*24*365;
                //Calculate difference btw the two dates, and convert to days
                var diff=(Math.ceil(td-now)/one_day);
                //alert("age is "+diff);
                if (diff<17)
                {
                 alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !");
                 wnabiodata.t1.focus();
                 return false;
                }
	}
     else if(wnabiodata.jenis_klmin.options[2].selected==true)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
               //alert("age is in "+diff);
                if (diff<15)
                {

                 alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !");
                 wnabiodata.t1.focus();
                 return false;
                }
	}
}


if(wnabiodata.jenis_klmin.options[wnabiodata.jenis_klmin.selectedIndex].value==1 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
		wnabiodata.stat_hbkel.focus();
		return false;
}

if(wnabiodata.jenis_klmin.options[wnabiodata.jenis_klmin.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
		wnabiodata.stat_hbkel.focus();
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==5)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}

if(wnabiodata.pddk_akh.options[0].selected==true)
{
	alert(" Status Pendidikan Terakhir belum diisi !");
	wnabiodata.pddk_akh.focus();
	return false;
}
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
if((wnabiodata.pddk_akh.options[1].selected == true && diff < 9) ||
(wnabiodata.pddk_akh.options[2].selected == true && diff < 12) ||
(wnabiodata.pddk_akh.options[3].selected == true && diff < 15) ||
(wnabiodata.pddk_akh.options[4].selected == true && diff < 15) ||
(wnabiodata.pddk_akh.options[5].selected == true && diff < 17) ||
(wnabiodata.pddk_akh.options[6].selected == true && diff < 17) ||
(wnabiodata.pddk_akh.options[7].selected == true && diff < 17))
	{       wnabiodata.pddk_akh.focus();
		alert ("Pendidikan Terakhir tidak sesuai dengan usia !.");
		return false;
	}

if(wnabiodata.jenis_pkrjn.options[0].selected==true)
{
	alert(" Status Jenis Pekerjaan  belum diisi !");
	wnabiodata.jenis_pkrjn.focus();
	return false;
}
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value+1;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(Math.ceil(td-now)/(one_day*365));
if((wnabiodata.jenis_pkrjn.options[1].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[2].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[3].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[4].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[5].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[6].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[7].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[8].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[9].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[10].selected == true && diff < 17)||
(wnabiodata.jenis_pkrjn.options[11].selected == true && diff < 17))
	{       wnabiodata.jenis_pkrjn.focus();
		alert ("Umur tidak sesuai dengan Jenis Perkerjaan? !.");
		return false;
	}
if(trim(wnabiodata.datng_dari.value)=="")
{
	 alert("Datang dari belum diisi !");
 	wnabiodata.datng_dari.select();
	wnabiodata.datng_dari.focus();
	return false;
}
if(trim(wnabiodata.tujuan_dtng.value)=="")
{
 	alert("Tujuan Kedatangan belum diisi !");
 	wnabiodata.tujuan_dtng.select();
	wnabiodata.tujuan_dtng.focus();
	return false;
}
if(trim(wnabiodata.num_paspor.value)=="")
{
 	alert("Nomor Paspor belum diisi !");
 	wnabiodata.num_paspor.select();
	 wnabiodata.num_paspor.focus();
 	return false;
}

while (wnabiodata.num_paspor.value.substring(0,1) == ' ')
	{
        wnabiodata.num_paspor.value = wnabiodata.num_paspor.value.substring(1, wnabiodata.num_paspor.length);
	}

	while (wnabiodata.num_paspor.value.substring(wnabiodata.num_paspor.value.length-1,wnabiodata.num_paspor.value.length) == ' ')
 	{
      wnabiodata.num_paspor.value = wnabiodata.num_paspor.value.substring(0, wnabiodata.num_paspor.value.length-1);
	}
var objpassl=new Object();
var tv;
var s=wnabiodata.kk.value;

var r=wnabiodata.num_paspor.value;
//alert("kk valu"+s+"  "+r);
for (tv=2;tv<=s-1;tv++)
{
bc="a"+tv;
objpassl=document.all[bc];
//alert("objval "+objpassl.value+"   "+r);
if(objpassl.value==r.toLowerCase())
{
alert("Pada Keluarga ini nomor Individu ini sudah Ada !!! ");
wnabiodata.num_paspor.select();
wnabiodata.num_paspor.focus();
return false;
}
tv=tv+3;
}

if(trim(wnabiodata.tp1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tp1.select();
	 wnabiodata.tp1.focus();
	 return false;
}
if(wnabiodata.tp1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tp1.select();
	 wnabiodata.tp1.focus();
	 return false;
}
if(wnabiodata.tp1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tp1.focus();
			wnabiodata.tp1.select();
			return false

}
if(wnabiodata.tp1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
}


if(trim(wnabiodata.tp2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}
if(wnabiodata.tp2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}
if(wnabiodata.tp2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tp2.focus();
			wnabiodata.tp2.select();
			return false

}

if(wnabiodata.tp2.value==2)
{
	if (wnabiodata.tp1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
	}
}

if(wnabiodata.tp2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali !!");
	wnabiodata.tp2.select();
	wnabiodata.tp2.focus();
	return false;
}
if(trim(wnabiodata.tp3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tp3.select();
	wnabiodata.tp3.focus();
	return false;

}
if(wnabiodata.tp3.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tp3.select();
	wnabiodata.tp3.focus();
	return false;

}
if(wnabiodata.tp3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}

var z=new Date();
var y=z.getYear();
if(wnabiodata.tp3.value<1800 || wnabiodata.tp3.value>y)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}



if(trim(wnabiodata.tb1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tb1.select();
	 wnabiodata.tb1.focus();
	 return false;
}
if(wnabiodata.tb1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tb1.select();
	 wnabiodata.tb1.focus();
	 return false;
}
if(wnabiodata.tb1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tb1.focus();
			wnabiodata.tb1.select();
			return false

}
if(wnabiodata.tb1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
}


if(trim(wnabiodata.tb2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}
if(wnabiodata.tb2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}
if(wnabiodata.tb2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");;
			wnabiodata.tb2.focus();
			wnabiodata.tb2.select();
			return false

}
if(wnabiodata.tb2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.tb2.select();
	wnabiodata.tb2.focus();
	return false;
}
if(wnabiodata.tb2.value==2)
{
	if (wnabiodata.tb1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
	}
}

if(trim(wnabiodata.tb3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tb3.select();
	wnabiodata.tb3.focus();
	return false;

}
if(wnabiodata.tb3.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tb3.select();
	wnabiodata.tb3.focus();
	return false;

}
if(wnabiodata.tb3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb3.select();
		wnabiodata.tb3.focus();
		return false;
}

if(wnabiodata.dok_imgr.options[0].selected==true)
{
	alert(" Dokumen Imigrasi belum diisi ! ");
	wnabiodata.dok_imgr.focus();
	return false;
}

if(trim(wnabiodata.num_dok.value)=="")
{
 			alert("Nomor Dokumen belum diisi !!!");
                        wnabiodata.num_dok.select();
			wnabiodata.num_dok.focus();
			return false;
}
if(trim(wnabiodata.tmpt_dtbit.value)=="")
{
 			alert("Tempat Diterbitkan belum diisi !!!");
                        wnabiodata.tmpt_dtbit.select();
			wnabiodata.tmpt_dtbit.focus();
			return false;
}
if(trim(wnabiodata.tt1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tt1.select();
	 wnabiodata.tt1.focus();
	 return false;
}
if(wnabiodata.tt1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tt1.select();
	 wnabiodata.tt1.focus();
	 return false;
}
if(wnabiodata.tt1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tt1.focus();
			wnabiodata.tt1.select();
			return false

}
if(wnabiodata.tt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
}


if(trim(wnabiodata.tt2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}
if(wnabiodata.tt2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}
if(wnabiodata.tt2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tt2.focus();
			wnabiodata.tt2.select();
			return false

}

if(wnabiodata.tt2.value==2)
{
	if (wnabiodata.tt1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
	}
}

if(wnabiodata.tt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tt2.select();
	wnabiodata.tt2.focus();
	return false;
}


if(trim(wnabiodata.tt3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tt3.select();
	wnabiodata.tt3.focus();
	return false;

}
if(wnabiodata.tt3.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tt3.select();
	wnabiodata.tt3.focus();
	return false;

}
if(wnabiodata.tt3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt3.select();
		wnabiodata.tt3.focus();
		return false;
}



if(trim(wnabiodata.tl1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.tl1.select();
	 wnabiodata.tl1.focus();
	 return false;
}
if(wnabiodata.tl1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.tl1.select();
	 wnabiodata.tl1.focus();
	 return false;
}
if(wnabiodata.tl1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tl1.focus();
			wnabiodata.tl1.select();
			return false

}
if(wnabiodata.tl1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
}


if(trim(wnabiodata.tl2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}
if(wnabiodata.tl2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}
if(wnabiodata.tl2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tl2.focus();
			wnabiodata.tl2.select();
			return false

}

if(wnabiodata.tl2.value==2)
{
	if (wnabiodata.tl1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
	}
}

if(wnabiodata.tl2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tl2.select();
	wnabiodata.tl2.focus();
	return false;
}


if(trim(wnabiodata.tl3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tl3.select();
	wnabiodata.tl3.focus();
	return false;

}
if(wnabiodata.tl3.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tl3.select();
	wnabiodata.tl3.focus();
	return false;

}
if(wnabiodata.tl3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.tl3.select();
		wnabiodata.tl3.focus();
		return false;
}


if(trim(wnabiodata.tmpt_dtng_pert.value)=="")
{
 	alert("Tempat Kedatangan Pertama belum diisi !");
 	wnabiodata.tmpt_dtng_pert.select();
	wnabiodata.tmpt_dtng_pert.focus();
	return false;
}
if(trim(wnabiodata.ttt1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.ttt1.select();
	 wnabiodata.ttt1.focus();
	 return false;
}
if(wnabiodata.ttt1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.ttt1.select();
	 wnabiodata.ttt1.focus();
	 return false;
}
if(wnabiodata.ttt1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.ttt1.focus();
			wnabiodata.ttt1.select();
			return false

}
if(wnabiodata.ttt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
}


if(trim(wnabiodata.ttt2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}
if(wnabiodata.ttt2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}
if(wnabiodata.ttt2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.ttt2.focus();
			wnabiodata.ttt2.select();
			return false

}
if(wnabiodata.ttt2.value==2)
{
	if (wnabiodata.ttt1.value>29)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
	}
}

if(wnabiodata.ttt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.ttt2.select();
	wnabiodata.ttt2.focus();
	return false;
}


if(trim(wnabiodata.ttt3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.ttt3.select();
	wnabiodata.ttt3.focus();
	return false;

}
if(wnabiodata.ttt3.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.ttt3.select();
	wnabiodata.ttt3.focus();
	return false;

}
if(wnabiodata.ttt3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.ttt3.select();
		wnabiodata.ttt3.focus();
		return false;
}
if(trim(wnabiodata.nama_spsor.value)=="")
{
 	alert("Nama Sponsor belum diisi !");
	wnabiodata.nama_spsor.select();
	wnabiodata.nama_spsor.focus();
	return false;
}
if(wnabiodata.tipe_spsor.options[0].selected==true)
{
	alert(" Tipe Sponsor belum diisi ! ");
	wnabiodata.tipe_spsor.focus();
	return false;
}
if(trim(wnabiodata.alamat_spsor.value)=="")
{
 	alert("Alamat Sponsor belum diisi !");
	wnabiodata.alamat_spsor.select();
	wnabiodata.alamat_spsor.focus();
	return false;
}

if(trim(wnabiodata.t4.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.t4.select();
	 wnabiodata.t4.focus();
	 return false;
}
if(trim(wnabiodata.t4.value)=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.t4.select();
	 wnabiodata.t4.focus();
	 return false;
}
if(wnabiodata.t4.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.t4.focus();
			wnabiodata.t4.select();
			return false

}
if(wnabiodata.t4.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
}


if(trim(wnabiodata.t5.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali  !!!");
                        wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}
if(wnabiodata.t5.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali  !!!");
                        wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}
if(wnabiodata.t5.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.t5.focus();
			wnabiodata.t5.select();
			return false

}

if(wnabiodata.t5.value==2)
{
	if (wnabiodata.t4.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
	}
}

if(wnabiodata.t5.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t5.select();
	wnabiodata.t5.focus();
	return false;
}


if(trim(wnabiodata.t6.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.t6.select();
	wnabiodata.t6.focus();
	return false;

}
if(wnabiodata.t6.value=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.t6.select();
	wnabiodata.t6.focus();
	return false;

}
if(wnabiodata.t6.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t6.select();
		wnabiodata.t6.focus();
		return false;
}
if (!checkBerlaku(document.all['tb1'],document.all['tb2'],document.all['tb3']))
{
         alert(" Tanggal Berakhir Paspor salah !!");
         return false;
}

if(trim(wnabiodata.nama_klrga.value)!="")
{
if(!(confirm(" Apakah Nama Keluarga sudah benar ?")))
	{
                wnabiodata.nama_klrga.focus();
		return false;
	}

}
if(trim(wnabiodata.nama_pertma.value)!="")
{
if(!(confirm(" Apakah Nama pertama sudah benar ?")))
	{
                wnabiodata.nama_pertma.focus();
		return false;
	}
}
if(wnabiodata.jenis_klmin.options[0].selected==false)
{
if(!(confirm(" Apakah pilihan Jenis Kelamin sudah benar ?")))
	{
                wnabiodata.jenis_klmin.focus();
		return false;
	}
}
if(trim(wnabiodata.t1.value)!="")
{
if(!(confirm(" Apakah tanggal lahir sudah benar ?")))
	{
                wnabiodata.t1.focus();
		return false;
	}

}

if(trim(wnabiodata.num_paspor.value)!="")
{
if(!(confirm(" Apakah Nomor Pasport sudah benar ?")))
	{
                wnabiodata.num_paspor.select();
                wnabiodata.num_paspor.focus();
		return false;
	}

}
if(wnabiodata.agama.options[6].selected==false)
	{
		if(!(confirm(" Apakah pilihan Agama sudah benar?")))
	        {
                wnabiodata.agama.focus();
		return false;
                }
	}
 wnabiodata.action="Create_Nik.jsp" ;
 wnabiodata.simbtn.disabled=true;
 wnabiodata.button2.disabled=true;
 wnabiodata.submit();
 document.all['simbtn'].disabled=false;
}




function ValiEdit()
{
if(trim(wnabiodata.nama_klrga.value)=="")
{
 	alert("Nama Kepala Keluarga belum diisi!");
	wnabiodata.nama_klrga.focus();
 	wnabiodata.nama_klrga.select();
 	return false;
}


if(trim(wnabiodata.tmpt_lhr.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !");
 			wnabiodata.tmpt_lhr.select();
			wnabiodata.tmpt_lhr.focus();
			return false;
}


if(trim(wnabiodata.kwrngrn.value)=="")
{
 	alert("Kewarganegaraan belum diisi !");
 	wnabiodata.kwrngrn.select();
	wnabiodata.kwrngrn.focus();
	return false;
}
if(wnabiodata.agama.options[0].selected==true)
	{
		alert(" Apakah pilihan Jenis Agama belum diisi !");
		wnabiodata.agama.focus();
		return false;
	}


if(wnabiodata.gol_drh.options[0].selected==true)
{
	alert(" Golongan Darah belum diisi !");
	wnabiodata.gol_drh.focus();
	return false;
}

if(wnabiodata.stat_kwn.options[0].selected==true)
{
	alert(" Status Perkawinan belum diisi !");
	wnabiodata.stat_kwn.focus();
	return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==1 || wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3)
{


if (wnabiodata.jenis_klmin.value!=0)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
                //alert("kk age is "+diff);
                if (diff<17)
                {
                 wnabiodata.stat_kwn.focus();
                 alert("Pendunuk ini masih dibawah usia Perkawinan !");
                 return false;
                }
       }
else if(wnabiodata.jenis_klmin.value!=0)
	{
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
                //alert("kk ee age is "+diff);
                if (diff<14)
                {
wnabiodata.stat_kwn.focus();
                 alert("Pendunuk ini masih dibawah usia Perkawinan !");

                 return false;
                }
       }
}
if(wnabiodata.stat_hbkel.options[0].selected==true)
{
	alert(" Status Hubungan dalam keluarga belum diisi !");
	wnabiodata.stat_hbkel.focus();
	return false;
}

var idx=wnabiodata.stat_hbkel.selectedIndex

if(((parseInt(idx)==3) || (parseInt(idx)==5)) || ((parseInt(idx)==8) || (parseInt(idx)==10)))
{

null;
}
else
{
  var t3=wnabiodata.t3.value;
  var t2=wnabiodata.t2.value;
  var t1=wnabiodata.t1.value;

  var td=new Date();


		var now=new Date(t3, t2, t1);

                var one_day=1000*60*60*24*365;
                //Calculate difference btw the two dates, and convert to days
                var diff=(Math.ceil(td-now)/one_day);
                //alert("age is "+diff);
                if (diff<17)
                {
                 alert("Status hubungan keluarga yang dipilih tidak sesuai dengan umur !");
                 wnabiodata.t1.focus();
                 return false;
                }
}



if(wnabiodata.jenis_klmin.value==1 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
		wnabiodata.stat_hbkel.focus();
		return false;
}

if(wnabiodata.jenis_klmin.value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
		wnabiodata.stat_hbkel.focus();
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==5)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
wnabiodata.stat_hbkel.focus();
		//wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}

if(wnabiodata.pddk_akh.options[0].selected==true)
{
	alert(" Status Pendidikan Terakhir belum diisi !");
	wnabiodata.pddk_akh.focus();
	return false;
}
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(td-now)/(one_day*365);
if((wnabiodata.pddk_akh.options[1].selected == true && diff < 9) ||
(wnabiodata.pddk_akh.options[2].selected == true && diff < 12) ||
(wnabiodata.pddk_akh.options[3].selected == true && diff < 15) ||
(wnabiodata.pddk_akh.options[4].selected == true && diff < 15) ||
(wnabiodata.pddk_akh.options[5].selected == true && diff < 17) ||
(wnabiodata.pddk_akh.options[6].selected == true && diff < 17) ||
(wnabiodata.pddk_akh.options[7].selected == true && diff < 17))
	{       wnabiodata.pddk_akh.focus();
		alert ("Pendidikan Terakhir tidak sesuai dengan usia !.");
		return false;
	}

if(wnabiodata.jenis_pkrjn.options[0].selected==true)
{
	alert(" Status Jenis Pekerjaan  belum diisi !");
	wnabiodata.jenis_pkrjn.focus();
	return false;
}
var t3=wnabiodata.t3.value;
var t2=wnabiodata.t2.value+1;
var t1=wnabiodata.t1.value;
var td=new Date();
		var now=new Date(t3, t2, t1);
                var one_day=1000*60*60*24
                //Calculate difference btw the two dates, and convert to days
                var diff=Math.ceil(Math.ceil(td-now)/(one_day*365));
if((wnabiodata.jenis_pkrjn.options[1].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[2].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[3].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[4].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[5].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[6].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[7].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[8].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[9].selected == true && diff < 17) ||
(wnabiodata.jenis_pkrjn.options[10].selected == true && diff < 17)||
(wnabiodata.jenis_pkrjn.options[11].selected == true && diff < 17))
	{       wnabiodata.jenis_pkrjn.focus();
		alert ("Umur tidak sesuai dengan Jenis Perkerjaan? !.");
		return false;
	}
if(trim(wnabiodata.datng_dari.value)=="")
{
	 alert("Datang dari belum diisi !");
 	wnabiodata.datng_dari.select();
	wnabiodata.datng_dari.focus();
	return false;
}
if(trim(wnabiodata.tujuan_dtng.value)=="")
{
 	alert("Tujuan Kedatangan belum diisi !");
 	wnabiodata.tujuan_dtng.select();
	wnabiodata.tujuan_dtng.focus();
	return false;
}
if(trim(wnabiodata.num_paspor.value)=="")
{
 	alert("Nomor Paspor belum diisi !");
 	wnabiodata.num_paspor.select();
	 wnabiodata.num_paspor.focus();
 	return false;
}

while (wnabiodata.num_paspor.value.substring(0,1) == ' ')
	{
        wnabiodata.num_paspor.value = wnabiodata.num_paspor.value.substring(1, wnabiodata.num_paspor.length);
	}

	while (wnabiodata.num_paspor.value.substring(wnabiodata.num_paspor.value.length-1,wnabiodata.num_paspor.value.length) == ' ')
 	{
      wnabiodata.num_paspor.value = wnabiodata.num_paspor.value.substring(0, wnabiodata.num_paspor.value.length-1);
	}
var objpassl=new Object();
var tv;
var s=wnabiodata.kk.value;

var r=wnabiodata.num_paspor.value;
//alert("kk valu"+s+"  "+r);
for (tv=2;tv<=s-1;tv++)
{
bc="a"+tv;
objpassl=document.all[bc];
//alert("objval "+objpassl.value+"   "+r);
if(objpassl.value==r.toLowerCase())
{
alert("Pada Keluarga ini nomor Individu ini sudah Ada !!! ");
wnabiodata.num_paspor.select();
wnabiodata.num_paspor.focus();
return false;
}
tv=tv+3;
}

if(trim(wnabiodata.tp1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tp1.select();
	 wnabiodata.tp1.focus();
	 return false;
}
if(trim(wnabiodata.tp1.value)=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tp1.select();
	 wnabiodata.tp1.focus();
	 return false;
}
if(wnabiodata.tp1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tp1.focus();
			wnabiodata.tp1.select();
			return false

}
if(wnabiodata.tp1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
}


if(trim(wnabiodata.tp2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}
if(trim(wnabiodata.tp2.value)=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}
if(wnabiodata.tp2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tp2.focus();
			wnabiodata.tp2.select();
			return false

}

if(wnabiodata.tp2.value==2)
{
	if (wnabiodata.tp1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
	}
}

if(wnabiodata.tp2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali !!");
	wnabiodata.tp2.select();
	wnabiodata.tp2.focus();
	return false;
}
if(trim(wnabiodata.tp3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tp3.select();
	wnabiodata.tp3.focus();
	return false;

}
if(trim(wnabiodata.tp3.value)=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tp3.select();
	wnabiodata.tp3.focus();
	return false;

}
if(wnabiodata.tp3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}

var z=new Date();
var y=z.getYear();
if(wnabiodata.tp3.value<1800 || wnabiodata.tp3.value>y)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}



if(trim(wnabiodata.tb1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tb1.select();
	 wnabiodata.tb1.focus();
	 return false;
}
if(wnabiodata.tb1.value=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tb1.select();
	 wnabiodata.tb1.focus();
	 return false;
}
if(wnabiodata.tb1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tb1.focus();
			wnabiodata.tb1.select();
			return false

}
if(wnabiodata.tb1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
}


if(trim(wnabiodata.tb2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}
if(wnabiodata.tb2.value=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}
if(wnabiodata.tb2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");;
			wnabiodata.tb2.focus();
			wnabiodata.tb2.select();
			return false

}
if(wnabiodata.tb2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.tb2.select();
	wnabiodata.tb2.focus();
	return false;
}
if(wnabiodata.tb2.value==2)
{
	if (wnabiodata.tb1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
	}
}

if(trim(wnabiodata.tb3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tb3.select();
	wnabiodata.tb3.focus();
	return false;

}
if(trim(wnabiodata.tb3.value)=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.tb3.select();
	wnabiodata.tb3.focus();
	return false;

}
if(wnabiodata.tb3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb3.select();
		wnabiodata.tb3.focus();
		return false;
}

if(wnabiodata.dok_imgr.options[0].selected==true)
{
	alert(" Dokumen Imigrasi belum diisi ! ");
	wnabiodata.dok_imgr.focus();
	return false;
}

if(trim(wnabiodata.num_dok.value)=="")
{
 			alert("Nomor Dokumen belum diisi !!!");
                        wnabiodata.num_dok.select();
			wnabiodata.num_dok.focus();
			return false;
}
if(trim(wnabiodata.tmpt_dtbit.value)=="")
{
 			alert("Tempat Diterbitkan belum diisi !!!");
                        wnabiodata.tmpt_dtbit.select();
			wnabiodata.tmpt_dtbit.focus();
			return false;
}
if(trim(wnabiodata.tt1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tt1.select();
	 wnabiodata.tt1.focus();
	 return false;
}
if(trim(wnabiodata.tt1.value)=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali  !!!");
	 wnabiodata.tt1.select();
	 wnabiodata.tt1.focus();
	 return false;
}
if(wnabiodata.tt1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tt1.focus();
			wnabiodata.tt1.select();
			return false

}
if(wnabiodata.tt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
}


if(trim(wnabiodata.tt2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}
if(trim(wnabiodata.tt2.value)=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}
if(wnabiodata.tt2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tt2.focus();
			wnabiodata.tt2.select();
			return false

}

if(wnabiodata.tt2.value==2)
{
	if (wnabiodata.tt1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
	}
}

if(wnabiodata.tt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tt2.select();
	wnabiodata.tt2.focus();
	return false;
}


if(trim(wnabiodata.tt3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tt3.select();
	wnabiodata.tt3.focus();
	return false;

}
if(trim(wnabiodata.tt3.value)=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tt3.select();
	wnabiodata.tt3.focus();
	return false;

}
if(wnabiodata.tt3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt3.select();
		wnabiodata.tt3.focus();
		return false;
}



if(trim(wnabiodata.tl1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.tl1.select();
	 wnabiodata.tl1.focus();
	 return false;
}
if(trim(wnabiodata.tl1.value)=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.tl1.select();
	 wnabiodata.tl1.focus();
	 return false;
}
if(wnabiodata.tl1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.tl1.focus();
			wnabiodata.tl1.select();
			return false

}
if(wnabiodata.tl1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
}


if(trim(wnabiodata.tl2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}
if(trim(wnabiodata.tl2.value)=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}
if(wnabiodata.tl2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.tl2.focus();
			wnabiodata.tl2.select();
			return false

}

if(wnabiodata.tl2.value==2)
{
	if (wnabiodata.tl1.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
	}
}

if(wnabiodata.tl2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tl2.select();
	wnabiodata.tl2.focus();
	return false;
}


if(trim(wnabiodata.tl3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tl3.select();
	wnabiodata.tl3.focus();
	return false;

}
if(trim(wnabiodata.tl3.value)=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali  !!!");
 	wnabiodata.tl3.select();
	wnabiodata.tl3.focus();
	return false;

}
if(wnabiodata.tl3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.tl3.select();
		wnabiodata.tl3.focus();
		return false;
}


if(trim(wnabiodata.tmpt_dtng_pert.value)=="")
{
 	alert("Tempat Kedatangan Pertama belum diisi !");
 	wnabiodata.tmpt_dtng_pert.select();
	wnabiodata.tmpt_dtng_pert.focus();
	return false;
}
if(trim(wnabiodata.ttt1.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.ttt1.select();
	 wnabiodata.ttt1.focus();
	 return false;
}
if(trim(wnabiodata.ttt1.value)=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.ttt1.select();
	 wnabiodata.ttt1.focus();
	 return false;
}
if(wnabiodata.ttt1.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.ttt1.focus();
			wnabiodata.ttt1.select();
			return false

}
if(wnabiodata.ttt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali!!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
}


if(trim(wnabiodata.ttt2.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}
if(trim(wnabiodata.ttt2.value)=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali !!!");
                        wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}
if(wnabiodata.ttt2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.ttt2.focus();
			wnabiodata.ttt2.select();
			return false

}
if(wnabiodata.ttt2.value==2)
{
	if (wnabiodata.ttt1.value>29)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
	}
}

if(wnabiodata.ttt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.ttt2.select();
	wnabiodata.ttt2.focus();
	return false;
}


if(trim(wnabiodata.ttt3.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.ttt3.select();
	wnabiodata.ttt3.focus();
	return false;

}
if(trim(wnabiodata.ttt3.value)=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.ttt3.select();
	wnabiodata.ttt3.focus();
	return false;

}
if(wnabiodata.ttt3.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.ttt3.select();
		wnabiodata.ttt3.focus();
		return false;
}
if(trim(wnabiodata.nama_spsor.value)=="")
{
 	alert("Nama Sponsor belum diisi !");
	wnabiodata.nama_spsor.select();
	wnabiodata.nama_spsor.focus();
	return false;
}
if(wnabiodata.tipe_spsor.options[0].selected==true)
{
	alert(" Tipe Sponsor belum diisi ! ");
	wnabiodata.tipe_spsor.focus();
	return false;
}
if(trim(wnabiodata.alamat_spsor.value)=="")
{
 	alert("Alamat Sponsor belum diisi !");
	wnabiodata.alamat_spsor.select();
	wnabiodata.alamat_spsor.focus();
	return false;
}

/*if(wnabiodata.nrt.value=="")
{
 	alert("RT No belum diisi !");
	wnabiodata.nrt.select();
	wnabiodata.nrt.focus();
	return false;
}
if(wnabiodata.nrt.value.length < 3)
{
	alert("kode RT No 3 digit !!");
	wnabiodata.nrt.select();
	wnabiodata.nrt.focus();
	return false;
}
if(wnabiodata.nrw.value=="")
{
//wnabiodata.nrw.value=0;
}
if(wnabiodata.kpos.value=="")
{
//wnabiodata.kpos.value=0;
}
*/

if(trim(wnabiodata.t4.value)=="")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.t4.select();
	 wnabiodata.t4.focus();
	 return false;
}
if(trim(wnabiodata.t4.value)=="00")
{
 	 alert("Data yang anda isi salah, perbaiki kembali !!!");
	 wnabiodata.t4.select();
	 wnabiodata.t4.focus();
	 return false;
}
if(wnabiodata.t4.value.length < 2)
{
			alert("Pemasukan data Tanggal  2 digit !!");
			wnabiodata.t4.focus();
			wnabiodata.t4.select();
			return false

}
if(wnabiodata.t4.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
}


if(trim(wnabiodata.t5.value)=="")
{
 			alert("Data yang anda isi salah, perbaiki kembali  !!!");
                        wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}
if(trim(wnabiodata.t5.value)=="00")
{
 			alert("Data yang anda isi salah, perbaiki kembali  !!!");
                        wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}
if(wnabiodata.t5.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.t5.focus();
			wnabiodata.t5.select();
			return false

}

if(wnabiodata.t5.value==2)
{
	if (wnabiodata.t4.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
	}
}

if(wnabiodata.t5.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t5.select();
	wnabiodata.t5.focus();
	return false;
}


if(trim(wnabiodata.t6.value)=="")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.t6.select();
	wnabiodata.t6.focus();
	return false;

}
if(trim(wnabiodata.t6.value)=="00")
{
 	alert("Data yang anda isi salah, perbaiki kembali !!!");
 	wnabiodata.t6.select();
	wnabiodata.t6.focus();
	return false;

}
if(wnabiodata.t6.value.length<4)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t6.select();
		wnabiodata.t6.focus();
		return false;
}

if (!checkBerlaku(document.all['tb1'],document.all['tb2'],document.all['tb3']))
{
         alert(" Tanggal Berakhir Paspor salah !!");
         return false;
}


if(trim(wnabiodata.nama_klrga.value)!="")
{
if(!(confirm(" Apakah Nama Keluarga sudah benar ?")))
	{
                wnabiodata.nama_klrga.focus();
		return false;
	}

}
if(trim(wnabiodata.nama_pertma.value)!="")
{
if(!(confirm(" Apakah Nama pertama sudah benar ?")))
	{
                wnabiodata.nama_pertma.focus();
		return false;
	}
}


if(wnabiodata.agama.options[6].selected==false)
	{
		if(!(confirm(" Apakah pilihan Agama sudah benar?")))
	        {
                wnabiodata.agama.focus();
		return false;
                }
	}

 wnabiodata.action="Update_peru_wna.jsp";
 wnabiodata.submit();
 wnabiodata.sim.disabled=false;
 wnabiodata.kel.disabled=false;
return true;
}


function kepa()
{
var nke=wnabiodata.nama_klrga.value;
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.nama_klrga.value.length; i++)
{

   temp = "" + wnabiodata.nama_klrga.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_klrga.value="";
			wnabiodata.nama_klrga.focus();
			return false;
	}
}
wnabiodata.simbtn.disabled=false;
}

function temlhr()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.tmpt_lhr.value.length; i++)
{

   temp = "" + wnabiodata.tmpt_lhr.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_lhr.value="";
			wnabiodata.tmpt_lhr.focus();
			return false;
	}
}
}

function tglhr1()
{
  wnabiodata.t2.value="";
  wnabiodata.t3.value="";

if(isNaN(wnabiodata.t1.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t1.value="";
		wnabiodata.t1.focus();
		return false;
}
for(var i=0; i < wnabiodata.t1.value.length; i++)
{
         if(wnabiodata.t1.value.charAt(i)=="-")
               {
                 alert("Data  Salah, Silahkan Coba Lagi !!" )

                 wnabiodata.t1.value="";
                 wnabiodata.t1.focus();
	         return false;
               }
}

if(wnabiodata.t1.value.length == 2)
{
if(wnabiodata.t1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t1.value="";
		wnabiodata.t1.focus();
		return false;
}
}
if(wnabiodata.t1.value.length==2)
{
wnabiodata.t2.focus()
}
}

/*New Function Revision 03-Apr-2004*/
/*Begin*/
function checkDD(obj1,obj2,obj3)
{
 obj2.value="";
 obj3.value="";

if(isNaN(obj1.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		obj1.value="";
		obj1.focus();
		return false;
}

for(var i=0; i < obj1.value.length; i++)
{
         if(obj1.value.charAt(i)=="-")
               {
                 alert("Data  Salah, Silahkan Coba Lagi !!" )

                 obj1.value="";
                 obj1.focus();
	         return false;
               }
}

if(obj1.value.length == 2)
{
if(obj1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		obj1.value="";
		obj1.focus();
		return false;
}
}

if(obj1.value.length==2)
{
obj2.focus();
}
return true;
}

function checkMM(obj1,obj2,obj3)
{
  obj3.value="";
  var op=obj2.value;

 if(isNaN(obj2.value))
 {
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		obj2.value="";
		obj2.focus();
		return false;
 }

for(var i=0; i < obj2.value.length; i++)
{
         if(obj2.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 obj2.focus();
                 obj2.value="";
	         return false;
            }
}

var pdata=obj2.value

if ((pdata.length==2) && (pdata.value<1))
{
    alert("Data yang anda isi salah, perbaiki kembali!!");
	obj2.value="";
	obj2.focus();
	return false;
}

if(obj2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	obj2.value="";
	obj2.focus();
	return false;
}

if(obj2.value.length==2)
{
obj3.focus();
}
return true;
}


function checkYY(obj1,obj2,obj3,flag)
{

if(obj2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			obj2.value="";
			obj2.select();
			return false

}
if(isNaN(obj3.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		obj3.value="";
		obj3.focus();
		return false;
}

for(var i=0; i < obj3.value.length; i++)
{
         if(obj3.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 obj3.focus();
                 obj3.select();
	         return false;
               }
}

if ((obj3.value.length==4) && (parseInt(obj2.value))>=1 && (trim(flag)=="Y"))
{
var today = new Date();

var year=today.getYear();
var mon=today.getMonth();
var day=today.getDate();

if (year<2000)
{
year=year+1900;
}

var dt1 = new Date(year,mon,day);
var dt2=new Date(obj3.value,obj2.value-1,obj1.value);

if(dt2>dt1)
{
    alert("Tanggal salah !!");
    obj1.value="";
    obj2.value="";
    obj3.value="";
    obj1.focus();
    return false;
}
}

if (!parseMonth(obj1,obj2,obj3))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  obj1.value="";
                  obj2.value="";
                  obj3.value="";
                  obj1.focus();
                  return false;
                }
return true;
}

/*End*/
function tglhr2()
{
 wnabiodata.t3.value="";
 var op=wnabiodata.t2.value;

 if(isNaN(wnabiodata.t2.value))
 {
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t2.value="";
		wnabiodata.t2.focus();
		return false;
 }

for(var i=0; i < wnabiodata.t2.value.length; i++)
{
         if(wnabiodata.t2.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t2.focus();
                 wnabiodata.t2.value="";
	         return false;
            }
}

var pdata=wnabiodata.t2.value

if ((pdata.length==2) && (pdata.value<1))
{
    alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t2.value="";
	wnabiodata.t2.focus();
	return false;
}

if(wnabiodata.t2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t2.value="";
	wnabiodata.t2.focus();
	return false;
}

if(wnabiodata.t2.value.length==2)
{
wnabiodata.t3.focus();
}
}


function tglhr3()
{

if(wnabiodata.t2.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			wnabiodata.t2.value="";
			wnabiodata.t2.select();
			return false

}
if(isNaN(wnabiodata.t3.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t3.value="";
		wnabiodata.t3.focus();
		return false;
}

for(var i=0; i < wnabiodata.t3.value.length; i++)
{
         if(wnabiodata.t3.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t3.focus();
                 wnabiodata.t3.select();
	         return false;
               }
}
if(wnabiodata.t3.value.length==4)
{
var z=new Date();
var y=z.getYear();
var m=z.getMonth();
if(wnabiodata.t3.value<1800 || wnabiodata.t3.value>y)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t3.value="";
		wnabiodata.t3.focus();
		return false;
}
}

if (!parseMonth(wnabiodata.t1,wnabiodata.t2,wnabiodata.t3))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  wnabiodata.t1.value="";
                  wnabiodata.t2.value="";
                  wnabiodata.t3.value="";
                  wnabiodata.t1.focus();
                  return false;
                }
}



function kwar()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.kwrngrn.value.length; i++)
{

   temp = "" + wnabiodata.kwrngrn.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.kwrngrn.value="";
			wnabiodata.kwrngrn.focus();
			return false;
	}
}
}
function aga()
{
if(wnabiodata.agama.options[6].selected==true)
	{
		wnabiodata.agama_lainnya.disabled=false;
		wnabiodata.agama_lainnya.focus();
	}
else if(wnabiodata.agama.options[6].selected==false)
{
wnabiodata.agama_lainnya.value="Lainnya";
wnabiodata.agama_lainnya.disabled=true;
}
}
function stpwn()
{
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
		wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==3 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
		wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
		wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
		wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
if(wnabiodata.stat_kwn.options[wnabiodata.stat_kwn.selectedIndex].value==2 && 	wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==5)
{
		alert("Data Salah, Silahkan Coba Lagi !!");
		wnabiodata.stat_hbkel.options[0].selected=true;
		return false;
}
}
function dadar()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.datng_dari.value.length; i++)
{

   temp = "" + wnabiodata.datng_dari.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.datng_dari.value="";
			wnabiodata.datng_dari.focus();
			return false;
	}
}
}
function tuj()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.tujuan_dtng.value.length; i++)
{

   temp = "" + wnabiodata.tujuan_dtng.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tujuan_dtng.value="";
			wnabiodata.tujuan_dtng.focus();
			return false;
	}
}
}
function nopa()
{
var val = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:.,'/ ";
var temp="";

for(var i = 0; i < wnabiodata.num_paspor.value.length; i++)
{

   temp = "" + wnabiodata.num_paspor.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.num_paspor.value="";
			wnabiodata.num_paspor.focus();
			return false;
	}
}
}
function ctp1()
{
wnabiodata.tp2.value="";
wnabiodata.tp3.value="";

if(isNaN(wnabiodata.tp1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tp1.value="";
		wnabiodata.tp1.focus();
		return false;
}
for(var i=0; i < wnabiodata.tp1.value.length; i++)
{
         if(wnabiodata.tp1.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tp1.focus();
                 wnabiodata.tp1.select();
	         return false;
               }
}
if(wnabiodata.tp1.value.length == 2)
{
if(wnabiodata.tp1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tp1.value="";
		wnabiodata.tp1.focus();
		return false;
}
}
if(wnabiodata.tp1.value.length==2)
{
wnabiodata.tp2.focus();
}
}

function ctp2()
{
wnabiodata.tp3.value="";
if(isNaN(wnabiodata.tp2.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tp2.value="";
		wnabiodata.tp2.focus();
		return false;
}

for(var i=0; i < wnabiodata.tp2.value.length; i++)
{
         if(wnabiodata.tp2.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tp2.focus();
                 wnabiodata.tp2.select();
	         return false;
               }
}
var pdata=wnabiodata.tp2.value

if ((pdata.length==2) && (pdata.value<1))
{
        alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tp2.value="";
	wnabiodata.tp2.focus();
	return false;
}

if(wnabiodata.tp2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tp2.value="";
	wnabiodata.tp2.focus();
	return false;
}

if(wnabiodata.tp2.value.length==2)
{
wnabiodata.tp3.focus();
}
}

function ctp3()
{
if(isNaN(wnabiodata.tp3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tp3.value="";
		wnabiodata.tp3.focus();
		return false;
}

for(var i=0; i < wnabiodata.tp3.value.length; i++)
{
         if(wnabiodata.tp3.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tp3.focus();
                 wnabiodata.tp3.select();
	         return false;
               }
}
if(wnabiodata.tp3.value.length==4)
{
if(wnabiodata.tp3.value<1800 )
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tp3.value="";
		wnabiodata.tp3.focus();
		return false;
}
}
   if (!parseMonth(wnabiodata.tp1,wnabiodata.tp2,wnabiodata.tp3))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  wnabiodata.tp1.value="";
                  wnabiodata.tp2.value="";
                  wnabiodata.tp3.value="";
                  wnabiodata.tp1.focus();
                  return false;
                }


if(wnabiodata.tp3.value.length==4)
{
wnabiodata.tb1.focus();
}
}
function ctb1()
{
  wnabiodata.tb2.value="";
  wnabiodata.tb3.value="";

if(isNaN(wnabiodata.tb1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tb1.value="";
		wnabiodata.tb1.focus();
		return false;
}
for(var i=0; i < wnabiodata.tb1.value.length; i++)
{
         if(wnabiodata.tb1.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tb1.focus();
                 wnabiodata.tb1.select();
	         return false;
               }
}
if(wnabiodata.tb1.value.length == 2)
{
if(wnabiodata.tb1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tb1.value="";
		wnabiodata.tb1.focus();
		return false;
}
}
if(wnabiodata.tb1.value.length==2)
{
wnabiodata.tb2.focus();
}
}

function ctb2()
{
wnabiodata.tb3.value="";

if(isNaN(wnabiodata.tb2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tb2.value="";
		wnabiodata.tb2.focus();
		return false;
}
for(var i=0; i < wnabiodata.tb2.value.length; i++)
{
         if(wnabiodata.tb2.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tb2.focus();
                 wnabiodata.tb2.select();
	         return false;
               }
}

var pdata=wnabiodata.tb2.value

if ((pdata.length==2) && (pdata.value<1))
{
       alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tb2.value="";
	wnabiodata.tb2.focus();
	return false;
}

if(wnabiodata.tb2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tb2.value="";
	wnabiodata.tb2.focus();
	return false;
}

if(wnabiodata.tb2.value.length==2)
{
wnabiodata.tb3.focus();
}
}


function ctb3()
{

if(isNaN(wnabiodata.tb3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tb3.value="";
		wnabiodata.tb3.focus();
		return false;
}
for(var i=0; i < wnabiodata.tb3.value.length; i++)
{
         if(wnabiodata.tb3.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tb3.focus();
                 wnabiodata.tb3.select();
	         return false;
               }
}
if(wnabiodata.tb3.value.length==4)
{

if(wnabiodata.tb3.value<1800 )
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tb3.value="";
		wnabiodata.tb3.focus();
		return false;
}
}
if (!parseMonth(wnabiodata.tb1,wnabiodata.tb2,wnabiodata.tb3))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  wnabiodata.tb1.value="";
                  wnabiodata.tb2.value="";
                  wnabiodata.tb3.value="";
                  wnabiodata.tb1.focus();
                  return false;
                }
}

function numdoc()
{
var val = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.num_dok.value.length; i++)
{

   temp = "" + wnabiodata.num_dok.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.num_dok.value="";
			wnabiodata.num_dok.focus();
			return false;
	}
}
}
function tmbit()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.tmpt_dtbit.value.length; i++)
{

   temp = "" + wnabiodata.tmpt_dtbit.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_dtbit.value="";
			wnabiodata.tmpt_dtbit.focus();
			return false;
	}
}
}
function ctt1()
{
   wnabiodata.tt2.value="";
   kedatangan.tt3.value="";


if(isNaN(wnabiodata.tt1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tt1.value="";
		wnabiodata.tt1.focus();
		return false;
}
for(var i=0; i < wnabiodata.tt1.value.length; i++)
{
         if(wnabiodata.tt1.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tt1.focus();
                 wnabiodata.tt1.select();
	         return false;
               }
}
if(wnabiodata.tt1.value.length == 2)
{
if(wnabiodata.tt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tt1.value="";
		wnabiodata.tt1.focus();
		return false;
}
}
if(wnabiodata.tt1.value.length==2)
{
wnabiodata.tt2.focus();
}
}

function ctt2()
{
 wnabiodata.tt3.value="";

if(isNaN(wnabiodata.tt2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tt2.value="";
		wnabiodata.tt2.focus();
		return false;
}

for(var i=0; i < wnabiodata.tt2.value.length; i++)
{
         if(wnabiodata.tt2.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tt2.focus();
                 wnabiodata.tt2.select();
	         return false;
               }
}
var pdata=wnabiodata.tt2.value
if ((pdata.length==2) && (pdata.value<1))
{
    alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tt2.value="";
	wnabiodata.tt2.focus();
	return false;
}

if(wnabiodata.tt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tt2.value="";
	wnabiodata.tt2.focus();
	return false;
}

if(wnabiodata.tt2.value.length==2)
{
wnabiodata.tt3.focus();
}
}


function ctt3()
{
if(isNaN(wnabiodata.tt3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tt3.value="";
		wnabiodata.tt3.focus();
		return false;
}

for(var i=0; i < wnabiodata.tt3.value.length; i++)
{
         if(wnabiodata.tt3.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tt3.focus();
                 wnabiodata.tt3.select();
	         return false;
               }
}
if(wnabiodata.tt3.value.length==4)
{

if(wnabiodata.tt3.value<1800 )
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tt3.value="";
		wnabiodata.tt3.focus();
		return false;
}
}
if (!parseMonth(wnabiodata.tt1,wnabiodata.tt2,wnabiodata.tt3))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  wnabiodata.tt1.value="";
                  wnabiodata.tt2.value="";
                  wnabiodata.tt3.value="";
                  wnabiodata.tt1.focus();
                  return false;
                }
if(wnabiodata.tt3.value.length==4)
{
wnabiodata.tl1.focus();
}
}

function ctl1()
{
wnabiodata.tl2.value="";
wnabiodata.tl3.value="";

if(isNaN(wnabiodata.tl1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tl1.value="";
		wnabiodata.tl1.focus();
		return false;
}

for(var i=0; i < wnabiodata.tl1.value.length; i++)
{
         if(wnabiodata.tl1.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tl1.focus();
                 wnabiodata.tl1.select();
	         return false;
               }
}
if(wnabiodata.tl1.value.length == 2)
{
if(wnabiodata.tl1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.tl1.value="";
		wnabiodata.tl1.focus();
		return false;
}
}
if(wnabiodata.tl1.value.length==2)
{
wnabiodata.tl2.focus();
}
}

function ctl2()
{
wnabiodata.tl3.value="";

if(isNaN(wnabiodata.tl2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tl2.value="";
		wnabiodata.tl2.focus();
		return false;
}


for(var i=0; i < wnabiodata.tl2.value.length; i++)
{
         if(wnabiodata.tl2.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tl2.focus();
                 wnabiodata.tl2.select();
	         return false;
               }
}

var pdata=wnabiodata.tl2.value
if ((pdata.length==2) && (pdata.value<1))
{
    alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tl2.value="";
	wnabiodata.tl2.focus();
	return false;
}

 if(wnabiodata.tl2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.tl2.value="";
	wnabiodata.tl2.focus();
	return false;
}

if(wnabiodata.tl2.value.length==2)
{
wnabiodata.tl3.focus();
}
}

function ctl3()
{
if(isNaN(wnabiodata.tl3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tl3.value="";
		wnabiodata.tl3.focus();
		return false;
}

for(var i=0; i < wnabiodata.tl3.value.length; i++)
{
         if(wnabiodata.tl3.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tl3.focus();
                 wnabiodata.tl3.select();
	         return false;
               }
}
if(wnabiodata.tl3.value.length==4)
{

if(wnabiodata.tl3.value<1800 )
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tl3.value="";
		wnabiodata.tl3.focus();
		return false;
}
}
if (!parseMonth(wnabiodata.tl1,wnabiodata.tl2,wnabiodata.tl3))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  wnabiodata.tl1.value="";
                  wnabiodata.tl2.value="";
                  wnabiodata.tl3.value="";
                  wnabiodata.tl1.focus();
                  return false;
                }
}

function tdper()
{
var nke=wnabiodata.nama_klrga.value;
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.tmpt_dtng_pert.value.length; i++)
{

   temp = "" + wnabiodata.tmpt_dtng_pert.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_dtng_pert.value="";
			wnabiodata.tmpt_dtng_pert.focus();
			return false;
	}
}
}
function cttt1()
{
wnabiodata.ttt2.value="";
wnabiodata.ttt3.value="";

if(isNaN(wnabiodata.ttt1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.ttt1.value="";
		wnabiodata.ttt1.focus();
		return false;
}

for(var i=0; i < wnabiodata.ttt1.value.length; i++)
{
         if(wnabiodata.ttt1.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.ttt1.focus();
                 wnabiodata.ttt1.select();
	         return false;
               }
}
if(wnabiodata.ttt1.value.length == 2)
{
if(wnabiodata.ttt1.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.ttt1.value="";
		wnabiodata.ttt1.focus();
		return false;
}
}
if(wnabiodata.ttt1.value.length==2)
{
wnabiodata.ttt2.focus();
}
}

function cttt2()
{
wnabiodata.ttt3.value="";

if(isNaN(wnabiodata.ttt2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.ttt2.value="";
		wnabiodata.ttt2.focus();
		return false;
}


for(var i=0; i < wnabiodata.ttt2.value.length; i++)
{
         if(wnabiodata.ttt2.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.ttt2.focus();
                 wnabiodata.ttt2.select();
	         return false;
               }
}

var pdata=wnabiodata.ttt2.value

if ((pdata.length==2) && (pdata.value<1))
{
    alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.ttt2.value="";
	wnabiodata.ttt2.focus();
	return false;
}

 if(wnabiodata.ttt2.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.ttt2.value="";
	wnabiodata.ttt2.focus();
	return false;
}

if(wnabiodata.ttt2.value.length==2)
{
wnabiodata.ttt3.focus();
}
}


function cttt3()
{
if(isNaN(wnabiodata.ttt3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.ttt3.value="";
		wnabiodata.ttt3.focus();
		return false;
}



for(var i=0; i < wnabiodata.ttt3.value.length; i++)
{
         if(wnabiodata.ttt3.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.ttt3.focus();
                 wnabiodata.ttt3.select();
	         return false;
               }
}
if(wnabiodata.ttt3.value.length==4)
{

if(wnabiodata.ttt3.value<1800 )
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.ttt3.value="";
		wnabiodata.ttt3.focus();
		return false;
}
}

if (!parseMonth(wnabiodata.ttt1,wnabiodata.ttt2,wnabiodata.ttt3))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  wnabiodata.ttt1.value="";
                  wnabiodata.ttt2.value="";
                  wnabiodata.ttt3.value="";
                  wnabiodata.ttt1.focus();
                  return false;
                }
}

function numstl()
{
var val = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:.,'/ ";
var temp="";

for(var i = 0; i < wnabiodata.num_stld.value.length; i++)
{

   temp = "" + wnabiodata.num_stld.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.num_stld.value="";
			wnabiodata.num_stld.focus();
			return false;
	}
}
}
function namspr()
{

var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.nama_spsor.value.length; i++)
{

   temp = "" + wnabiodata.nama_spsor.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_spsor.value="";
			wnabiodata.nama_spsor.focus();
			return false;
	}
}
}
function alspr()
{
var val = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(var i = 0; i < wnabiodata.alamat_spsor.value.length; i++)
{

   temp = "" + wnabiodata.alamat_spsor.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.alamat_spsor.value="";
			wnabiodata.alamat_spsor.focus();
			return false;
	}
}
}
function nort()
{
if(isNaN(wnabiodata.nrt.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.nrt.value="";
		wnabiodata.nrt.focus();
		return false;
}
for(var i=0; i < wnabiodata.nrt.value.length; i++)
{
         if(wnabiodata.nrt.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.nrt.focus();
                 wnabiodata.nrt.select();
	         return false;
               }
}
}
function norw()
{
if(isNaN(wnabiodata.nrw.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.nrw.value="";
		wnabiodata.nrw.focus();
		return false;
}

for(var i=0; i < wnabiodata.nrw.value.length; i++)
{
         if(wnabiodata.nrw.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.nrw.focus();
                 wnabiodata.nrw.select();
	         return false;
               }
}
}
function kodpo()
{
if(isNaN(wnabiodata.kpos.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.kpos.value="";
		wnabiodata.kpos.focus();
		return false;
}

for(var i=0; i < wnabiodata.kpos.value.length; i++)
{
         if(wnabiodata.kpos.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.kpos.value="";
                 wnabiodata.kpos.focus();
	         return false;
               }
}
}
function tel()
{
var val = "0123456789()- ";
var temp="";

for(var i = 0; i < wnabiodata.tlp.value.length; i++)
{

   temp = "" + wnabiodata.tlp.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tlp.value="";
			wnabiodata.tlp.focus();
			return false;
	}
}
}
function ct4()
{
wnabiodata.t5.value="";
wnabiodata.t6.value="";

if(isNaN(wnabiodata.t4.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t4.value="";
		wnabiodata.t4.focus();
		return false;
}
for(var i=0; i < wnabiodata.t4.value.length; i++)
{
         if(wnabiodata.t4.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t4.focus();
                 wnabiodata.t4.select();
	         return false;
               }
}
if(wnabiodata.t4.value.length == 2)
{
if(wnabiodata.t4.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		wnabiodata.t4.value="";
		wnabiodata.t4.focus();
		return false;
}
}
if(wnabiodata.t4.value.length==2)
{
wnabiodata.t5.focus();
}
}
function ct5()
{
wnabiodata.t6.value="";

if(isNaN(wnabiodata.t5.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t5.value="";
		wnabiodata.t5.focus();
		return false;
}
for(var i=0; i < wnabiodata.t5.value.length; i++)
{
         if(wnabiodata.t5.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t5.focus();
                 wnabiodata.t5.select();
	         return false;
               }
}

var pdata=wnabiodata.t5.value

if ((pdata.length==2) && (pdata.value<1))
{
    alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t5.value="";
	wnabiodata.t5.focus();
	return false;
}


if(wnabiodata.t5.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	wnabiodata.t5.value="";
	wnabiodata.t5.focus();
	return false;
}

if(wnabiodata.t5.value.length==2)
{
wnabiodata.t6.focus();
}
}

function ct6()
{
if(isNaN(wnabiodata.t6.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t6.value="";
		wnabiodata.t6.focus();
		return false;
}


for(var i=0; i < wnabiodata.t6.value.length; i++)
{
         if(wnabiodata.t6.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t6.focus();
                 wnabiodata.t6.select();
	         return false;
               }
}
if(wnabiodata.t6.value.length==4)
{

if(wnabiodata.t6.value<1800 )
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t6.value="";
		wnabiodata.t6.focus();
		return false;
}
}
if (!parseMonth(wnabiodata.t4,wnabiodata.t5,wnabiodata.t6))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  wnabiodata.t4.value="";
                  wnabiodata.t5.value="";
                  wnabiodata.t6.value="";
                  wnabiodata.t4.focus();
                  return false;
                }
}