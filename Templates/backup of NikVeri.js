var flag_stat=0;

function ver()
{
var kks=daf.jml.value;
if (kks=="")
{
	alert("Kode Jumlah Anggota Keluarga/Pengikut belum diisi !");
	daf.jml.focus();
	daf.jml.select();
	return false;
}
if(daf.als_prmohon.options[0].selected==true)
{
alert(" Alasan Permohonan belum diisi !!!");
daf.als_prmohon.focus();
return false;
}

var v=daf.sa.value;
var va=daf.jml.value;
var x=0,i=0;
var niks="";
var sa="";
var na="";
//ob=new Object();

for(i=0;i<v;i++)
{
alert("checked");
if(daf.chk[i].checked)
 {
   obj=new Object();
   obj.name="stat_hbkel" + i;
   ob=new Object();
   ob.name="namap" + i;
   niks=niks+ document.all[obj.name].value + "," +  daf.chk[i].value+ ",";
   na=na+daf.chk[i].value+","+document.all[ob.name].value+",";
   alert("na=" + na);
 alert("Niks=" + niks)
   x++;
 }
}
daf.TC.value=niks.substring(0,niks.length-1);
document.all['nikna'].value=na.substring(0,na.length-1);

//alert(daf.TC.value);
//alert(document.all['nikna'].value);

if(x!=va)
{
alert("Data Anda Salah, Silahkan Coba Lagi !!");
daf.jml.focus();
daf.jml.select();
return false;
}
}

function setNik(obj)
{
str=obj.name;
var j=0;
if (obj.selectedIndex==1 && flag_stat==1)
   {
  // alert("Kepala Keluarga for this angotta already set.");

     for(i=0;i<=daf.elements.length-1;i++)
         {
              obj_name=daf.elements[i].name;
              obj_name=obj_name.substring(0,10);
              if (obj_name=="stat_hbkel")
                   {
               flag_stat=0;
              if (document.all[obj_name + j].selectedIndex==1)
               {
               flag_stat=0;
               obj.selectedIndex=0
                j++;
               }
                  }

         }
  }
else
  {
   if (obj.selectedIndex==1)
   {
   daf.nik_kep_kel.value=daf.chk[str.substring(10)].value;
   //daf.NAMA_PRA.value=daf.namap.value;
   //alert(daf.NAMA_PRA.value+"  "+daf.namap.value);
   flag_stat=1;
   }
  }
}
function val()
{
var kks=daf.jml.value;
if(isNaN(kks))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		daf.jml.focus();
                daf.jml.select();
	        return false;
	}
for(var i=0; i < kks.length; i++)
{
         if(kks.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 daf.jml.focus();
                 daf.jml.select();
	         return false;
               }
}
}
