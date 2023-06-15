function sud()
{
if(kedatangan.stat_no_kk_pdh.options[0].selected==true)
{
  alert("Status Nomor KK Bagi Yang Pindah belum Diisi !!");
  kedatangan.stat_no_kk_pdh.focus();
}
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
    numpas=numpas+document.all[obj1.na].value + "#" + document.all[obj.nam].value + "#";
    count++;
  }
 }
if(count==0)
{
alert("Please select the anggota's");
return false;
}
document.all['ng'].value=numpas.substring(0,numpas.length-1);
alert("numps is.."+numpas.substring(0,numpas.length-1));
}
function ypin()
{
if(kedatangan.stat_no_kk_pdh.options[1].selected==true)
{
kedatangan.alamat_tjpndh.value="";
kedatangan.no_rt_tjpndh.value="";
kedatangan.no_rw_tjpndh.value="";
kedatangan.dusun_tjpndh.value="";
kedatangan.namaprop_tjpndh.value="";
kedatangan.namakab_tjpndh.value="";
kedatangan.namakec_tjpndh.value="";
kedatangan.namakel_tjpndh.value="";
kedatangan.kode_pos.value="";
kedatangan.telpon.value="";
kedatangan.num_nokk.focus();
kedatangan.nump.disabled=false;
}
else
if(kedatangan.stat_no_kk_pdh.options[2].selected==true)
{
kedatangan.nump.disabled=true;

kedatangan.alamat_tjpndh.value=kedatangan.alamatlam.value;
kedatangan.no_rt_tjpndh.value=kedatangan.nortlam.value;
kedatangan.no_rw_tjpndh.value=kedatangan.norwlam.value;
kedatangan.dusun_tjpndh.value=kedatangan.dusunlam.value;
kedatangan.namaprop_tjpndh.value=kedatangan.nama_prop.value;
kedatangan.namakab_tjpndh.value=kedatangan.nama_kab.value;
kedatangan.namakec_tjpndh.value=kedatangan.nama_kec.value;
kedatangan.namakel_tjpndh.value=kedatangan.nama_kel.value;
kedatangan.kode_pos.value=kedatangan.kodlam.value;
kedatangan.telpon.value=kedatangan.tlplam.value;
kedatangan.tgl_datngn.focus();
}
}
function setNik(obj)
{
str=obj.name;
var j=0;
if (obj.selectedIndex==1 && flag_stat==1)
   {
  alert("Kepala Keluarga for this angotta already set.");

     for(i=1;i<=kedatangan.elements.length-1;i++)
         {
              obj_name=kedatangan.elements[i].name;
              obj_name=obj_name.substring(0,10);
              if (obj_name=="stat_hbkel")
                   {
               obj=new Object();
               obj.n=obj_name + str.substring(10);
               flag_stat=0;
              if (document.all[obj.n].selectedIndex==1)
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
    obj=new Object();
    obj.nam="che" + str.substring(10);
    kedatangan.num_nokk.value=document.all[obj.nam].value;
    flag_stat=1;
   }
  }
kedatangan.sim.disabled=false;
}
function edi()
{
if(isNaN(kedatangan.num_nokk.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		kedatangan.num_nokk.value="";
		kedatangan.num_nokk.focus();
		return false;
}
for(var i=0; i < kedatangan.num_nokk.value.length; i++)
{
         if(kedatangan.num_nokk.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 kedatangan.num_nokk.value="";
                 kedatangan.num_nokk.focus();
	         return false;
               }
}
if(kedatangan.num_nokk.value=="")
{
                alert("Nomor Induk Kependudukan Belum Diisi!!" )
		kedatangan.num_nokk.value="";
		kedatangan.num_nokk.focus();
		return false;
}
}
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
kedatangan.sim.disabled=false;
kedatangan.sim.focus();
}
}
