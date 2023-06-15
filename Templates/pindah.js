function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function starttuj(totagt)
{

var pinlist="";
var agtnik=new Object();
var no_kk_pindah=new Object();
var namalgkp=new Object();
var shdk=new Object();
var jenis=new Object();
var kwrn=new Object();

for(i=0;i<totagt;i++)
   {
       agtnik.name=trim("agtnik") + i;
       no_kk_pindah.name=trim("no_kk_pindah")+i;
       namalgkp.name=trim("namalgkp") + i;
       shdk.name=trim("shdk")+ i;
       jenis.name=trim("jenis") + i;
       kwrn.name=trim("kwrn")+ i;
pinlist=pinlist + "#" + trim(document.all[agtnik.name].value) + "#" + trim(document.all[no_kk_pindah.name].value) + "#" + trim(document.all[namalgkp.name].value) + "#" + trim(document.all[shdk.name].value) + "#" +trim(document.all[jenis.name].value);
   }

if (document.all['stat_no_kk_pdh'].selectedIndex==0)
{
     alert("Status Nomor KK Bagi Yang Pindah belum dipilih !!");
     document.all['stat_no_kk_pdh'].focus();
     return false;
}


if (isNaN(document.all['kodepos'].value))
{
     alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
     document.all['kodepos'].focus();
    return false;
}

if (document.all['source'].value=="WNI")
  {
    if (trim(document.all['nama_kep_des'].value)=="")
      {
       alert("Nama Kepala Desa belum diisi !!");
       document.all['nama_kep_des'].focus();
      return false;
      }

if (isNaN(document.all['nip_lrh'].value))
{
     alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
     document.all['nip_lrh'].focus();
    return false;
}

  if (trim(document.all['nama_cmat'].value)=="")
      {
       alert("Nama Camat belum diisi !!");
       document.all['nama_cmat'].focus();
      return false;
      }


if (isNaN(document.all['nip_cmat'].value))
{
     alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
     document.all['nip_cmat'].focus();
    return false;
}

  if (trim(document.all['nip_cmat'].value)=="")
      {
       alert("NIP Camat belum diisi !!");
       document.all['nip_cmat'].focus();
      return false;
      }
}

document.all['alist'].value=pinlist;
document.forms[0].action="Keda_Kep_keluarga.jsp";
document.forms[0].sim.disabled=true;
document.forms[0].submit232.disabled=true;
document.forms[0].submit();

}

function setAnggota(tot,no_kk)
{
var liststr="";
var obj=new Object();

var namalgkp=new Object();
var hbkel=new Object();
var jenis=new Object();
var kwrn=new Object();
obj.type="checkbox";
var nikval="";

document.all['checkflag'].value="N";

     for(i=0;i<tot;i++)
     {
       obj.name=trim("agtnik") + i;
       namalgkp.name=trim("namalgkp") + i;
       hbkel.name=trim("hbkel")+ i;
       jenis.name=trim("jenis") + i;
       kwrn.name=trim("kwrn")+ i;

 if (document.all[obj.name].checked)
 {
         if ((document.all['jenis_kpndhn'].value==4) &&
             ((document.all[hbkel.name].value=="KEPALA KELUARGA")
              ||
               (document.all[hbkel.name].value=="KEPALA KELUARGA/HEAD OF FAMILY")
              ||
              (document.all[hbkel.name].value=="Kepala Keluarga")
             ||
             (document.all[hbkel.name].value=="Kepala Keluarga/Head of Family")))
             {
                document.all[obj.name].checked=false;
                alert("Pilihan anggota yang pindah, salah !!!");
                return false;
             }

     if ((document.all['jenis_kpndhn'].value==1) &&
             ((document.all[hbkel.name].value!="KEPALA KELUARGA")
              &&
               (document.all[hbkel.name].value!="KEPALA KELUARGA/HEAD OF FAMILY")
              &&
              (document.all[hbkel.name].value!="Kepala Keluarga")
             &&
             (document.all[hbkel.name].value!="Kepala Keluarga/Head of Family")))
              {
                document.all[obj.name].checked=false;
                alert("Pilihan anggota yang pindah, salah !!!");
                return false;
              }

   document.all['checkflag'].value="Y";
   liststr=liststr + "#" + trim(document.all[obj.name].value) + "#" + trim(no_kk) + "#" + trim(document.all[namalgkp.name].value) + "#" + trim(document.all[hbkel.name].value) + "#" +trim(document.all[jenis.name].value) + "#" + trim(document.all[kwrn.name].value)
 }
   document.all['pinlist'].value=trim(liststr);
   }
}



