function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}


function wna()
{
var kksemula=sudapunyawna.no_kk_semula.value;
if (trim(kksemula)=="")
{
	alert("Kode Nomor Kartu Keluarga Semula belum diisi !");
	sudapunyawna.no_kk_semula.focus();
	sudapunyawna.no_kk_semula.select();
	return false;
}
if (trim(kksemula) == "0")
{
	alert("Kode Nomor Kartu Keluarga Semula belum diisi !");
	sudapunyawna.no_kk_semula.value="";
	sudapunyawna.no_kk_semula.focus();
	return false;
}

if (parseInt(trim(kksemula).length,10) != 16)
{
	alert("Kode Nomor Kartu Keluarga harus 16 digit !");
	sudapunyawna.no_kk_semula.focus();
	return false;
}
if (document.all['source'].value=="WNA")
 {
if (sudapunyawna.nama_kec.selectedIndex==0)
  {
     alert("Kode Nama Kecamatan belum di pilih !");
    sudapunyawna.nama_kec.focus();
    return(false);
  }
if (sudapunyawna.nama_kel.selectedIndex==0)
  {
     alert("Kode Nama Kelurahan belum di pilih !");
    sudapunyawna.nama_kel.focus();
    return(false);
  }
 }

if (document.all['source'].value=="WNI")
{
 if (sudapunyawna.nama_kel.selectedIndex==0)
  {
     alert("Kode Nama Kelurahan belum di pilih !");
    sudapunyawna.nama_kel.focus();
    return(false);
  }
}
return true;
}

function startSubmit(frm)
{
  if (wna())
     {
  frm.action="Keluarga_Wna.jsp"

    if (trim(document.all['source'].value)=="WNA")
         {
document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].value=document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].text;
         }
  frm.submit2.disabled=true;
  frm.klbtn.disabled=true;
  frm.submit();
  return true;
     }
}

function CheckNullKK(obj,kel_obj)
{
var kksemula=obj.value;
if (trim(kksemula)=="")
{
	alert("Kode Nomor Kartu Keluarga Semula belum diisi !");
	obj.focus();
	obj.select();
	return false;
}
if (trim(kksemula) == "0")
{
	alert("Kode Nomor Kartu Keluarga Semula belum diisi !");
	obj.value="";
	obj.focus();
	return false;
}

if (parseInt(trim(kksemula).length,10) != 16)
{
	alert("Kode Nomor Kartu Keluarga harus 16 digit !");
	obj.focus();
	return false;
}
  if (document.all['source'].value=="WNI")
     {
   return WNIWilayah(kel_obj);
     }
  else if (document.all['source'].value=="WNA")
      {
   return WNAWilayah(document.all['nama_kec'],kel_obj);
      }
}

function WNIWilayah(kel_obj)
{
if (document.all['source'].value=="WNI")
{
   if (kel_obj.selectedIndex==0)
  {
     alert("Kode Nama Kelurahan belum di pilih !");
     kel_obj.focus();
     return(false);
  }
}
return  true;
}

function WNAWilayah(kec_obj,kel_obj)
{
if (document.all['source'].value=="WNA")
{
   if (kec_obj.selectedIndex==0)
  {
     alert("Kode Nama Kecamatan belum di pilih !");
     kec_obj.focus();
     return(false);
  }

   if (kel_obj.selectedIndex==0)
  {
     alert("Kode Nama Kelurahan belum di pilih !");
     kel_obj.focus();
     return(false);
  }
}
return true;
}



function startTujuan(frm,obj,obj1)
{
   if (CheckNullKK(obj,obj1))
    {
     frm.action="Get_Tujuan_Wna.jsp"
  if (trim(document.all['source'].value)=="WNA")
         {
document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].value=document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].text;
         }
     frm.btnperiksa.disabled=true;
     frm.btnkel.disabled=true;
     frm.submit();
    return true;
    }
}

function KKValidate(itm)
{
var kksemula=itm.value;

if (trim(kksemula)=="")
{
	alert("Nomor Kartu Keluarga belum diisi !");
	itm.focus();
	itm.select();
	return false;
}
if (trim(kksemula) == "0")
{
	alert("Nomor Kartu Keluarga belum diisi !");
	itm.value="";
	itm.focus();
	return false;
}

if(isNaN(kksemula))
	{
		alert("Nomor Kartu Keluarga Salah !!" )
		itm.value="";
	        itm.focus();
	        return false;
	}
if (trim(kksemula.substring(0,1))=="-")
   {
    		alert("Nomor Kartu Keluarga Salah !!" )
   		  itm.value="";
	        itm.focus();
	        return false;
   }

return true;
}

function startPost(frm)
{
 if ((KKValidate(document.forms[0].no_kk)) && (checkWilayah(frm)))
    {
if (trim(document.all['source'].value)=="WNA")
         {
document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].value=document.all['nama_kec'].options[document.all['nama_kec'].selectedIndex].text;
         }
     frm.submit242.disabled=true;
     frm.klbtn.disabled=true;
     frm.submit();
    }
return true;
}

function onwna()
{
var kksemula=sudapunyawna.no_kk_semula.value;
if(isNaN(kksemula))
	{
		alert("Nomor Kartu Keluarga Salah !!" )
		sudapunyawna.no_kk_semula.value="";
	        sudapunyawna.no_kk_semula.focus();
	        return false;
	}
for(var i=0; i < kksemula.length; i++)
{
         if(kksemula.charAt(i)=="-")
               {
                 alert("Nomor Kartu Keluarga !!" )
		 sudapunyawna.no_kk_semula.value="";
	         sudapunyawna.no_kk_semula.focus();
	         return false;
               }
}
}
function checkWilayah(frm)
{
if (trim(frm.source.value)=="WNA")
   {
  if (frm.nama_kec.selectedIndex==0)
     {
         alert("Kode Nama Kecamatan belum di pilih !");
         frm.nama_kec.focus();
         return (false);
     }
    if (frm.nama_kel.selectedIndex==0)
     {
         alert("Kode Nama Kelurahan belum di pilih !");
         frm.nama_kel.focus();
         return (false);
     }
   }

if (trim(frm.source.value)=="WNI")
   {
   if (frm.nama_kel.selectedIndex==0)
     {
         alert("Kode Nama Kelurahan belum di pilih !");
         frm.nama_kel.focus();
         return (false);
     }
   }
return true;
}
