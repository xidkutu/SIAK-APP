function tglhr1()
{
if(isNaN(kedatangan.tgl_datngn.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		kedatangan.tgl_datngn.value="";
		kedatangan.tgl_datngn.focus();
		return false;
}
for(var i=0; i < kedatangan.tgl_datngn.value.length; i++)
{
         if(kedatangan.tgl_datngn.value.charAt(i)=="-")
               {
                 alert("Data  Salah, Silahkan Coba Lagi !!" )

                 kedatangan.tgl_datngn.value="";
                 kedatangan.tgl_datngn.focus();
	         return false;
               }
}

if(kedatangan.tgl_datngn.value.length == 2)
{
if(kedatangan.tgl_datngn.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		kedatangan.tgl_datngn.value="";
		kedatangan.tgl_datngn.focus();
		return false;
}
}
if(kedatangan.tgl_datngn.value.length==2)
{
kedatangan.bln_datngn.focus()
}
}
function tglhr2()
{
var op=kedatangan.bln_datngn.value;
if(isNaN(kedatangan.bln_datngn.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		kedatangan.bln_datngn.value="";
		kedatangan.bln_datngn.focus();
		return false;
}

for(var i=0; i < kedatangan.bln_datngn.value.length; i++)
{
         if(kedatangan.bln_datngn.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 kedatangan.bln_datngn.focus();
                 kedatangan.bln_datngn.value="";
	         return false;
               }
}
if(kedatangan.bln_datngn.value.length == 2)
{
if(kedatangan.bln_datngn.value==2)
{
	if (kedatangan.tgl_datngn.value>29)
	{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		kedatangan.tgl_datngn.value="";
		kedatangan.tgl_datngn.focus();
		return false;
	}
}

else if(kedatangan.bln_datngn.value>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	kedatangan.bln_datngn.value="";
	kedatangan.bln_datngn.focus();
	return false;
}

switch(kedatangan.bln_datngn.value)
	{
	       case "04":
                       {
			if(kedatangan.tgl_datngn.value > 30)
			{       kedatangan.tgl_datngn.value="";
                                kedatangan.tgl_datngn.focus();
				alert("Isian tanggal tidak benar,periksa kembali !");

				return false;
			}}

		case "06":

                        { if(kedatangan.tgl_datngn.value > 30)
			{       kedatangan.tgl_datngn.value="";
                                kedatangan.tgl_datngn.focus();
				alert("Isian tanggal tidak benar,periksa kembali !");

				return false;
			}}

		case "09":

			{if(kedatangan.tgl_datngn.value > 30)
			{       kedatangan.tgl_datngn.value="";
                                kedatangan.tgl_datngn.focus();
				alert("Isian tanggal tidak benar,periksa kembali !");

				return false;
			}}

		case "11":

			{if(kedatangan.tgl_datngn.value > 30)
			{       kedatangan.tgl_datngn.value="";
                                kedatangan.tgl_datngn.focus();
				alert("Isian tanggal tidak benar,periksa kembali !");

				return false;
			}}
		}
}

if(kedatangan.bln_datngn.value.length==2)
{
kedatangan.thn_datngn.focus();
}
}
function tglhr3()
{
if(kedatangan.bln_datngn.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			kedatangan.bln_datngn.value="";
			kedatangan.bln_datngn.select();
			return false

}
if(isNaN(kedatangan.thn_datngn.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		kedatangan.thn_datngn.value="";
		kedatangan.thn_datngn.focus();
		return false;
}

for(var i=0; i < kedatangan.thn_datngn.value.length; i++)
{
         if(kedatangan.thn_datngn.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 kedatangan.thn_datngn.focus();
                 kedatangan.thn_datngn.select();
	         return false;
               }
}
if(kedatangan.thn_datngn.value.length==4)
{
var z=new Date();
var y=z.getYear();
var m=z.getMonth();
var abc=new Date(kedatangan.bln_datngn.value+"/"+kedatangan.tgl_datngn.value+"/"+kedatangan.thn_datngn.value);
if(kedatangan.thn_datngn.value<1800 || kedatangan.thn_datngn.value>y)
{
alert("Periksa pemasukan kebenaran data Tanggal !!");
kedatangan.thn_datngn.value="";
kedatangan.thn_datngn.focus();
return false;
}
if(z>=abc)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		kedatangan.thn_datngn.value="";
                kedatangan.bln_datngn.value="";
                kedatangan.tgl_datngn.value="";
                kedatangan.tgl_datngn.focus();
		return false;
}
kedatangan.sim.disabled=false;
kedatangan.sim.focus();
}
}
function pin()
{
var v=kedatangan.sa.value;
var numpas="";
var sudas="";
var count=0;
for(i=0; i < v-1; i++)
{
   obj=new Object();
   obj.nam="che" + i;
   if(document.all[obj.nam].checked)
   {
    obj1=new Object();
    obj1.na="stat_hbkel" + i;
    numpas=numpas+document.all[obj1.na].value + "," + document.all[obj.nam].value + ",";
    count++;
   }
 }
if(count==0)
{
alert("Please select the anggota's");
return false;
}
kedatangan.numpang.value=numpas.substring(0,numpas.length-1);
alert("numps is.."+numpas.substring(0,numpas.length-1));
}