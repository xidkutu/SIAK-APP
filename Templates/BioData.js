function nkk_bio()
{

if(isNaN(wnabiodata.no_kk2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.no_kk2.select();
		wnabiodata.no_kk2.focus();
		return false;
}

for(var i=0; i < wnabiodata.no_kk2.value.length; i++)
{
         if(wnabiodata.no_kk2.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.no_kk2.focus();
                 wnabiodata.no_kk2.select();
	         return false;
               }
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
if(wnabiodata.nama_klrga.value=="")
{
 	 alert("Nama Keluarga belum diisi !");
	 wnabiodata.nama_klrga.focus();
	 wnabiodata.nama_klrga.select();
	 return false;
}


for (i=0; i < wnabiodata.nama_klrga.value.length; i++)
{
		 if(!((wnabiodata.nama_klrga.value.charAt(i) >= 'A' && wnabiodata.nama_klrga.value.charAt(i) <= 'Z') || 				(wnabiodata.nama_klrga.value.charAt(i) >= 'a' && wnabiodata.nama_klrga.value.charAt(i) 				<= 'z') || (wnabiodata.nama_klrga.value.charAt(i) == ' ')))
		{
		     	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_klrga.focus();
			wnabiodata.nama_klrga.select();
			return false;
		}
}


if(wnabiodata.nama_pertma.value=="")
{
 	alert("Nama Pertama belum disssi !");
 	wnabiodata.nama_pertma.select();
	wnabiodata.nama_pertma.focus();
	return false;
}

for (i=0; i < wnabiodata.nama_pertma.value.length; i++)
{

  if(!((wnabiodata.nama_pertma.value.charAt(i) >= 'A' && wnabiodata.nama_pertma.value.charAt(i) <= 'Z') ||     (wnabiodata.nama_pertma.value.charAt(i) >= 'a' && wnabiodata.nama_pertma.value.charAt(i) 	    <= 'z') || (wnabiodata.nama_pertma.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_pertma.focus();
			wnabiodata.nama_pertma.select();
			return false;
	}

}



if(wnabiodata.tmpt_lhr.value=="")
{
 			alert("Apakah Tempat Lahir belum diisi !");
 			wnabiodata.tmpt_lhr.select();
			wnabiodata.tmpt_lhr.focus();
			return false;
}


for (i=0; i < wnabiodata.tmpt_lhr.value.length; i++)
{

  if(!((wnabiodata.tmpt_lhr.value.charAt(i) >= 'A' && wnabiodata.tmpt_lhr.value.charAt(i) <= 'Z') ||     (wnabiodata.tmpt_lhr.value.charAt(i) >= 'a' && wnabiodata.tmpt_lhr.value.charAt(i) 	    <= 'z') || (wnabiodata.tmpt_lhr.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_lhr.focus();
			wnabiodata.tmpt_lhr.select();
			return false;
	}

}

if(wnabiodata.t1.value=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.t1.select();
	 wnabiodata.t1.focus();
	 return false;
}
if(isNaN(wnabiodata.t1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t1.select();
		wnabiodata.t1.focus();
		return false;
}
for(var i=0; i < wnabiodata.t1.value.length; i++)
{
         if(wnabiodata.t1.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t1.focus();
                 wnabiodata.t1.select();
	         return false;
               }
}

if(wnabiodata.t1.value.length < 2)
{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.t1.focus();
			wnabiodata.t1.select();
			return false

}
if(wnabiodata.t1.value>31)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t1.select();
		wnabiodata.t1.focus();
		return false;
}


if(wnabiodata.t2.value=="")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.t2.select();
			wnabiodata.t2.focus();
			return false;
}

if(isNaN(wnabiodata.t2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t2.select();
		wnabiodata.t2.focus();
		return false;
}

for(var i=0; i < wnabiodata.t2.value.length; i++)
{
         if(wnabiodata.t2.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t2.focus();
                 wnabiodata.t2.select();
	         return false;
               }
}


if(wnabiodata.t2.value.length < 2)
{
			alert("Data Bulan hanya 2 digit !!");
			wnabiodata.t2.focus();
			wnabiodata.t2.select();
			return false

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
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.t2.select();
	wnabiodata.t2.focus();
	return false;
}


if(wnabiodata.t3=="")
{
 	alert("Periksa pemasukan kebenaran data Tahun !!!");
 	wnabiodata.t3.select();
	wnabiodata.t3.focus();
	return false;

}
if(isNaN(wnabiodata.t3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t3.select();
		wnabiodata.t3.focus();
		return false;
}

for(var i=0; i < wnabiodata.t3.value.length; i++)
{
         if(wnabiodata.t3.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.t3.focus();
                 wnabiodata.t3.select();
	         return false;
               }
}

if(wnabiodata.t3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
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

if(wnabiodata.kwrngrn.value=="")
{
 	alert("Kewarganegaraan belum diisi !");
 	wnabiodata.kwrngrn.select();
	wnabiodata.kwrngrn.focus();
	return false;
}

for (i=0; i < wnabiodata.kwrngrn.value.length; i++)
{

  if(!((wnabiodata.kwrngrn.value.charAt(i) >= 'A' && wnabiodata.kwrngrn.value.charAt(i) <= 'Z') ||     (wnabiodata.kwrngrn.value.charAt(i) >= 'a' && wnabiodata.kwrngrn.value.charAt(i)<= 'z') || (wnabiodata.kwrngrn.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.kwrngrn.select();
			wnabiodata.kwrngrn.focus();
			return false;
	}

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


for (i=0; i < wnabiodata.datng_dari.value.length; i++)
{

  if(!((wnabiodata.datng_dari.value.charAt(i) >= 'A' && wnabiodata.datng_dari.value.charAt(i) <= 'Z') ||     (wnabiodata.datng_dari.value.charAt(i) >= 'a' && wnabiodata.datng_dari.value.charAt(i)<= 'z') || (wnabiodata.datng_dari.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.datng_dari.select();
			wnabiodata.datng_dari.focus();
			return false;
	}

}

if(wnabiodata.tujuan_dtng.value=="")
{
 	alert("Tujuan Kedatangan belum diisi !");
 	wnabiodata.tujuan_dtng.select();
	wnabiodata.tujuan_dtng.focus();
	return false;
}

for (i=0; i < wnabiodata.tujuan_dtng.value.length; i++)
{

  if(!((wnabiodata.tujuan_dtng.value.charAt(i) >= 'A' && wnabiodata.tujuan_dtng.value.charAt(i) <= 'Z') ||     (wnabiodata.tujuan_dtng.value.charAt(i) >= 'a' && wnabiodata.tujuan_dtng.value.charAt(i)<= 'z') || (wnabiodata.tujuan_dtng.value.charAt(i) == ' ')))

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

var r=wnabiodata.num_paspor.value;

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


if(wnabiodata.tp1.value=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.tp1.select();
	 wnabiodata.tp1.focus();
	 return false;
}
if(isNaN(wnabiodata.tp1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tp1.select();
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

if(wnabiodata.tp1.value.length < 2)
{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.tp1.focus();
			wnabiodata.tp1.select();
			return false

}
if(wnabiodata.tp1.value>31)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
}


if(wnabiodata.tp2.value=="")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.tp2.select();
			wnabiodata.tp2.focus();
			return false;
}

if(isNaN(wnabiodata.tp2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tp2.select();
		wnabiodata.tp2.focus();
		return false;
}

for(var i=0; i < wnabiodata.tp2.value.length; i++)
{
         if(wnabiodata.tp2.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.tp2.focus();
                 wnabiodata.tp2.select();
	         return false;
               }
}

if(wnabiodata.tp2.value.length < 2)
{
			alert("Data Bulan hanya 2 digit !!");
			wnabiodata.tp2.focus();
			wnabiodata.tp2.select();
			return false

}

if(wnabiodata.tp2.value==2)
{
	if (wnabiodata.tp1.value>28)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tp1.select();
		wnabiodata.tp1.focus();
		return false;
	}
}

if(wnabiodata.tp2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.tp2.select();
	wnabiodata.tp2.focus();
	return false;
}


if(wnabiodata.tp3=="")
{
 	alert("Periksa pemasukan kebenaran data Tahun !!!");
 	wnabiodata.tp3.select();
	wnabiodata.tp3.focus();
	return false;

}
if(isNaN(wnabiodata.tp3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tp3.select();
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

if(wnabiodata.tp3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}

var z=new Date();
var y=z.getYear();
if(wnabiodata.tp3.value<1900 || wnabiodata.tp3.value>y)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tp3.select();
		wnabiodata.tp3.focus();
		return false;
}



if(wnabiodata.tb1.value=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.tb1.select();
	 wnabiodata.tb1.focus();
	 return false;
}
if(isNaN(wnabiodata.tb1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tb1.select();
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

if(wnabiodata.tb1.value.length < 2)
{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.tb1.focus();
			wnabiodata.tb1.select();
			return false

}
if(wnabiodata.tb1.value>31)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
}


if(wnabiodata.tb2.value=="")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.tb2.select();
			wnabiodata.tb2.focus();
			return false;
}

if(isNaN(wnabiodata.tb2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tb2.select();
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

if(wnabiodata.tb2.value.length < 2)
{
			alert("Data Bulan hanya 2 digit !!");
			wnabiodata.tb2.focus();
			wnabiodata.tb2.select();
			return false

}

if(wnabiodata.tb2.value==2)
{
	if (wnabiodata.tb1.value>28)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tb1.select();
		wnabiodata.tb1.focus();
		return false;
	}
}

if(wnabiodata.tb2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.tb2.select();
	wnabiodata.tb2.focus();
	return false;
}


if(wnabiodata.tb3=="")
{
 	alert("Periksa pemasukan kebenaran data Tahun !!!");
 	wnabiodata.tb3.select();
	wnabiodata.tb3.focus();
	return false;

}
if(isNaN(wnabiodata.tb3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tb3.select();
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


if(wnabiodata.tb3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
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

if(wnabiodata.num_dok.value=="")
{
 			alert("Nomor Dokumen belum diisi !!!");
                        wnabiodata.num_dok.select();
			wnabiodata.num_dok.focus();
			return false;
}

if(isNaN(wnabiodata.num_dok.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.num_dok.select();
		wnabiodata.num_dok.focus();
		return false;
}
for(var i=0; i < wnabiodata.num_dok.value.length; i++)
{
         if(wnabiodata.num_dok.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.num_dok.focus();
                 wnabiodata.num_dok.select();
	         return false;
               }
}

if(wnabiodata.tmpt_dtbit.value=="")
{
 			alert("Tempat Diterbitkan belum diisi !!!");
                        wnabiodata.tmpt_dtbit.select();
			wnabiodata.tmpt_dtbit.focus();
			return false;
}
for (i=0; i < wnabiodata.tmpt_dtbit.value.length; i++)
{

  if(!((wnabiodata.tmpt_dtbit.value.charAt(i) >= 'A' && wnabiodata.tmpt_dtbit.value.charAt(i) <= 'Z') ||     (wnabiodata.tmpt_dtbit.value.charAt(i) >= 'a' && wnabiodata.tmpt_dtbit.value.charAt(i)<= 'z') || (wnabiodata.tmpt_dtbit.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_dtbit.select();
			wnabiodata.tmpt_dtbit.focus();
			return false;
	}

}



if(wnabiodata.tt1.value=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.tt1.select();
	 wnabiodata.tt1.focus();
	 return false;
}
if(isNaN(wnabiodata.tt1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tt1.select();
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

if(wnabiodata.tt1.value.length < 2)
{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.tt1.focus();
			wnabiodata.tt1.select();
			return false

}
if(wnabiodata.tt1.value>31)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
}


if(wnabiodata.tt2.value=="")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.tt2.select();
			wnabiodata.tt2.focus();
			return false;
}

if(isNaN(wnabiodata.tt2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tt2.select();
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


if(wnabiodata.tt2.value.length < 2)
{
			alert("Data Bulan hanya 2 digit !!");
			wnabiodata.tt2.focus();
			wnabiodata.tt2.select();
			return false

}

if(wnabiodata.tt2.value==2)
{
	if (wnabiodata.tt1.value>28)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tt1.select();
		wnabiodata.tt1.focus();
		return false;
	}
}

if(wnabiodata.tt2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.tt2.select();
	wnabiodata.tt2.focus();
	return false;
}


if(wnabiodata.tt3=="")
{
 	alert("Periksa pemasukan kebenaran data Tahun !!!");
 	wnabiodata.tt3.select();
	wnabiodata.tt3.focus();
	return false;

}
if(isNaN(wnabiodata.tt3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tt3.select();
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
if(wnabiodata.tt3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tt3.select();
		wnabiodata.tt3.focus();
		return false;
}



if(wnabiodata.tl1.value=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.tl1.select();
	 wnabiodata.tl1.focus();
	 return false;
}
if(isNaN(wnabiodata.tl1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tl1.select();
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
if(wnabiodata.tl1.value.length < 2)
{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.tl1.focus();
			wnabiodata.tl1.select();
			return false

}
if(wnabiodata.tl1.value>31)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
}


if(wnabiodata.tl2.value=="")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.tl2.select();
			wnabiodata.tl2.focus();
			return false;
}

if(isNaN(wnabiodata.tl2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tl2.select();
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

if(wnabiodata.tl2.value.length < 2)
{
			alert("Data Bulan hanya 2 digit !!");
			wnabiodata.tl2.focus();
			wnabiodata.tl2.select();
			return false

}

if(wnabiodata.tl2.value==2)
{
	if (wnabiodata.tl1.value>28)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.tl1.select();
		wnabiodata.tl1.focus();
		return false;
	}
}

if(wnabiodata.tl2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.tl2.select();
	wnabiodata.tl2.focus();
	return false;
}


if(wnabiodata.tl3=="")
{
 	alert("Periksa pemasukan kebenaran data Tahun !!!");
 	wnabiodata.tl3.select();
	wnabiodata.tl3.focus();
	return false;

}
if(isNaN(wnabiodata.tl3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.tl3.select();
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


if(wnabiodata.tl3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.tl3.select();
		wnabiodata.tl3.focus();
		return false;
}


if(wnabiodata.tmpt_dtng_pert.value=="")
{
 	alert("Tempat Kedatangan Pertama belum diisi !");
 	wnabiodata.tmpt_dtng_pert.select();
	wnabiodata.tmpt_dtng_pert.focus();
	return false;
}

for (i=0; i < wnabiodata.tmpt_dtng_pert.value.length; i++)
{

  if(!((wnabiodata.tmpt_dtng_pert.value.charAt(i) >= 'A' && wnabiodata.tmpt_dtng_pert.value.charAt(i) <= 'Z') ||     (wnabiodata.tmpt_dtng_pert.value.charAt(i) >= 'a' && wnabiodata.tmpt_dtng_pert.value.charAt(i)<= 'z') || (wnabiodata.tmpt_dtng_pert.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.tmpt_dtng_pert.select();
			wnabiodata.tmpt_dtng_pert.focus();
			return false;
	}

}



if(wnabiodata.ttt1.value=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.ttt1.select();
	 wnabiodata.ttt1.focus();
	 return false;
}
if(isNaN(wnabiodata.ttt1.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.ttt1.select();
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
if(wnabiodata.ttt1.value.length < 2)
{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.ttt1.focus();
			wnabiodata.ttt1.select();
			return false

}
if(wnabiodata.ttt1.value>31)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
}


if(wnabiodata.ttt2.value=="")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.ttt2.select();
			wnabiodata.ttt2.focus();
			return false;
}

if(isNaN(wnabiodata.ttt2.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.ttt2.select();
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
if(wnabiodata.ttt2.value.length < 2)
{
			alert("Data Bulan hanya 2 digit !!");
			wnabiodata.ttt2.focus();
			wnabiodata.ttt2.select();
			return false

}

if(wnabiodata.ttt2.value==2)
{
	if (wnabiodata.ttt1.value>28)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.ttt1.select();
		wnabiodata.ttt1.focus();
		return false;
	}
}

if(wnabiodata.ttt2.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.ttt2.select();
	wnabiodata.ttt2.focus();
	return false;
}


if(wnabiodata.ttt3=="")
{
 	alert("Periksa pemasukan kebenaran data Tahun !!!");
 	wnabiodata.ttt3.select();
	wnabiodata.ttt3.focus();
	return false;

}
if(isNaN(wnabiodata.ttt3.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.ttt3.select();
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
if(wnabiodata.ttt3.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.ttt3.select();
		wnabiodata.ttt3.focus();
		return false;
}

if(isNaN(wnabiodata.num_stld.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.num_stld.select();
		wnabiodata.num_stld.focus();
		return false;
}

for(var i=0; i < wnabiodata.num_stld.value.length; i++)
{
         if(wnabiodata.num_stld.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.num_stld.focus();
                 wnabiodata.num_stld.select();
	         return false;
               }
}

if(wnabiodata.nama_spsor.value=="")
{
 	alert("Nama Sponsor belum diisi !");
	wnabiodata.nama_spsor.select();
	wnabiodata.nama_spsor.focus();
	return false;
}
for (i=0; i < wnabiodata.nama_spsor.value.length; i++)
{

  if(!((wnabiodata.nama_spsor.value.charAt(i) >= 'A' && wnabiodata.nama_spsor.value.charAt(i) <= 'Z') ||     (wnabiodata.nama_spsor.value.charAt(i) >= 'a' && wnabiodata.nama_spsor.value.charAt(i)<= 'z') || (wnabiodata.nama_spsor.value.charAt(i) == ' ')))

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
if(wnabiodata.alamat_spsor.value=="")
{
 	alert("Alamat Sponsor belum diisi !");
	wnabiodata.alamat_spsor.select();
	wnabiodata.alamat_spsor.focus();
	return false;
}
for (i=0; i < wnabiodata.alamat_spsor.value.length; i++)
{

  if(!((wnabiodata.alamat_spsor.value.charAt(i) >= 'A' && wnabiodata.alamat_spsor.value.charAt(i) <= 'Z') ||     (wnabiodata.alamat_spsor.value.charAt(i) >= 'a' && wnabiodata.alamat_spsor.value.charAt(i)<= 'z') || (wnabiodata.alamat_spsor.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.alamat_spsor.select();
			wnabiodata.alamat_spsor.focus();
			return false;
	}

}


if(wnabiodata.no_rt .value=="")
{
 	alert("RT No belum diisi !");
	wnabiodata.no_rt.select();
	wnabiodata.no_rt.focus();
	return false;
}

if(isNaN(wnabiodata.no_rt.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.no_rt.select();
		wnabiodata.no_rt.focus();
		return false;
}
for(var i=0; i < wnabiodata.no_rt.value.length; i++)
{
         if(wnabiodata.no_rt.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.no_rt.focus();
                 wnabiodata.no_rt.select();
	         return false;
               }
}


if(wnabiodata.no_rt.value.length < 3)
{
	alert("kode RT No 3 digit !!");
	wnabiodata.no_rt.select();
	wnabiodata.no_rt.focus();
	return false;
}


if(isNaN(wnabiodata.no_rw.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.no_rw.select();
		wnabiodata.no_rw.focus();
		return false;
}

for(var i=0; i < wnabiodata.no_rw.value.length; i++)
{
         if(wnabiodata.no_rw.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.no_rw.focus();
                 wnabiodata.no_rw.select();
	         return false;
               }
}

if(isNaN(wnabiodata.kodepos.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.kodepos.select();
		wnabiodata.kodepos.focus();
		return false;
}

for(var i=0; i < wnabiodata.kodepos.value.length; i++)
{
         if(wnabiodata.kodepos.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.kodepos.focus();
                 wnabiodata.kodepos.select();
	         return false;
               }
}

if(isNaN(wnabiodata.telp.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.telp.select();
		wnabiodata.telp.focus();
		return false;
}

for(var i=0; i < wnabiodata.telp.value.length; i++)
{
         if(wnabiodata.telp.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.telp.focus();
                 wnabiodata.telp.select();
	         return false;
               }
}
if(wnabiodata.t4.value=="")
{
 	 alert("Periksa pemasukan kebenaran data Tanggal !!!");
	 wnabiodata.t4.select();
	 wnabiodata.t4.focus();
	 return false;
}
if(isNaN(wnabiodata.t4.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t4.select();
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

if(wnabiodata.t4.value.length < 2)
{
			alert("Data Tanggal hanya 2 digit !!");
			wnabiodata.t4.focus();
			wnabiodata.t4.select();
			return false

}
if(wnabiodata.t4.value>31)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
}


if(wnabiodata.t5.value=="")
{
 			alert("Periksa pemasukan kebenaran data bulan !!!");
                        wnabiodata.t5.select();
			wnabiodata.t5.focus();
			return false;
}

if(isNaN(wnabiodata.t5.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t5.select();
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

if(wnabiodata.t5.value.length < 2)
{
			alert("Data Bulan hanya 2 digit !!");
			wnabiodata.t5.focus();
			wnabiodata.t5.select();
			return false

}

if(wnabiodata.t5.value==2)
{
	if (wnabiodata.t4.value>28)
	{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		wnabiodata.t4.select();
		wnabiodata.t4.focus();
		return false;
	}
}

if(wnabiodata.t5.value>12)
{
	alert("Periksa pemasukan kebenaran data bulan !!");
	wnabiodata.t5.select();
	wnabiodata.t5.focus();
	return false;
}


if(wnabiodata.t6.value=="")
{
 	alert("Periksa pemasukan kebenaran data Tahun !!!");
 	wnabiodata.t6.select();
	wnabiodata.t6.focus();
	return false;

}

if(isNaN(wnabiodata.t6.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.t6.select();
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
if(wnabiodata.t6.value.length<4)
{
		alert("Periksa pemasukan kebenaran data Tahun !!");
		wnabiodata.t6.select();
		wnabiodata.t6.focus();
		return false;
}

if(wnabiodata.nama_din.value=="")
{
 	alert("Nama Dinas/Kantor belum diisi !!!");
 	wnabiodata.nama_din.select();
	wnabiodata.nama_din.focus();
	return false;

}

for (i=0; i < wnabiodata.nama_din.value.length; i++)
{

  if(!((wnabiodata.nama_din.value.charAt(i) >= 'A' && wnabiodata.nama_din.value.charAt(i) <= 'Z') ||     (wnabiodata.nama_din.value.charAt(i) >= 'a' && wnabiodata.nama_din.value.charAt(i)<= 'z') || (wnabiodata.nama_din.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_din.select();
			wnabiodata.nama_din.focus();
			return false;
	}

}

if(wnabiodata.nama_kep_din.value=="")
{
 	alert("Nama Kepala Dinas/Kantor belum diisi !!!");
 	wnabiodata.nama_kep_din.select();
	wnabiodata.nama_kep_din.focus();
	return false;

}
for (i=0; i < wnabiodata.nama_kep_din.value.length; i++)
{

  if(!((wnabiodata.nama_kep_din.value.charAt(i) >= 'A' && wnabiodata.nama_kep_din.value.charAt(i) <= 'Z') ||     (wnabiodata.nama_kep_din.value.charAt(i) >= 'a' && wnabiodata.nama_kep_din.value.charAt(i)<= 'z') || (wnabiodata.nama_kep_dinn.value.charAt(i) == ' ')))

	{
		   	alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			wnabiodata.nama_kep_din.select();
			wnabiodata.nama_kep_din.focus();
			return false;
	}

}
if(wnabiodata.nip_din.value=="")
{
 	alert("NIP Kepala Dinas/Kantor belum diisi !!!");
 	wnabiodata.nip_din.select();
	wnabiodata.nip_din.focus();
	return false;

}

if(isNaN(wnabiodata.nip_din.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		wnabiodata.nip_din.select();
		wnabiodata.nip_din.focus();
		return false;
}
for(var i=0; i < wnabiodata.nip_din.value.length; i++)
{
         if(wnabiodata.nip_din.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 wnabiodata.nip_din.focus();
                 wnabiodata.nip_din.select();
	         return false;
               }
}
if(wnabiodata.no_rw.value=="")
{
//wnabiodata.no_rw.value=0;
}
if(wnabiodata.kodepos.value=="")
{
//wnabiodata.kodepos.value=0;
}
if(wnabiodata.telp.value=="")
{
//wnabiodata.telp.value=0;
}

}