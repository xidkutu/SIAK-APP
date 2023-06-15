function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

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

 if(trim(daf.nik_kep_kel.value)=="")
{
   alert("NIK Permohon KK belum dipilih !!!");
   daf.nik_kep_kel.focus();
   return false;
}

var v=daf.sa.value;
var va=daf.jml.value;
var x=0,i=0;
var niks="";
var sa="";
var na="";

for (i=0;i<v;i++)
{

   if (parseInt(v,10)==1)
      {
     if(daf.chk.checked)
            {
   obj=new Object();
   obj.name="stat_hbkel" + i;
   ob=new Object();
   ob.name="namap" + i;
   niks=niks+ document.all[obj.name].value + "@" +  daf.chk.value+ "@";
   na=na+daf.chk.value+"@"+document.all[ob.name].value+"@";
//   alert("na=" + na);
// alert("Niks=" + niks)
   x++;
           }
      }else if (parseInt(v,10)>1)
         {
        if(daf.chk[i].checked)
              {
   obj=new Object();
   obj.name="stat_hbkel" + i;
   ob=new Object();
   ob.name="namap" + i;
   niks=niks+ document.all[obj.name].value + "@" +  daf.chk[i].value+ "@";
   na=na+daf.chk[i].value+"@"+document.all[ob.name].value+"@";
   x++;
               }
       }
}
daf.TC.value=niks.substring(0,niks.length-1);
document.all['nikna'].value=na.substring(0,na.length-1);

if(x!=va)
{
alert("Data Anda Salah, Silahkan Coba Lagi !!");
daf.jml.focus();
daf.jml.select();
return false;
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
return true;
}
function startSub(frm)
{
  if (ver())
    {
   frm.action="Pro_Wna.jsp"
   frm.btn.disabled=true;
   frm.btn.disabled=true;
   frm.submit();
   return true;
    }
}

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

function validateKKBaru(frm)
{
var tot_agt=parseInt(document.all['sa'].value,10);
var flag;
for(i=0;i<tot_agt;i++)
{
          var obj=new Object();
          obj.name="umur"+i;
          var obj1=new Object();
          obj1.name="kwn"+i;

if (i==0) flag=frm.chk.checked; else flag=frm.chk[i].checked;

  if (flag)
         {
                             obj2=new Object();
                              obj2.name="stat_hbkel"+i;
  if   (document.all[obj2.name].selectedIndex==1)
               {
             if (((document.all['source'].value=="WNI") &&
                    (parseInt(document.all[obj.name].value,10)<17) &&
                  (parseInt(document.all[obj1.name].value,10)==1))
                  ||
                ((document.all['source'].value=="WNA")
               && (parseInt(document.all[obj.name].value,10)<17) &&
                  (parseInt(document.all[obj1.name].value,10)==2)))
                   {
                           alert("Penduduk ini masih dibawah umur/belum kawin");
                           document.all[obj2.name].selectedIndex=0
                           frm.nik_kep_kel.value="";
                           if (tot_agt==1)
                           frm.chk.checked=false;
                           else
                           frm.chk[i].checked=false;
                             continue;
                   }
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
                             if (tot_agt==1) frm.chk.checked=false;
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

function refreshAll()
{
var tot_agt=parseInt(document.all['sa'].value,10);
flag=false;
      for(i=0;i<tot_agt;i++)
      {
       obj=new Object();
       obj.name="stat_hbkel"+i;

     if (document.all[obj.name].selectedIndex==1)
           {
                flag=true;
           }
            if (!flag) document.all['nik_kep_kel'].value="";
       }
}

function getSex(nik)
{
var tmp_nik=nik;

if ((parseInt(tmp_nik.substring(6,8), 10)>=41) && (parseInt(tmp_nik.substring(6,8), 10)<=71))
{
    return 2;
}
return 1;
}

function checkSex(nik,hbkel)
{
var stat=getSex(trim(nik));
 if  ((parseInt(stat,10)==1) && (parseInt(hbkel.value,10)==3))
{
    hbkel.selectedIndex=0;
     return false;
}

  if  ((parseInt(stat,10)==2 )&& (parseInt(hbkel.value,10)==2))
{
     hbkel.selectedIndex=0;
     return false;
}
return true;
}