function checkall(tot,no_kk)
{
var obj=new Object();
   for(i=0;i<tot;i++)
     {
               obj.name=trim("agtnik") + i;
               document.all[obj.name].checked=true;
     }
setAnggota(tot,no_kk);
   for(i=0;i<tot;i++)
     {
               obj.name=trim("agtnik") + i;
               document.all[obj.name].disabled=true;
     }
}

function uncheckall(tot)
{
var obj=new Object();
   for(i=0;i<tot;i++)
     {
               obj.name=trim("agtnik") + i;
               document.all[obj.name].checked=false;
               document.all[obj.name].disabled=false;
     }
//setAnggota(tot,no_kk);
document.all['pinlist'].value="";
document.all['checkflag'].value="N";
}

function pin()
{
if(pindah.als_pndh.options[0].selected==true)
	{
		alert("Alasan Pindah belum diisi !");
		pindah.als_pndh.focus();
		return false;
	}
var rw_tmp=pindah.no_rw_tjpndh.value;

if((trim(rw_tmp)!="") && (rw_tmp.length<3))
{
                alert("Kode RW 3 digit !");
		pindah.no_rw_tjpndh.focus();
		return falnumse;
}

if(pindah.alamat_tjpndh.value=="")
{
                alert("Alamat Tujuan Pindah belum diisi !");
		pindah.alamat_tjpndh.focus();
		return false;
}

if (document.all['klasf_pndh'].selectedIndex==0)
{
   alert("Klasifikasi Pindah belum dipilih !!!");
    document.all['klasf_pndh'].focus();
   return false;
}

if(pindah.nama_prop_ibu.options[0].selected==true)
{
alert("Nama Provinsi Belum Diisi !!");
pindah.nama_prop_ibu.focus();
return false;
}

if(pindah.nama_kab_ibu.options[0].selected==true)
{
alert("Nama Kabupaten Belum Diisi !!");
pindah.nama_kab_ibu.focus();
return false;
}


if(pindah.nama_kec_ibu.options[0].selected==true)
{
alert("Nama Kecamatan Belum Diisi !!");
pindah.nama_kec_ibu.focus();
return false;
}
if(pindah.nama_kel_ibu.options[0].selected==true)
{
alert("Nama Desa/Kelurahan Belum Diisi !!");
pindah.nama_kel_ibu.focus();
return false;
}
if (isNaN(document.all['kodepos_tjpndh'].value))
 {
    alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
    document.all['kodepos_tjpndh'].focus();
	return false;
}


if(pindah.jenis_kpndhn.options[0].selected==true)
	{
		alert("Jenis Kepindahan belum diisi !");
		pindah.jenis_kpndhn.focus();
		return false;
	}
if(pindah.stat_no_kk_tdkpdh.options[0].selected==true)
	{
		alert("Status Nomor KK Bagi Yang Tidak Pindah belum diisi !");
		pindah.stat_no_kk_tdkpdh.focus();
		return false;
	}
if(pindah.renc_tgl_pindah.value=="")
{
		alert("Rencana Tanggal Pindah, belum diisi !!" )
		pindah.renc_tgl_pindah.value="";
		pindah.renc_tgl_pindah.focus();
		return false;
}
if(pindah.renc_tgl_pindah.value=="00")
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		pindah.renc_tgl_pindah.value="";
		pindah.renc_tgl_pindah.focus();
		return false;
}
if(pindah.renc_bln_pindah.value=="")
{
		alert("Rencana Tanggal Pindah, belum diisi !! !!" )
		pindah.renc_bln_pindah.value="";
		pindah.renc_bln_pindah.focus();
		return false;
}
if(pindah.renc_bln_pindah.value=="00")
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		pindah.renc_bln_pindah.value="";
		pindah.renc_bln_pindah.focus();
		return false;
}
if(pindah.renc_thn_pindah.value=="")
{
			alert("Rencana Tanggal Pindah, belum diisi !!");
			pindah.renc_thn_pindah.value="";
			pindah.renc_thn_pindah.select();
			return false

}
if(pindah.renc_thn_pindah.value=="0")
{
			alert("Rencana Tanggal Pindah, belum diisi !!");
			pindah.renc_thn_pindah.value="";
			pindah.renc_thn_pindah.select();
			return false
}

