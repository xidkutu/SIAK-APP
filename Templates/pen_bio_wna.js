function nkk_bio()
{
	var val = "0123456789";
	var temp="";
	if(wnabiodata.no_kk2.value=="")
	{
 		alert("Nomor Kartu keluarga belum diisi !");
 		wnabiodata.no_kk2.select();
		wnabiodata.no_kk2.focus();
                return false;
	}
if(wnabiodata.no_kk2.value.charAt(0)=='-')
				{
				alert("Data Anda Salah, Silahkan Coba Lagi !!" );
				wnabiodata.no_kk2.focus();
				wnabiodata.no_kk2.select();
				return false;
				}
 	for (var i=0; i < wnabiodata.no_kk2.value.length; i++)
   {
   if(wnabiodata.no_kk2.value.charAt(i)!=parseInt(wnabiodata.no_kk2.value.charAt(i),10))
				{
				alert("Data Anda Salah, Silahkan Coba Lagi !!" );
				wnabiodata.no_kk2.focus();
				wnabiodata.no_kk2.select();
				return false;
				}
   temp = "" + wnabiodata.no_kk2.value.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.no_kk2.select();
			wnabiodata.no_kk2.focus();
return false;
	}
}

function jen()
{

if(wnabiodata.jenis_klmin.options[0].selected==false)
{
alert(" Apakah pilihan Jenis Kelamin sudah benar ?");
}
else
{
alert("Jenis kelamin belum diisi !");
wnabiodata.jenis_klmin.focus();
return false;
}
}


function aga()
{
if(wnabiodata.agama.options[0].selected==true)
{
alert(" Apakah pilihan Jenis Agama belum diisi !");
wnabiodata.agama.focus();
wnabiodata.agama.select();
return false;
}
else if(wnabiodata.agama.options[6].selected==false)
{
alert("Apakah pilihan Agama sudah benar? ");
wnabiodata.agama_lainnya.disabled=true;
return false;
}
else if(wnabiodata.agama.options[6].selected==true)
{
wnabiodata.agama_lainnya.disabled=false;
wnabiodata.agama_lainnya.focus();
}
}

function da_keim()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

while (wnabiodata.nama_klrga.value.substring(0,1) == ' ')
{
        wnabiodata.nama_klrga.value = wnabiodata.nama_klrga.value.substring(1, wnabiodata.nama_klrga.value.length);
}
while (wnabiodata.nama_klrga.value.substring(wnabiodata.nama_klrga.value.length-1,wnabiodata.nama_klrga.value.length) == ' ')
 {
      wnabiodata.nama_klrga.value = wnabiodata.nama_klrga.value.substring(0, wnabiodata.nama_klrga.value.length-1);
}

if(wnabiodata.nama_klrga.value=="")
{
 alert("Nama Keluarga belum diisi !");
 wnabiodata.nama_klrga.focus();
 wnabiodata.nama_klrga.select();
 return false;
}


 for (var i=0; i < wnabiodata.nama_klrga.value.length; i++)
   {
   if(wnabiodata.nama_klrga.value.charAt(i)==parseInt(wnabiodata.nama_klrga.value.charAt(i),10))
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_klrga.focus();
			wnabiodata.nama_klrga.select();
			return false;
		}
   temp = "" + wnabiodata.nama_klrga.value.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_klrga.select();
			wnabiodata.nama_klrga.focus();
			return false;
	}





var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.nama_pertma.value=="")
{
 alert("Nama Pertama belum disssi !");
 wnabiodata.nama_pertma.select();
wnabiodata.nama_pertma.focus();
return false;
}
while (wnabiodata.nama_pertma.value.substring(0,1) == ' ')
{
        wnabiodata.nama_pertma.value = wnabiodata.nama_pertma.value.substring(1, wnabiodata.nama_pertma.value.length);
}
while (wnabiodata.nama_pertma.value.substring(wnabiodata.nama_pertma.value.length-1,wnabiodata.nama_pertma.value.length) == ' ')
 {
      wnabiodata.nama_pertma.value = wnabiodata.nama_pertma.value.substring(0, wnabiodata.nama_pertma.value.length-1);
}

 for (var i=0; i < wnabiodata.nama_pertma.value.length; i++)
   {

   temp = "" + wnabiodata.nama_pertma.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_pertma.select();
			wnabiodata.nama_pertma.focus();
			return false;
	}
   }
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.tmpt_lhr.value=="")
{
 alert("Apakah Tempat Lahir belum diisi !");
 			wnabiodata.tmpt_lhr.select();
			wnabiodata.tmpt_lhr.focus();
			return false;
}

 for (var i=0; i < wnabiodata.tmpt_lhr.value.length; i++)
   {
   temp = "" + wnabiodata.tmpt_lhr.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_lhr.select();
			wnabiodata.tmpt_lhr.focus();
			return false;
				}
   }
