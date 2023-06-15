function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}


function n_kap()
{
while (datakelu.nama_kep.value.substring(0,1) == ' ')
	{
        datakelu.nama_kep.value = datakelu.nama_kep.value.substring(1, datakelu.nama_kep.length);
	}

	while (datakelu.nama_kep.value.substring(datakelu.nama_kep.value.length-1,datakelu.nama_kep.value.length) == ' ')
 	{
      datakelu.nama_kep.value = datakelu.nama_kep.value.substring(0, datakelu.nama_kep.value.length-1);
	}

if(trim(datakelu.nama_kep.value)=="")
{
 	alert("Nama Kepala Keluarga belum diisi!");
	datakelu.nama_kep.focus();
 	datakelu.nama_kep.select();
 	return false;
}
while (datakelu.alamat.value.substring(0,1) == ' ')
	{
        datakelu.alamat.value = datakelu.alamat.value.substring(1, datakelu.alamat.length);
	}

	while (datakelu.alamat.value.substring(datakelu.alamat.value.length-1,datakelu.alamat.value.length) == ' ')
 	{
      datakelu.alamat.value = datakelu.alamat.value.substring(0, datakelu.alamat.value.length-1);
	}

if(trim(datakelu.alamat.value)=="")
{
	alert("Alamat belum diisi !");
	datakelu.alamat.focus();
	datakelu.alamat.select();
	return false;
}

if(trim(datakelu.no_prop.value)=="")
{
                        alert("Kode Nama Provinsi Belum Diisi !!");
                        datakelu.no_prop.focus();
   		         return false;
}

if(trim(datakelu.no_kab.value)=="")
{
                        alert("Kode Nama Kabupaten Belum Diisi !!");
                        datakelu.no_kab.focus();
			return false;

}
if(trim(datakelu.no_kec.value)=="")
{
                         alert("Kode Nama Kecamatan Belum Diisi !!");
                         datakelu.no_kec.focus();
			return false;

}
if(trim(datakelu.no_kel.value)=="")
{

                         alert("Kode Nama Desa/Kelurahan Belum Diisi !!");
                        datakelu.no_kel.focus();
			return false;

}

if(!(confirm("Nama Kepala Keluarga : "+ datakelu.nama_kep.value+ "\n\nAlamat : "+datakelu.alamat.value+/*"\n\nNo RT: "+datakelu.no_rt.value+*/" \n\n\n Apakah Data ini sudah benar ?")))
{
datakelu.nama_kep.focus();
return false;
}
}
function kepa()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,:.,' ";
var temp="";

for(i = 0; i < datakelu.nama_kep.value.length; i++)
{

   temp = "" + datakelu.nama_kep.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			datakelu.nama_kep.focus();
			datakelu.nama_kep.select();
			return false;
	}
}
datakelu.ENT.disabled=false;
}
function alam()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,-/:.' ";
var temp="";



   for (var i=0; i < datakelu.alamat.value.length; i++)
   {

	      temp = "" + datakelu.alamat.value.substring(i, i+1);

   		if(val.indexOf(temp) == "-1")
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			datakelu.alamat.value="";
			datakelu.alamat.focus();

           return false;
		}
	}


}
function rt()
{
var val = "0123456789";
var temp="";


for (var i=0; i < datakelu.no_rt.value.length; i++)
   {
   		temp = "" + datakelu.no_rt.value.substring(i, i+1);

   		if(val.indexOf(temp) == "-1")
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			datakelu.no_rt.focus();
			datakelu.no_rt.select();
			return false;
		}
	}
}
function rw()
{
var val = "0123456789";
var temp="";
	while (datakelu.no_rw.value.substring(0,1) == ' ')
	{
        datakelu.no_rw.value = datakelu.no_rw.value.substring(1, datakelu.no_rw.length);
	}

	while (datakelu.no_rw.value.substring(datakelu.no_rw.value.length-1,datakelu.no_rw.value.length) == ' ')
 	{
      datakelu.no_rw.value = datakelu.no_rw.value.substring(0, datakelu.no_rw.value.length-1);
	}

for (var i=0; i < datakelu.no_rw.value.length; i++)
{
   temp = "" + datakelu.no_rw.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			datakelu.no_rw.value="";
			datakelu.no_rw.focus();
			return false;
	}
}

if(datakelu.no_rw.value.length <3)
{
	alert("No RW 3 digit !!");
	datakelu.no_rw.value="";
	datakelu.no_rw.focus();
	return false;
}

}
function dus()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .,':; ";
var temp="";


for(i = 0; i < datakelu.dusun.value.length; i++)
{

   temp = "" + datakelu.dusun.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			datakelu.dusun.value="";
			datakelu.dusun.focus();
			return false;
	}
}
}
function kod()
{

var val = "0123456789";
var temp="";
while (datakelu.kodepos.value.substring(0,1) == ' ')
{
        datakelu.kodepos.value = datakelu.kodepos.value.substring(1, datakelu.kodepos.length);
}
while (datakelu.kodepos.value.substring(datakelu.kodepos.value.length-1,datakelu.kodepos.value.length) == ' ')
 {
      datakelu.kodepos.value = datakelu.kodepos.value.substring(0, datakelu.kodepos.value.length-1);
}



for (var i=0; i < datakelu.kodepos.value.length; i++)
{
   temp = "" + datakelu.kodepos.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			datakelu.kodepos.value="";
			datakelu.kodepos.focus();
			return false;
	}

}

if(datakelu.kodepos.value.length<5)
{
	alert("No Kode Pos 5 digit !!");
	datakelu.kodepos.value="";
	datakelu.kodepos.focus();
	return false;
}
}


function tel()
{
var val = "0123456789 ()-:;";
var temp="";



for (var i=0; i < datakelu.telp.value.length; i++)
{
   temp = "" + datakelu.telp.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			datakelu.telp.value="";
			datakelu.telp.focus();
			return false;

	}
}
}
function c()
{
if(confirm("Apakah benar anda akan keluar?? data keluarga(NO. KK) akan terhapus"))
{
 document.location='WNA_Menu.jsp';
}
}