if (document.all['source'].value=="WNI")
{
if (trim(document.all['nama_kep_des'].value)=="")
{
   alert("Nama Kepala Desa/Lurah belum diisi !!");
    document.all['nama_kep_des'].focus();
	return false;
}

if (isNaN(document.all['nip_lrh'].value))
 {
    alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
    document.all['nip_lrh'].focus();
	return false;
}

if (trim(document.all['nama_cmat'].value)=="")
{
   alert("Nama Camat belum diisi !!");
    document.all['nama_cmat'].focus();
	return false;
}

if (isNaN(document.all['nip_cmat'].value))
 {
    alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
    document.all['nip_cmat'].focus();
	return false;
}

if (trim(document.all['nip_cmat'].value)=="")
{
    alert("NIP Camat belum diisi !!");
    document.all['nip_cmat'].focus();
	return false;
}
}

if ((document.all['jenis_kpndhn'].value==1)
 && (document.all['totagt'].value!=1))
{
       alert("Anggota keluarga yang tidak pindah belum diproses!!");
       return false;
}

if (trim(document.all['checkflag'].value)=="Y")
   {
 return startMod("SIM");
   }
else {  alert("Keluarga Yang Pindah belum dipilih !");
        return(false);}
}

function alam()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,-/:.' ";
var temp="";



   for (var i=0; i < pindah.alamat_tjpndh.value.length; i++)
   {

	      temp = "" + pindah.alamat_tjpndh.value.substring(i, i+1);

   		if(val.indexOf(temp) == "-1")
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			pindah.alamat_tjpndh.value="";
			pindah.alamat_tjpndh.focus();

           return false;
		}
	}


}
function rt()
{
var val = "0123456789";
var temp="";


for (var i=0; i < pindah.no_rt_tjpndh.value.length; i++)
   {
   		temp = "" + pindah.no_rt_tjpndh.value.substring(i, i+1);

   		if(val.indexOf(temp) == "-1")
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			pindah.no_rt_tjpndh.focus();
			pindah.no_rt_tjpndh.select();
			return false;
		}
	}
}

function checkNumeric(obj)
{
if (isNaN(obj.value))
   {
        alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
        obj.focus();
        return (false);
   }
}

function rw()
{
var val = "0123456789";
var temp="";
	while (pindah.no_rw_tjpndh.value.substring(0,1) == ' ')
	{
        pindah.no_rw_tjpndh.value = pindah.no_rw_tjpndh.value.substring(1, pindah.no_rw_tjpndh.length);
	}

	while (pindah.no_rw_tjpndh.value.substring(pindah.no_rw_tjpndh.value.length-1,pindah.no_rw_tjpndh.value.length) == ' ')
 	{
      pindah.no_rw_tjpndh.value = pindah.no_rw_tjpndh.value.substring(0, pindah.no_rw_tjpndh.value.length-1);
	}

for (var i=0; i < pindah.no_rw_tjpndh.value.length; i++)
{
   temp = "" + pindah.no_rw_tjpndh.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			pindah.no_rw_tjpndh.value="";
			pindah.no_rw_tjpndh.focus();
			return false;
	}
}
}
function dus()
{
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .,':; ";
var temp="";


for(i = 0; i < pindah.dusun_tjpndh.value.length; i++)
{

   temp = "" + pindah.dusun_tjpndh.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			pindah.dusun_tjpndh.value="";
			pindah.dusun_tjpndh.focus();
			return false;
	}
}
}