var val = "0123456789";
var temp="";
if(wnabiodata.t1.value=="")
{
 alert("Periksa pemasukan kebenaran data Tanggal !!!");
 wnabiodata.t1.select();
 wnabiodata.t1.focus();
 return false;
}
if(wnabiodata.t1.value.length < 2)
		{
			if (parseInt(wnabiodata.t1.value,10)!= wnabiodata.t1.value)
			{
			alert("Data Anda Salah, Silahkan Coba Lagi !!");
			wnabiodata.t1.focus();
			wnabiodata.t1.select();
			return false;
			}
			else
			{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.t1.focus();
			wnabiodata.t1.select();
			return false
			}

		}
if(wnabiodata.t1.value.charAt(0)=='-')
				{
				alert("Data Anda Salah, Silahkan Coba Lagi !!" );
				wnabiodata.t1.focus();
				wnabiodata.t1.select();
				return false;
				}
 for (var i=0; i < wnabiodata.t1.value.length; i++)
   {
   temp = "" + wnabiodata.t1.value.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.t1.select();
			wnabiodata.t1.focus();
			return false;
	}
	if(wnabiodata.t1.value>31)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t1.select();
			wnabiodata.t1.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.t2.value=="")
{
 alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.t2.select();
			wnabiodata.t2.focus();
			return false;
}
if(wnabiodata.t2.value.length < 2)
		{
			if (parseInt(wnabiodata.t2.value,10)!= wnabiodata.t2.value)
			{
			alert("Data Anda Salah, Silahkan Coba Lagi !!");
			wnabiodata.t2.focus();
			wnabiodata.t2.select();
			return false;
			}
			else
			{
			alert("Data bulan hanya 2 digit !!");
			wnabiodata.t2.focus();
			wnabiodata.t2.select();
			return false
			}

		}



if(wnabiodata.t2.value.charAt(0)=='-')
				{
				alert("Data Anda Salah, Silahkan Coba Lagi !!" );
				wnabiodata.t2.focus();
				wnabiodata.t2.select();
				return false;
				}
 for (var i=0; i < wnabiodata.t2.value.length; i++)
   {
   temp = "" + wnabiodata.t2.value.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.t2.select();
			wnabiodata.t2.focus();
			return false;
	}
	if(wnabiodata.t2.value==2)
	{
	if (wnabiodata.t1.value>28)
	{
	alert("Periksa pemasukan kebenaran data Tanggal !!");
	wnabiodata.t1.select();
			wnabiodata.t1.focus();
			return false;
	}
	}
	if(wnabiodata.t2.value>12)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t2.select();
			wnabiodata.t2.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.t3=="")
{
 alert("Periksa pemasukan kebenaran data Tahun !!!");
 wnabiodata.t3.select();
			wnabiodata.t3.focus();
			return false;

}
else if(wnabiodata.t3.value.length<4)
	{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.t3.select();
			wnabiodata.t3.focus();
			return false;
    }

if(wnabiodata.t3.value.charAt(0)=='-')
				{
				alert("Data Anda Salah, Silahkan Coba Lagi !!" );
				wnabiodata.t3.focus();
				wnabiodata.t3.select();
				return false;
				}
 for (var i=0; i < wnabiodata.t3.value.length; i++)
   {
   temp = "" + wnabiodata.t3.value.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.t3.select();
			wnabiodata.t3.focus();
			return false;
	}
var z=new Date();
var y=z.getYear();
if(wnabiodata.t3.value<1900 || wnabiodata.t3.value>y)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t3.select();
			wnabiodata.t3.focus();
			return false;
    }


