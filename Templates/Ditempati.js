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
   niks=niks+ document.all[objst.name].value + "," + document.all[obj.name].value + "," + document.all[objname.name].value + ",";
   x++;
   }
}

numpang.TC.value=niks.substring(0,niks.length-1);

alert("tc is.." + niks.substring(0,niks.length-1));

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

if(document.all[objche.name].checked)
{
     //alert("check it.."+document.all[objsta.name].value +"    "+j);
     if (document.all[objsta.name].value=="Kepala")
      {
       alert("Kepala Keluarga belum dapat numpang sebagai anggota, Anggota harus bentuk KK baru !!");
       return false;
      }
}
}
}
 frmpost();
}


function frmpost()
{
document.forms[0].action="Insert_Numpang.jsp"
document.forms[0].submit();
document.all['simpan'].disabled=true;
return true;
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