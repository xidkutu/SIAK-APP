function ditem()
{
var v=numpang.sa.value;
var va=numpang.jml.value;
var x=0,i=0;
var niks="";
if(numpang.als_numpang.options[0].selected==true)
{
alert(" Alasan Menumpang KK belum diisi !!!");
numpang.als_numpang.focus();
return false;
}
var kks=numpang.jml.value;
if (kks=="")
{
	alert("Kode Jumlah Anggota Keluarga/Pengikut belum diisi !");
	numpang.jml.focus();
	numpang.jml.select();
	return false;
}

for(i=0; i < v; i++)
{
   obj=new Object();
   obj.name="che" + i;

  if(document.all[obj.name].checked)
   {
   objst=new Object();
   objst.name="stat_hbkel" + i;
   objname=new Object();
   objname.name="nama"+i;
   objhbold=new Object();
   objhbold.name="stkep"+i;

       var hstr=new String(document.all[objhbold.name].value);
       hstr=hstr.toUpperCase();

  if (((hstr=="KEPALA KELUARGA") ||(hstr=="KEPALA KELUARGA/HEAD OF FAMILY"))
      && (document.all[objst.name].selectedIndex==0))
       {
           alert("Numpang KK tidak boleh sebagai Kepala Keluarga !!");
           return (false);
       }
   niks=niks+ document.all[objst.name].value + "@" + document.all[obj.name].value + "@" + document.all[objname.name].value + "@" + document.all[objhbold.name].value + "@";
   x++;
   }
}

numpang.TC.value=niks.substring(0,niks.length-1);
//alert(numpang.TC.value);
if(x!=va)
{
alert("Data Anda Salah, Silahkan Coba Lagi !!");
numpang.jml.focus();
numpang.jml.select();
return false;
}
else if(x!=v)
{
for(var j=0;j<v;j++)
{
objche=new Object();
objsta=new Object();
objche.name="che" + j;
objsta.name="stkep" + j;
var msg="Kepala Keluarga belum dapat numpang sebagai anggota, Anggota harus bentuk KK baru !!";

 var hstr=new String(document.all[objsta.name].value);
      hstr=hstr.toUpperCase();

if(document.all[objche.name].checked)
{
   if (document.all['source'].value=="WNI")
               {
      if (hstr=="KEPALA KELUARGA")
      {
       alert(msg);
       return false;
      }
               }
      if (document.all['source'].value=="WNA")
               {
      if (hstr=="KEPALA KELUARGA/HEAD OF FAMILY")
      {
       alert(msg);
       return false;
      }
              }
}
}
}
if (document.all['source'].value=="WNI")
   {
if (trim(document.all['nama_kep_des'].value)=="")
{
   alert("Nama Kepala Desa/Lurah belum diisi !!!");
   document.all['nama_kep_des'].focus();
   return false;
}
   }

if (document.all['source'].value=="WNA")
   {
    if (trim(document.all['nama_din'].value)=="")
{
   alert("Jabatan pada Kantor/Dinas belum diisi !!!");
   document.all['nama_din'].focus();
   return false;
}
    if (trim(document.all['nama_kep_din'].value)=="")
{
   alert("Nama Pejabat belum diisi !!!");
   document.all['nama_kep_din'].focus();
   return false;
}
    if (trim(document.all['nip_kep_din'].value)=="")
{
   alert("NIP Pejabat belum diisi !!!");
   document.all['nip_kep_din'].focus();
   return false;
}
 }
numpang.action="Angotas_Moving.jsp"
numpang.btn.disabled=true;
numpang.klbtn.disabled=true;
numpang.submit();
}


function al()
{
var kks=numpang.jml.value;
if(isNaN(kks))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
                numpang.jml.value="";
                numpang.jml.focus();

	        return false;
	}
for(var i=0; i < kks.length; i++)
{
         if(kks.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 numpang.jml.value="";
                 numpang.jml.focus();
	         return false;
               }
}
}