var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.kwrngrn.value=="")
{
 alert("Kewarganegaraan belum diisi !");
 wnabiodata.kwrngrn.select();
			wnabiodata.kwrngrn.focus();
			return false;
}

 for (var i=0; i < wnabiodata.kwrngrn.value.length; i++)
   {
   temp = "" + wnabiodata.kwrngrn.value.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.kwrngrn.select();
			wnabiodata.kwrngrn.focus();
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


if(wnabiodata.stat_hbkel.options[0].selected==true)
{
alert(" Status Hubungan dalam keluarga belum diisi !");
wnabiodata.stat_hbkel.focus();
return false;
}

if(wnabiodata.jenis_klmin.options[wnabiodata.jenis_klmin.selectedIndex].value==1 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==3)
{
alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
wnabiodata.stat_hbkel.focus();
return false;
}

if(wnabiodata.jenis_klmin.options[wnabiodata.jenis_klmin.selectedIndex].value==2 && wnabiodata.stat_hbkel.options[wnabiodata.stat_hbkel.selectedIndex].value==2)
{
alert("Pilihan Status Hubungan Dengan, dalam Keluarga tidak cocok dengan jenis kelamin !!");
wnabiodata.stat_hbkel.focus();
return false;
}

if(wnabiodata.pddk_akh.options[0].selected==true)
{
alert(" Status Pendidikan Terakhir belum diisi !");
wnabiodata.pddk_akh.focus();
return false;
}
if(wnabiodata.jenis_pkrjn.options[0].selected==true)
{
alert(" Status Jenis Pekerjaan  belum diisi !");
wnabiodata.jenis_pkrjn.focus();
return false;
}

if(wnabiodata.datng_dari.value=="")
{
 alert("Datang dari belum diisi !");
 wnabiodata.datng_dari.select();
			wnabiodata.datng_dari.focus();
			return false;
}

 for (var i=0; i < wnabiodata.datng_dari.value.length; i++)
   {
   temp = "" + wnabiodata.datng_dari.value.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.datng_dari.select();
			wnabiodata.datng_dari.focus();
			return false;
	}

var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.tujuan_dtng.value=="")
{
 alert("Tujuan Kedatangan belum diisi !");
 wnabiodata.tujuan_dtng.select();
			wnabiodata.tujuan_dtng.focus();
			return false;
}

 for (var i=0; i < wnabiodata.tujuan_dtng.value.length; i++)
   {
   temp = "" + wnabiodata.tujuan_dtng.value.substring(i, i+1);
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tujuan_dtng.select();
			wnabiodata.tujuan_dtng.focus();
			return false;
	}
   }
var val = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-,/";
var temp="";
if(wnabiodata.num_paspor.value=="")
{
 alert("Nomor Paspor belum diisi !");
 wnabiodata.num_paspor.select();
 wnabiodata.num_paspor.focus();
 return false;
}
 for (var i=0; i < wnabiodata.num_paspor.value.length; i++)
   {
   temp = "" + wnabiodata.num_paspor.value.substring(i, i+1);
     if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.num_paspor.select();
			wnabiodata.num_paspor.focus();
			return false;
	}
   }
var objpassl=new Object();
var tv;
var s=wnabiodata.kk.value;
alert(s);
var r=wnabiodata.num_paspor.value;
alert(r);
for (tv=2;tv<=s-1;tv++)
{
bc="a"+tv;
objpassl=document.all[bc];
if(objpassl.value==r)
{
alert("Pada Keluarga ini nomor Individu ini sudah Ada !!! ");
wnabiodata.num_paspor.select();
wnabiodata.num_paspor.focus();
return false;
}
tv=tv+4;
}




