function checkedAll() {
  if(document.formktpwni.cb!=null && document.formktpwni.cb.length!=undefined) {
     for (i=0; i<document.formktpwni.cb.length; i++)  {
        document.formktpwni.cb[i].checked = document.formktpwni.cekcb.checked;
     }
  }
}
/*
function showDialogBox()
{
    if(formktpwni.no_kel.value=="")
    {
        alert("Nama Kelurahan belum Diisi !!");
        formktpwni.nama_kel.focus();
        return false;
    }
 while(true)
    {
    var nik = prompt("Masukkan NIK yang ingin dicari: ", "");

    if (nik!=null) nik=trim(nik);

    if ((nik!="") && (nik!=null) && (nik.length==16) && !isNaN(nik))
    {
      document.formktpwni.spesifik_nik.value = nik;
      document.formktpwni.action="cetak_KTP_wni_mnl.jsp?flag=0&spesifik_nik="+document.formktpwni.spesifik_nik.value+"&nama_kel="+document.all["nkel"].value;
      document.formktpwni.submit();
      break;
    }
else
{
return false;
}
    }
}
*/
function setDocs(v) {
    var niks="";
    var arr = new Array(v);
    var x = 0;
    var chk=false;
    var param=document.all["param"].value;
    var onemember=false;
    if(v>1)
    {
     for(i=0;i<v;i++)
     {
        if(document.formktpwni.cb[i].checked)
        {
           niks=document.formktpwni.cb[i].value;

               arr[x] = niks;
           x++;
           chk=true;
        }
     }
    }
    else if(document.formktpwni.cb==undefined)
    {
        chk=true;
        onemember=true;
        if(document.formktpwni.member.value==2)
        {
        niks = document.formktpwni.cb.value;
        }
        else if(document.formktpwni.member.value==1)
        {
        niks = document.formktpwni.cb.value;
        }
    }
    else
    {
        chk=true;
        onemember=true;
        if(document.formktpwni.member.value==2)
        {
            niks = document.formktpwni.cb.value;
        }
        else if(document.formktpwni.member.value==1)
        {
            niks = document.formktpwni.cb.value;
        }
    }
     if(chk)
     {
         var radio = document.formktpwni.radiobutton;
         var radioValue ="";
        for (i=0;i<radio.length;i++)
        {
            if (radio[i].checked)
            {
               radioValue= radio[i].value;
               break;
            }
        }

         for(i=0;i<x;i++)
         {
             if (param.indexOf(arr[i])<0) {
               param = param + "^" +arr[i];
             }
         }

         param = trim(param);

         if(onemember)
         {
             param = niks;
         }
        document.all["param"].value = param;

     }
}
function viewKTP_WNIPage(v)
{
    var niks="";
    var arr = new Array(v);
    var x = 0;
    var chk=false;
    //var param=document.all["param"].value;
    var param="";
    var onemember=false;

    if(v>1)
    {
     for(i=0;i<v;i++)
     {
        if(document.formktpwni.cb[i].checked)
        {
           niks=document.formktpwni.cb[i].value;
           arr[x] = niks;
           x++;
           chk=true;
        }
     }
    }
    else if(document.formktpwni.cb.length==undefined)
    {
        chk=true;
        onemember=true;
        if(document.formktpwni.member.value==2)
        {
        niks = document.formktpwni.cb.value;
        }
        else if(document.formktpwni.member.value==1)
        {
        niks = document.formktpwni.cb.value;
        }
        if(!document.formktpwni.cb.checked)
        {
         window.alert('Belum Pilih NIK');
        return;
        }
    }
    else
    {
        chk=true;
        onemember=true;
        if(document.formktpwni.member.value==2)
        {
            niks = document.formktpwni.cb.value;
        }
        else if(document.formktpwni.member.value==1)
        {
            niks = document.formktpwni.cb.value;
        }
        if(!document.formktpwni.cb.checked)
        {
         window.alert('Belum Pilih NIK');
        return;
        }
    }
     if(chk)
     {
         var radio = document.formktpwni.radiobutton;
         var radioValue ="";
        for (i=0;i<radio.length;i++)
        {
            if (radio[i].checked)
            {
               radioValue= radio[i].value;
               break;
            }
        }

	var kendali = document.formktpwni.jpkendali;
         var kendaliValue ="";
        for (i=0;i<kendali.length;i++)
        {
            if (kendali[i].checked)
            {
               kendaliValue= kendali[i].value;
               break;
            }
        }

         for(i=0;i<x;i++)
         {
             if (param.indexOf(arr[i])<0) {
               param = param + "^" +arr[i];
             }
         }

         param = trim(param);

         if(onemember)
         {
             param = niks;
         }
        document.all["param"].value = param;
        penandatangan = "";
            if (document.all["stat_pndtng"].value=="Camat")  {
               no_prop = '<%=record.getNoProp()%>'
               no_kab = '<%=record.getNoKab()%>'
               no_kec = '<%=record.getNoKec()%>'
              // alert("siap")
               no_kel = document.formktpwni.no_kel.value
              // alert(no_kel)
               penandatangan = "&nama_pej="+getKelurahanItem(no_prop, no_kab, no_kec, no_kel, 6) +
                               "&nip_pej="+getKelurahanItem(no_prop, no_kab, no_kec, no_kel, 7) +
                               "&a_n="+getKelurahanItem(no_prop, no_kab, no_kec, no_kel, 5) +
                               "&stat_pndtng=" + document.all["stat_pndtng"].value

            } else {
               penandatangan = "&nama_pej="+document.all["nama_pej"].value + "&nip_pej="+document.all["nip_pej"].value +"&a_n="+document.all["a_n"].value + "&stat_pndtng=" + document.all["stat_pndtng"].value
            }
 window.open("cetak_KTP_lampiran_mnl.jsp?kewarganegaraan=WNI&radiobutton="+document.all['stat_print'].value+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&nama_kec="+document.all["nama_kec"].value+"&cb="+param+"&nama_kel="+document.all["nkel"].value+ "&no_kel="+document.formktpwni.no_kel.value + "&selidx=" + document.all['selidx'].value+penandatangan+"&pjkendali="+kendaliValue, '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
     }
     else
     {
         window.alert('Belum Pilih Nomor Nik');
     }
}

function checkComboBox(no_kel_value)
{
    document.formktpwni.no_kel.value=no_kel_value;
}

function checkRadioButton(flag)
{
    if(formktpwni.no_kel.value=="")
    {
        alert("Nama Kelurahan belum Diisi !!");
        formktpwni.nama_kel.focus();
        return false;
    }

   var vchecked;
   var radio = document.formktpwni.radiobutton;

   for (i=0;i<radio.length;i++)
  {
     if (radio[i].checked)
     {
        vchecked = true;
        break;
    }
   }
   if (!vchecked)
   {
     alert("Belum Pilih Jenis Cetak Kartu Tanda Penduduk (KTP)!");
   }
   else
   {
      if(document.formktpwni.cb==undefined){setDocs(1);}else{setDocs(document.formktpwni.cb.length);}
      document.formktpwni.action="cetak_KTP_wni_mnl.jsp?flag=" + flag+"&nama_kel="+document.all["nkel"].value+"&no_kel="+document.all["no_kel"].value;
      document.formktpwni.submit();
   }
}

function back(flag)
{
   var vchecked;
   var radio = document.formktpwni.radiobutton;

 for (i=0;i<radio.length;i++)
  {
      if(document.formktpwni.cb==undefined){setDocs(1);}else{setDocs(document.formktpwni.cb.length);}
      document.all["start"].value = document.all["start"].value - 6;
      document.all["end"].value = document.all["end"].value - 6;
      document.formktpwni.action="cetak_KTP_wni_mnl.jsp?flag=" + flag+"&nama_kel="+document.all["nkel"].value+"&no_kel="+document.all["no_kel"].value;
      document.formktpwni.submit();
   }
}
function resetPage(obj) {
document.all['no_kel'].value=obj.value;
document.all['namakel'].value=obj.options[obj.selectedIndex].text;
document.all['nkel'].value=obj.options[obj.selectedIndex].text;
document.all['selidx'].value=obj.selectedIndex;
document.all['start'].value=0;
document.all['end'].value=0;
document.all['tot_rec'].value=0;
document.all['page_no'].value=0;
document.all['tot_page'].value=0;
return true;
}