function jens()
{
var optstr="";
var str_td_pdh=new Array();
str_td_pdh[0]="--Pilih Status Nomor KK Bagi";
str_td_pdh[1]="Numpang KK";
str_td_pdh[2]="Membuat KK Baru";
str_td_pdh[3]="Tidak Ada Anggota Keluarga Yang Tinggal";
str_td_pdh[4]="Nomor KK Tetap";

var std_pdh=new Array();
std_pdh[0]="--Pilih Status Nomor KK Bagi Yang Pindah";
std_pdh[1]="Numpang KK";
std_pdh[2]="Membuat KK Baru";
std_pdh[3]="Nama Kepala Keluarga dan Nomor KK Tetap";


     pindah.stat_no_kk_tdkpdh.length=0;
     pindah.stat_no_kk_pdh.length=0;
     pindah.btn1.disabled=true;
     pindah.btn2.disabled=true;

var cntr=0;
uncheckall(trim(document.all['totagt'].value));
switch(pindah.jenis_kpndhn.selectedIndex)
{
  case 1:
      for(i=0;i<=3;i++)
        {
       itm = document.createElement("OPTION");
            if (i!=0)
       optstr=cntr + " - " + str_td_pdh[i];
            else  optstr=str_td_pdh[i];
       itm.text=optstr;
       itm.value=i;
       pindah.stat_no_kk_tdkpdh.add(itm);
       cntr++;
        }
        cntr=0;
       for(i=0;i<=3;i++)
        {
          if ((i==0) || (i==1) || (i==3))
              {
                 if (i!=0)
                  optstr=cntr + " - " + std_pdh[i];
                else  optstr=std_pdh[i];
             itm = document.createElement("OPTION");
             itm.text=optstr;
             itm.value=i;
             pindah.stat_no_kk_pdh.add(itm);
             cntr++;
              }
        }
    break;
   case 2:
        cntr=0;
       for(i=0;i<=3;i++)
          {
               if ((i==0) || (i==3))
                {
                            if (i!=0)
                            optstr=cntr + " - " + str_td_pdh[i];
                               else  optstr=str_td_pdh[i];
                              itm = document.createElement("OPTION");   //Untuk Tidak Pindah
                              itm.text=optstr;
                              itm.value=i;
                              pindah.stat_no_kk_tdkpdh.add(itm);
                       cntr++;
                }
          }
                document.all['stat_no_kk_tdkpdh'].selectedIndex=1;
         cntr=0;
       for(i=0;i<=3;i++)
        {
          if ((i==0) || (i==1) || (i==3))
              {
                   if (i!=0)
                  optstr=cntr + " - " + std_pdh[i];
                else  optstr=std_pdh[i];
          itm = document.createElement("OPTION");
         itm.text=optstr;
          itm.value=i;
          pindah.stat_no_kk_pdh.add(itm);
                  cntr++;
              }
        }
checkall(trim(document.all['totagt'].value),(document.all['no_kk'].value));
         break;
    case 3:
     for(i=0;i<=3;i++)
        {
                 if (i!=0)
                            optstr=cntr + " - " + str_td_pdh[i];
                               else  optstr=str_td_pdh[i];

       itm = document.createElement("OPTION");
       itm.text=optstr;
       itm.value=i;
       pindah.stat_no_kk_tdkpdh.add(itm);
             cntr++;
        }
     cntr=0;
      for(i=0;i<=3;i++)
        {
          if ((i==0) || (i==1) || (i==3))
              {
                  if (i!=0)
                  optstr=cntr + " - " + std_pdh[i];
                else  optstr=std_pdh[i];
          itm = document.createElement("OPTION");
         itm.text=optstr;
          itm.value=i;
          pindah.stat_no_kk_pdh.add(itm);
              cntr++;
           }
       }
   break;
   case 4:
         for(i=0;i<=4;i++)
          {
               if ((i==0) || (i==4))
                {
                      if (i!=0)
                            optstr=cntr + " - " + str_td_pdh[i];
                               else  optstr=str_td_pdh[i];

                              itm = document.createElement("OPTION");   //Untuk Tidak Pindah
                              itm.text=optstr;
                              itm.value=i;
                              pindah.stat_no_kk_tdkpdh.add(itm);
                   cntr++;
                }
          }
          cntr=0;
       for(i=0;i<=3;i++)
        {
          if ((i==0) || (i==1) || (i==2))
              {
                          if (i!=0)
                  optstr=cntr + " - " + std_pdh[i];
                else  optstr=std_pdh[i];

          itm = document.createElement("OPTION");
         itm.text=optstr;
          itm.value=i;
          pindah.stat_no_kk_pdh.add(itm);
                 cntr++;
           }
       }
}
}