var val = "0123456789";
var temp="";
if(wnabiodata.tp1.value=="")
{
 alert("Periksa pemasukan kebenaran data bulan !!!");
 wnabiodata.tp1.select();
 wnabiodata.tp1.focus();
 return false;
}

 for (var i=0; i < wnabiodata.tp1.value.length; i++)
   {
   temp = "" + wnabiodata.tp1.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tp1.select();
			wnabiodata.tp1.focus();
			return false;
	}

   }
	if(wnabiodata.tp1.value>31)
	{
		alert("Periksa pemasukan kebenaran data bulan !!");
		wnabiodata.tp1.select();
			wnabiodata.tp1.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.tp2.value=="")
{
 alert("Periksa pemasukan kebenaran data Tanggal !!!");
 wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}

 for (var i=0; i < wnabiodata.tp2.value.length; i++)
   {
   temp = "" + wnabiodata.tp2.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
	}
   }
	if(wnabiodata.tp1.value>28)
	{
	if (wnabiodata.tp2.value==2)
	{
	alert("Periksa pemasukan kebenaran data Tanggal !!");
	wnabiodata.tp1.select();
			wnabiodata.tp1.focus();
			return false;
	}
	}
	if(wnabiodata.tp2.value>12)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.tp3=="")
{
 alert("Periksa pemasukan kebenaran data Tahun !!!");
wnabiodata.tp3.select();
			wnabiodata.tp3.focus();
			return false;

}
else if(wnabiodata.tp3.value.length<4)
	{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tp3.select();
			wnabiodata.tp3.focus();
			return false;
    }

 for (var i=0; i < wnabiodata.tp3.value.length; i++)
   {
   temp = "" + wnabiodata.tp3.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tp3.select();
			wnabiodata.tp3.focus();
			return false;
	}
   }
var val = "0123456789";
var temp="";
if(wnabiodata.tb1.value=="")
{
 alert("Periksa pemasukan kebenaran data bulan !!!");
 wnabiodata.tb1.select();
 wnabiodata.tb1.focus();
 return false;
}

 for (var i=0; i < wnabiodata.tb1.value.length; i++)
   {
   temp = "" + wnabiodata.tb1.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tb1.select();
			wnabiodata.tb1.focus();
			return false;
	}
   }
	if(wnabiodata.tb1.value>31)
	{
		alert("Periksa pemasukan kebenaran data bulan !!");
		wnabiodata.tb1.select();
			wnabiodata.tp1.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.tb2.value=="")
{
 alert("Periksa pemasukan kebenaran data Tanggal !!!");
 wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}

 for (var i=0; i < wnabiodata.tb2.value.length; i++)
   {
   temp = "" + wnabiodata.tb2.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
	}
   }
	if(wnabiodata.tb1.value>28)
	{
	if (wnabiodata.tb2.value==2)
	{
	alert("Periksa pemasukan kebenaran data Tanggal !!");
	wnabiodata.tb1.select();
			wnabiodata.tb1.focus();
			return false;
	}
	}
	if(wnabiodata.tb2.value>12)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.tb3=="")
{
 alert("Periksa pemasukan kebenaran data Tahun !!!");
 wnabiodata.tb3.select();
			wnabiodata.tb3.focus();
			return false;

}
else if(wnabiodata.tb3.value.length<4)
	{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tb3.select();
			wnabiodata.tb3.focus();
			return false;
    }

 for (var i=0; i < wnabiodata.tp3.value.length; i++)
   {
   temp = "" + wnabiodata.tb3.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tb3.select();
			wnabiodata.tb3.focus();
			return false;
	}

   }
if(wnabiodata.dok_imgr.options[0].selected==true)
{
alert(" Dokumen Imigrasi belum diisi ! ");
wnabiodata.dok_imgr.focus();
return false;
}

var val = "0123456789";
var temp="";
if(wnabiodata.num_dok.value=="")
{
 alert("Nomor Dokumen belum diisi !");
 wnabiodata.num_dok.select();
wnabiodata.num_dok.focus();
return false;
}

var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.tmpt_dtbit.value=="")
{
 alert("Tempat Diterbitkan belum diisi !");
 wnabiodata.tmpt_dtbit.focus();
 wnabiodata.tmpt_dtbit.select();
 return false;
}

 for (var i=0; i < wnabiodata.tmpt_dtbit.value.length; i++)
   {
   temp = "" + wnabiodata.tmpt_dtbit.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_dtbit.select();
			wnabiodata.tmpt_dtbit.focus();
			return false;
	}
   }




var val = "0123456789";
var temp="";
if(wnabiodata.tt1.value=="")
{
 alert("Periksa pemasukan kebenaran data bulan !!!");
 wnabiodata.tt1.select();
 wnabiodata.tt1.focus();
 return false;
}

 for (var i=0; i < wnabiodata.tt1.value.length; i++)
   {
   temp = "" + wnabiodata.tt1.value.substring(i, i+1);
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tt1.select();
			wnabiodata.tt1.focus();
			return false;
	}
   }

	if(wnabiodata.tt1.value>31)
	{
		alert("Periksa pemasukan kebenaran data bulan !!");
		wnabiodata.tt1.select();
			wnabiodata.tt1.focus();
			return false;
        }

