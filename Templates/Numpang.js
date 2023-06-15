function nump()
{
var kklama=numpang.no_kk_lama.value;
if (kklama=="")
{
	alert("Kode Nomor Kartu Keluarga Lama belum diisi !");
	numpang.no_kk_lama.focus();
	numpang.no_kk_lama.select();
	return false;
}
if (kklama=="0")
{
	alert("Data Anda Salah, Silahkan Coba Lagi !!");
	numpang.no_kk_lama.focus();
	numpang.no_kk_lama.select();
	return false;
}

var kkYang=numpang.no_kk_tmpt.value;
if (kkYang=="")
{
	alert("Kode Nomor Kartu Kepala Keluarga Yang Ditempati belum diisi !");
	numpang.no_kk_tmpt.focus();
	numpang.no_kk_tmpt.select();
	return false;
}
if (kkYang=="0")
{
	alert("Data Anda Salah, Silahkan Coba Lagi !!");
	numpang.no_kk_tmpt.focus();
	numpang.no_kk_tmpt.select();
	return false;
}
if (kkYang==kklama)
{
	alert("Data Anda Salah, Silahkan Coba Lagi !!");
	numpang.no_kk_tmpt.focus();
	numpang.no_kk_tmpt.select();
	return false;
}

if (numpang.nama_kel.selectedIndex==0)
{
    alert("Kelurahan belum di pilih !");
     numpang.nama_kel.focus();
    return(false);
}

   frmpost();

}


function frmpost()
{
document.forms[0].action="Vali_Numpang.jsp"
document.forms[0].submit();
document.all['btnperiksa'].disabled=true;
return true;
}

function semu()
{
var kklama=numpang.no_kk_lama.value;
if(isNaN(kklama))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		numpang.no_kk_lama.focus();
                numpang.no_kk_lama.select();
	        return false;
	}
for(var i=0; i < kklama.length; i++)
{
         if(kklama.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 numpang.no_kk_lama.focus();
                 numpang.no_kk_lama.select();
	         return false;
               }
}
}
function yung()
{
var kkYang=numpang.no_kk_tmpt.value;
if(isNaN(kkYang))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		numpang.no_kk_tmpt.focus();
                numpang.no_kk_tmpt.select();
	        return false;
	}
for(var i=0; i < kkYang.length; i++)
{
         if(kkYang.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 numpang.no_kk_tmpt.focus();
                 numpang.no_kk_tmpt.select();
	         return false;
               }
}
}