function tdkpdh(txt)
{
var newstr;

newstr=txt.substr(txt.indexOf("-")+1);
    if ((trim(pindah.totagt.value)>1) && (trim(newstr)=="Numpang KK"))
     {
    pindah.btn1.disabled=false;
    pindah.btn2.disabled=true;
     }
   else if ((trim(pindah.totagt.value)>1) && (trim(newstr)=="Membuat KK Baru"))
    {
        pindah.btn1.disabled=true;
       pindah.btn2.disabled=false;
      }
  else if (trim(newstr)=="Tidak Ada Anggota Keluarga Yang Tinggal")
        {
        pindah.btn1.disabled=true;
       pindah.btn2.disabled=true;

             if ((trim(pindah.totagt.value)>1) && (pindah.jenis_kpndhn.selectedIndex!=2))
              {
               alert("Pilihan Anda Salah !");
               pindah.stat_no_kk_tdkpdh.selectedIndex=0
              }
      return(false);
      }
}

function chooseMod(str,no_kk)
{         //choseMod function hard coded for the time being until WNI tujuan ready
var tmpstr=trim(str);
   if (tmpstr=="1 - Numpang KK")
      window.open('NumpangKK_Wna.jsp?no_kk='+ trim(no_kk) + '&status=TJ&source='+document.all['source'].value,'','fullscreen=no,scrollbars=yes,resizable=yes,menubar=no,toolbar=no,width=800,height=650');
   if (tmpstr=="2 - Membuat KK Baru")
       window.open('Pen_KKWna_SudapunyaNik.jsp?no_kk='+ trim(no_kk) + '&status=TJ&source='+document.all['source'].value,'','fullscreen=no,scrollbars=yes,resizable=yes,menubar=no,toolbar=no,width=800,height=650');
}


function startMod(module)
{
 var tmpmod=trim(module);
 pindah.modtype.value=tmpmod;
 pindah.action="Ang_Kel_Wna.jsp?source="+document.all['source'].value;
 pindah.btn1.disabled=true;
 pindah.btn2.disabled=true;
 pindah.sim.disabled=true;
 pindah.klbtn.disabled=true;
 pindah.submit();
 return true;
}


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
   pindah.renc_bln_pindah.value="";
   pindah.renc_thn_pindah.value="";

if(isNaN(pindah.renc_tgl_pindah.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		pindah.renc_tgl_pindah.value="";
		pindah.renc_tgl_pindah.focus();
		return false;
}
for(var i=0; i < pindah.renc_tgl_pindah.value.length; i++)
{
         if(pindah.renc_tgl_pindah.value.charAt(i)=="-")
               {
                 alert("Data  Salah, Silahkan Coba Lagi !!" )

                 pindah.renc_tgl_pindah.value="";
                 pindah.renc_tgl_pindah.focus();
	         return false;
               }
}

if(pindah.renc_tgl_pindah.value.length == 2)
{
if(pindah.renc_tgl_pindah.value>31)
{
		alert("Data yang anda isi salah, perbaiki kembali !!");
		pindah.renc_tgl_pindah.value="";
		pindah.renc_tgl_pindah.focus();
		return false;
}
}


if(pindah.renc_tgl_pindah.value.length==2)
{
pindah.renc_bln_pindah.focus()
}
}