var val = "0123456789";
var temp="";
if(wnabiodata.tt2.value=="")
{
 alert("Periksa pemasukan kebenaran data Tanggal !!!");
 wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}

 for (var i=0; i < wnabiodata.tt2.value.length; i++)
   {
   temp = "" + wnabiodata.tt2.value.substring(i, i+1);
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
	}
    }
	if(wnabiodata.tt1.value>28)
	{
	if (wnabiodata.tt2.value==2)
	{
	alert("Periksa pemasukan kebenaran data Tanggal !!");
	wnabiodata.tt1.select();
			wnabiodata.tt1.focus();
			return false;
	}
	}
	if(wnabiodata.tt2.value>12)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.tt3=="")
{
 alert("Periksa pemasukan kebenaran data Tahun !!!");
 wnabiodata.tt3.select();
 wnabiodata.tt3.focus();
 return false;
}
else if(wnabiodata.tt3.value.length<4)
	{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tt3.select();
			wnabiodata.tt3.focus();
			return false;
    }
 for (var i=0; i < wnabiodata.tt3.value.length; i++)
   {
   temp = "" + wnabiodata.tt3.value.substring(i, i+1);
    if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tt3.select();
			wnabiodata.tt3.focus();
			return false;
	}

   }

var val = "0123456789";
var temp="";
if(wnabiodata.tl1.value=="")
{
 alert("Periksa pemasukan kebenaran data bulan !!!");
 wnabiodata.tl1.select();
 wnabiodata.tl1.focus();
 return false;
}
 for (var i=0; i < wnabiodata.tl1.value.length; i++)
   {

   temp = "" + wnabiodata.tl1.value.substring(i, i+1);
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tl1.select();
			wnabiodata.tl1.focus();
			return false;
	}
   }
	if(wnabiodata.tl1.value>31)
	{
		alert("Periksa pemasukan kebenaran data bulan !!");
		wnabiodata.tl1.select();
			wnabiodata.tl1.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.tl2.value=="")
{
 alert("Periksa pemasukan kebenaran data Tanggal !!!");
 wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}

 for (var i=0; i < wnabiodata.tl2.value.length; i++)
   {
   temp = "" + wnabiodata.tl2.value.substring(i, i+1);
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;

	}
}
	if(wnabiodata.tl1.value>28)
	{
	if (wnabiodata.tl2.value==2)
	{
	alert("Periksa pemasukan kebenaran data Tanggal !!");
	wnabiodata.tl1.select();
			wnabiodata.tl1.focus();
			return false;
	}
	}
	if(wnabiodata.tl2.value>12)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.tl3=="")
{
 alert("Periksa pemasukan kebenaran data Tahun !!!");
 wnabiodata.tl3.select();
			wnabiodata.tl3.focus();
			return false;

}
else if(wnabiodata.tl3.value.length<4)
	{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tl3.select();
			wnabiodata.tl3.focus();
			return false;
    }

 for (var i=0; i < wnabiodata.tl3.value.length; i++)
   {
   temp = "" + wnabiodata.tl3.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tl3.select();
			wnabiodata.tl3.focus();
			return false;
	}
   }

var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.tmpt_dtng_pert.value=="")
{
 alert("Tempat Kedatangan Pertama belum diisi !");
 wnabiodata.tmpt_dtng_pert.select();
			wnabiodata.tmpt_dtng_pert.focus();
			return false;
}

 for (var i=0; i < wnabiodata.tmpt_dtng_pert.value.length; i++)
   {
   temp = "" + wnabiodata.tmpt_dtng_pert.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
        {
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_dtng_pert.select();
			wnabiodata.tmpt_dtng_pert.focus();
			return false;
	}
   }


