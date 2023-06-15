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

if (document.all['source'].value=="WNI")
{
   if (document.all['nama_kel'].selectedIndex==0)
      {
   alert("Kode Nama Kelurahan belum di pilih !");
   return false;
      }
}
if (document.all['source'].value=="WNA")
 {
if (document.all['nama_kec'].selectedIndex==0)
  {
     alert("Kode Nama Kecamatan belum di pilih !");
    document.all['nama_kec'].focus();
    return(false);
  }
if (document.all['nama_kel'].selectedIndex==0)
  {
     alert("Kode Nama Kelurahan belum di pilih !");
    document.all['nama_kel'].focus();
    return(false);
  }
 }
return true;
}

function startPost(frm)
{
     if (nump())
            {
              frm.action= "NumpangWna_Valid.jsp";
  if (trim(document.all['source'].value)=="WNA")
         {
document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].value=document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].text;
         }
             frm.submit22.disabled=true;
             frm.klbtn.disabled=true;
             frm.submit();
           }
      return true;
}

function semu()
{
var kklama=numpang.no_kk_lama.value;
if(isNaN(kklama))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		numpang.no_kk_lama.value="";
                numpang.no_kk_lama.focus();
	        return false;
	}
for(var i=0; i < kklama.length; i++)
{
         if(kklama.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 numpang.no_kk_lama.value="";
                 numpang.no_kk_lama.focus();
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
		numpang.no_kk_tmpt.value="";
                numpang.no_kk_tmpt.focus();
	        return false;
	}
for(var i=0; i < kkYang.length; i++)
{
         if(kkYang.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 numpang.no_kk_tmpt.value="";
                 numpang.no_kk_tmpt.focus();
	         return false;
               }
}
}
