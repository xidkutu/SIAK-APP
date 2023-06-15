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
                 daf.als_prmohon.focus();
		alert("Alasan Permohonan  belum diisi !");
	        return false;

}



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

var v=daf.sa.value;
var va=daf.jml.value;
var x=0,i=0;
var niks="";
var sa="";

for(i=0;i<v;i++)
{
   if (parseInt(v,10)==1)
      {
    if(daf.chk.checked)
          {
   obj=new Object();
   obj.name="stat_hbkel" + i;
   niks=niks+ document.all[obj.name].value + "," +  daf.chk.value+ ",";
   x++;
              }
      }else if (parseInt(v,10)>1)
         {
         if(daf.chk[i].checked)
           {
   obj=new Object();
   obj.name="stat_hbkel" + i;
   niks=niks+ document.all[obj.name].value + "," +  daf.chk[i].value+ ",";
   x++;
        }
       }
}

daf.TC.value=niks.substring(0,niks.length-1);
//alert(daf.TC.value);
if(parseInt(x,10)!=parseInt(va,10))
{
alert("Data Anda Salah, Silahkan Coba Lagi !!");
daf.jml.focus();
daf.jml.select();
return false;
}
}


/*
function setNik(obj)
{
str=obj.name;
var j=0;
if (obj.selectedIndex==1 && flag_stat==1)
   {
  alert("Kepala Keluarga for this angotta already set.");

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
   flag_stat=1;
   }
  }
}
*/

function setNik(frm)
{
var tot_agt=parseInt(document.all['sa'].value,10);

for(i=0;i<tot_agt;i++)
      {
        obj=new Object();
         obj.name="stat_hbkel"+i;
             if (document.all[obj.name].selectedIndex==1)
                  {
         if   (tot_agt==1)
            {
       if (!(frm.chk.checked))
                        {
   	 frm.nik_kep_kel.value="";
           document.all[obj.name].selectedIndex=0
       	   }
          else  if (frm.chk.checked)
                  frm.nik_kep_kel.value=frm.chk.value;
            }
        else if   (tot_agt>1)
              {

         	     if (!(frm.chk[i].checked))
                  		   {
          			 frm.nik_kep_kel.value="";
	        	        document.all[obj.name].selectedIndex=0
				  }
				 else  if (frm.chk[i].checked)
                                  frm.nik_kep_kel.value=frm.chk[i].value;
                 }
              }
       }
}

function setKK(frm)
{
var tot_agt=parseInt(document.all['sa'].value,10);
var cntr=0;
      for(i=0;i<tot_agt;i++)
      {
       obj=new Object();
        obj.name="stat_hbkel"+i;
         if (document.all[obj.name].selectedIndex==1)
		    {
		   cntr++;
		   }
		   //checking for more than one kepala keluarga counter increment
                  if (cntr>1)   //if more than one KK found then set the selectedIndex for that combo to 0 and re-intialize cntr =1 again
                                {
                             document.all[obj.name].selectedIndex=0
                             if (tot_agt==1) frm.chk.checked=false
                             else if (tot_agt>1)   frm.chk[i].checked=false
							   // frm.nik_kep_kel.value="";
                                 cntr=1;
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