var val = "0123456789";
var temp="";
if(wnabiodata.ttt1.value=="")
{
 alert("Periksa pemasukan kebenaran data bulan !!!");
 wnabiodata.ttt1.select();
 wnabiodata.ttt1.focus();
 return false;
}
 for (var i=0; i < wnabiodata.ttt1.value.length; i++)
   {
   temp = "" + wnabiodata.ttt1.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.ttt1.select();
			wnabiodata.ttt1.focus();
			return false;
	}

    }
	if(wnabiodata.ttt1.value>31)
	{
		alert("Periksa pemasukan kebenaran data bulan !!");
		wnabiodata.ttt1.select();
			wnabiodata.ttt1.focus();
			return false;
    }


var val = "0123456789";
var temp="";
if(wnabiodata.ttt2.value=="")
{
 alert("Periksa pemasukan kebenaran data Tanggal !!!");
 wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}

 for (var i=0; i < wnabiodata.ttt2.value.length; i++)
   {
   temp = "" + wnabiodata.ttt2.value.substring(i, i+1);
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
	}
   }
	if(wnabiodata.ttt1.value>28)
	{
	if (wnabiodata.ttt2.value==2)
	{
	alert("Periksa pemasukan kebenaran data Tanggal !!");
	wnabiodata.ttt1.select();
			wnabiodata.ttt1.focus();
			return false;
	}
	}
	if(wnabiodata.ttt2.value>12)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.ttt3=="")
{
 alert("Periksa pemasukan kebenaran data Tahun !!!");
 wnabiodata.ttt3.select();
			wnabiodata.ttt3.focus();
			return false;

}
else if(wnabiodata.ttt3.value.length<4)
	{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.ttt3.select();
			wnabiodata.ttt3.focus();
			return false;
    }

 for (var i=0; i < wnabiodata.ttt3.value.length; i++)
   {
   temp = "" + wnabiodata.ttt3.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.ttt3.select();
			wnabiodata.ttt3.focus();
			return false;
	}
   }

var val = "0123456789";
var temp="";
 for (var i=0; i < wnabiodata.num_stld.value.length; i++)
   {
   temp = "" + wnabiodata.num_stld.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.num_stld.select();
			wnabiodata.num_stld.focus();
			return false;
	}
   }
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

 for (var i=0; i < wnabiodata.nama_spsor.value.length; i++)
   {
   temp = "" + wnabiodata.nama_spsor.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_spsor.select();
			wnabiodata.nama_spsor.focus();
			return false;
	}
	}

if(wnabiodata.tipe_spsor.options[0].selected==true)
{
alert(" Tipe Sponsor belum diisi ! ");
wnabiodata.tipe_spsor.focus();
return false;
}


var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

 for (var i=0; i < wnabiodata.alamat_spsor.value.length; i++)
   {
   temp = "" + wnabiodata.alamat_spsor.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.alamat_spsor.select();
			wnabiodata.alamat_spsor.focus();
			return false;
	}
   }
var val = "0123456789";
var temp="";
while (wnabiodata.no_rt.value.substring(0,1) == ' ')
{
        wnabiodata.no_rt.value = wnabiodata.no_rt.value.substring(1, wnabiodata.no_rt.length);
}
while (wnabiodata.no_rt.value.substring(wnabiodata.no_rt.value.length-1,wnabiodata.no_rt.value.length) == ' ')
 {
      wnabiodata.no_rt.value = wnabiodata.no_rt.value.substring(0, wnabiodata.no_rt.value.length-1);
}
if(wnabiodata.no_rt .value=="")
{
 alert("RT No belum diisi !");
 wnabiodata.no_rt.select();
wnabiodata.no_rt.focus();
return false;
}
if(wnabiodata.no_rt.value.length < 3)
{
alert("kode RT No 3 digit !!");
wnabiodata.no_rt.select();
wnabiodata.no_rt.focus();
return false;
}

 for (var i=0; i < wnabiodata.no_rt.value.length; i++)
   {
   temp = "" + wnabiodata.no_rt.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.no_rt.select();
		wnabiodata.no_rt.focus();
		return false;

	}
}
var val = "0123456789";
var temp="";
if(wnabiodata.no_rw.value="" && wnabiodata.no_rw.value.length < 3)
{
alert("kode Rw No 3 digit !!");
wnabiodata.no_rw .select();
wnabiodata.no_rw.focus();
return false;
}
 for (var i=0; i < wnabiodata.no_rw.value.length; i++)
   {
   temp = "" + wnabiodata.no_rw.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.no_rw.select();
			wnabiodata.no_rw.focus();
			return false;
	}
   }
