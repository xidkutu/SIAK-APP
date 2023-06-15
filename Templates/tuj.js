/*function tglhr1()
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
//if(pindah.thn_datngn.value<1800 || pindah.thn_datngn.value>y)
if(z>=abc)
{
		alert("Periksa pemasukan kebenaran data Tanggal !!");
		kedatangan.thn_datngn.value="";
                kedatangan.bln_datngn.value="";
                kedatangan.tgl_datngn.value="";
                kedatangan.tgl_datngn.focus();
		return false;
}
kedatangan.stphd.value=kedatangan.stat_no_kk_pdh.options[kedatangan.stat_no_kk_pdh.selectedIndex].value;
kedatangan.sim.disabled=false;
kedatangan.sim.focus();
}
}
*/
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

 if ( ((tgl_obj!=null) && (parseInt(tgl_obj.value,10)!=0) && (trim(tgl_obj.value)!=""))
       &&
 ((bln_obj!=null) && (parseInt(bln_obj.value,10)!=0) && (trim(bln_obj.value)!=""))
        &&
((thn_obj!=null) && (parseInt(thn_obj.value,10)!=0) && (trim(thn_obj.value)!="") && yr.length==4))
    {
               tgl=parseInt(tgl_obj.value,10);
               bln=parseInt(bln_obj.value,10);
               yr=parseInt(thn_obj.value,10);

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


function tglhr1()
{
   kedatangan.bln_datngn.value="";
   kedatangan.thn_datngn.value="";

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
kedatangan.thn_datngn.value="";

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
var pdata=kedatangan.bln_datngn.value

if ((pdata.length==2) && (pdata.value<1))
{
    alert("Data yang anda isi salah, perbaiki kembali!!");
	kedatangan.bln_datngn.value="";
	kedatangan.bln_datngn.focus();
	return false;
}

if(trim(kedatangan.bln_datngn.value)>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	kedatangan.bln_datngn.value="";
	kedatangan.bln_datngn.focus();
	return false;
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
if(abc>z)
{
		alert("Periksa kebenaran tanggal kedatangan !!");
		kedatangan.thn_datngn.value="";
                kedatangan.bln_datngn.value="";
                kedatangan.tgl_datngn.value="";
                kedatangan.tgl_datngn.focus();
		return false;
}
}
if (!parseMonth(kedatangan.tgl_datngn,kedatangan.bln_datngn,kedatangan.thn_datngn))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  kedatangan.tgl_datngn.value="";
                  kedatangan.bln_datngn.value="";
                  kedatangan.thn_datngn.value="";
                  kedatangan.tgl_datngn.focus();
                  return false;
                }

}