function tglhr2()
{
pindah.renc_thn_pindah.value="";

var op=pindah.renc_bln_pindah.value;
if(isNaN(pindah.renc_bln_pindah.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		pindah.renc_bln_pindah.value="";
		pindah.renc_bln_pindah.focus();
		return false;
}

for(var i=0; i < pindah.renc_bln_pindah.value.length; i++)
{
         if(pindah.renc_bln_pindah.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 pindah.renc_bln_pindah.focus();
                 pindah.renc_bln_pindah.value="";
	         return false;
               }
}
var pdata=pindah.renc_bln_pindah.value

if ((pdata.length==2) && (pdata.value<1))
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	pindah.renc_bln_pindah.value="";
	pindah.renc_bln_pindah.focus();
	return false;
}

if(trim(pindah.renc_bln_pindah.value)>12)
{
	alert("Data yang anda isi salah, perbaiki kembali!!");
	pindah.renc_bln_pindah.value="";
	pindah.renc_bln_pindah.focus();
	return false;
}

if(pindah.renc_bln_pindah.value.length==2)
{
pindah.renc_thn_pindah.focus();
}
}
function tglhr3()
{


if(pindah.renc_bln_pindah.value.length < 2)
{
			alert("Pemasukan data  Bulan  2 digit !!");
			pindah.renc_bln_pindah.value="";
			pindah.renc_bln_pindah.select();
			return false

}
if(isNaN(pindah.renc_thn_pindah.value))
{
		alert("Data  Salah, Silahkan Coba Lagi !!" )
		pindah.renc_thn_pindah.value="";
		pindah.renc_thn_pindah.focus();
		return false;
}

for(var i=0; i < pindah.renc_thn_pindah.value.length; i++)
{
         if(pindah.renc_thn_pindah.value.charAt(i)=="-")
               {
                 alert("Data Salah, Silahkan Coba Lagi !!" )
		 pindah.renc_thn_pindah.focus();
                 pindah.renc_thn_pindah.select();
	         return false;
               }

}
if(pindah.renc_thn_pindah.value.length==4)
{
var z=new Date();
var y=z.getYear();
var m=z.getMonth();
var abc=new Date(pindah.renc_bln_pindah.value+"/"+pindah.renc_tgl_pindah.value+"/"+pindah.renc_thn_pindah.value);
/*if(abc<=z)
{
		alert("Periksa kebenaran tanggal kedatangan !!");
		pindah.renc_thn_pindah.value="";
                pindah.renc_bln_pindah.value="";
                pindah.renc_tgl_pindah.value="";
                pindah.renc_tgl_pindah.focus();
		return false;
} */
}
if (!parseMonth(pindah.renc_tgl_pindah,pindah.renc_bln_pindah,pindah.renc_thn_pindah))
                {
                  alert("Isian tanggal tidak benar,periksa kembali !.")
                  pindah.renc_tgl_pindah.value="";
                  pindah.renc_bln_pindah.value="";
                  pindah.renc_thn_pindah.value="";
                  pindah.renc_tgl_pindah.focus();
                  return false;
                }

}
function kod()
{

var val = "0123456789";
var temp="";
while (pindah.kodepos_tjpndh.value.substring(0,1) == ' ')
{
        pindah.kodepos_tjpndh.value = pindah.kodepos_tjpndh.value.substring(1, pindah.kodepos_tjpndh.length);
}
while (pindah.kodepos_tjpndh.value.substring(pindah.kodepos_tjpndh.value.length-1,pindah.kodepos_tjpndh.value.length) == ' ')
 {
      pindah.kodepos_tjpndh.value = pindah.kodepos_tjpndh.value.substring(0, pindah.kodepos_tjpndh.value.length-1);
}



for (var i=0; i < pindah.kodepos_tjpndh.value.length; i++)
{
   temp = "" + pindah.kodepos_tjpndh.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			pindah.kodepos_tjpndh.value="";
			pindah.kodepos_tjpndh.focus();
			return false;
	}

}

if(pindah.kodepos_tjpndh.value.length<5)
{
	alert("No Kode Pos 5 digit !!");
	pindah.kodepos_tjpndh.value="";
	pindah.kodepos_tjpndh.focus();
	return false;
}
}
function tel()
{
var val = "0123456789()-:; ";
var temp="";
for (var i=0; i < pindah.telp_tjpndh.value.length; i++)
{
   temp = "" + pindah.telp_tjpndh.value.substring(i, i+1);

   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			pindah.telp_tjpndh.value="";
			pindah.telp_tjpndh.focus();
			return false;

	}
}
}

function checkEmpty(obj)
{
  if (trim(obj.value)=="")
  {
     alert("Data belum diisi !");
     obj.focus();
    return (false);
  }
}