var val = "0123456789";
var temp="";
 for (var i=0; i < wnabiodata.kodepos.value.length; i++)
   {
   temp = "" + wnabiodata.kodepos.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.kodepos.select();
			wnabiodata.kodepos.focus();
			return false;
	}
   }
var val = "0123456789";
var temp="";
 for (var i=0; i < wnabiodata.telp.value.length; i++)
   {
   temp = "" + wnabiodata.telp.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.telp.select();
			wnabiodata.telp.focus();
			return false;
	}
   }

var val = "0123456789";
var temp="";
if(wnabiodata.t4.value=="")
{
 alert("Periksa pemasukan kebenaran data bulan !!!");
 wnabiodata.t4.select();
 wnabiodata.t4.focus();
 return false;
}
 for (var i=0; i < wnabiodata.t4.value.length; i++)
   {
   temp = "" + wnabiodata.t4.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.t4.select();
			wnabiodata.t4.focus();
			return false;
	}
   }
	if(wnabiodata.t4.value>31)
	{
		alert("Periksa pemasukan kebenaran data bulan !!");
		wnabiodata.t4.select();
			wnabiodata.t4.focus();
			return false;
    }

var val = "0123456789";
var temp="";

if(wnabiodata.t5.value=="")
{
 alert("Periksa pemasukan kebenaran data Tanggal !!!");
 wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}
 for (var i=0; i < wnabiodata.t5.value.length; i++)
   {
   temp = "" + wnabiodata.t5.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;

	}
}
	if(wnabiodata.t4.value>28)
	{
	if (wnabiodata.t5.value==2)
	{
	alert("Periksa pemasukan kebenaran data Tanggal !!");
	wnabiodata.t4.select();
			wnabiodata.t4.focus();
			return false;
	}
	}
	if(wnabiodata.t5.value>12)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
    }

var val = "0123456789";
var temp="";
if(wnabiodata.t6=="")
{
 alert("Periksa pemasukan kebenaran data Tahun !!!");
 wnabiodata.t6.select();
			wnabiodata.t6.focus();
			return false;

}
else if(wnabiodata.t6.value.length<4)
	{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.t6.select();
			wnabiodata.t6.focus();
			return false;
    }

 for (var i=0; i < wnabiodata.t6.value.length; i++)
   {
   temp = "" + wnabiodata.t6.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.t6.select();
			wnabiodata.t6.focus();
			return false;
	}
   }

var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.nama_din.value=="")
{
 alert("Tempat Diterbitkan belum diisi !");
 wnabiodata.nama_din.focus();
 wnabiodata.nama_din.select();
 return false;
}

 for (var i=0; i < wnabiodata.nama_din.value.length; i++)
   {
   temp = "" + wnabiodata.nama_din.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_din.select();
			wnabiodata.nama_din.focus();
			return false;
	}
   }
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
var temp="";

if(wnabiodata.nama_kep_din.value=="")
{
 alert("Tempat Diterbitkan belum diisi !");
 wnabiodata.nama_kep_din.focus();
 wnabiodata.nama_kep_din.select();
 return false;
}

 for (var i=0; i < wnabiodata.nama_kep_din.value.length; i++)
   {
   temp = "" + wnabiodata.nama_kep_din.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_kep_din.select();
			wnabiodata.nama_kep_din.focus();
			return false;
	}
   }

var val = "0123456789";
var temp="";
if(wnabiodata.nip_din.value=="")
{
 alert("Kode Telepon belum diisi !");
 wnabiodata.nip_din.select();
 wnabiodata.nip_din.focus();
 return false;
}
 for (var i=0; i < wnabiodata.nip_din.value.length; i++)
   {
   temp = "" + wnabiodata.nip_din.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nip_din.select();
			wnabiodata.nip_din.focus();
			return false;
	}
   }
if(wnabiodata.no_rw.value="")
{
//wnabiodata.no_rw.value=0;
}
if(wnabiodata.kodepos.value="")
{
//wnabiodata.kodepos.value=0;
}
if(wnabiodata.telp.value="")
{
//wnabiodata.telp.value=0;
}


}