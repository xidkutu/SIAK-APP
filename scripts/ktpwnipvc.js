function checkedAll() {
  if(document.formktpwni.cb!=null && document.formktpwni.cb.length!=undefined) {
     for (i=0; i<document.formktpwni.cb.length; i++)  {
        document.formktpwni.cb[i].checked = document.formktpwni.cekcb.checked;
     }
  }
}
    extArray = new Array(".gif", ".jpg");
    function LimitAttach(form, file, image)
    {
        var filename =file;
        allowSubmit = false;
        if (!file) return;
        while (file.indexOf("\\") != -1)
           file = file.slice(file.indexOf("\\") + 1);
           ext = file.slice(file.indexOf(".")).toLowerCase();
       for (var i = 0; i < extArray.length; i++)
       {
           if (extArray[i] == ext) { allowSubmit = true; break; }
       }

       if (allowSubmit)
       {
            image.src = "file://"+filename;
            image.style.visibility='visible';
       }
       else
          alert("Please only upload files that end in types:  "
          + (extArray.join("  ")) + "\nPlease select a new "
          + "file to upload");
    }
function unchecked(len)
{
if(len==6 && document.all["member"].value=="2")
{
      if( !document.formktpwni.cb.checked && (document.all["imgfoto0"].src!= null
               || document.all["imgfoto0"].src!="") )
     {
          document.all["imgfoto0"].src="";


          document.all["imgfoto0"].style.visibility='hidden';

          document.all["uploadfile0"].value="";
          document.all["uploadfile0"].replaceAdjacentText("beforeBegin", "");

     }
}
else if(document.all["member"].value=="1")
{
      if( !document.formktpwni.cb.checked && (document.all["imgfoto"].src!= null
               || document.all["imgfoto"].src!="") )
     {
          document.all["imgfoto"].src="";
          document.all["imgfoto"].style.visibility='hidden';

          document.all["uploadfile"].style.visibility='hidden';
          //document.all["uploadfile0"].value="";
          //document.all["uploadfile0"].replaceAdjacentText("beforeBegin", "");

     }
     else
     {    alert("clear upload file")
//          document.all["uploadfile"].style.clear;
  //        document.all["uploadfile"].style.visibility='visible';
     }
}
else if(len!=6 &&document.all["member"].value=="2")
{
      if( !document.formktpwni.cb[len].checked && (document.all["imgfoto"+len].src!= null
               || document.all["imgfoto"+len].src!="") )
      {
          document.all["imgfoto"+len].src="";
          document.all["imgfoto"+len].style.visibility='hidden';

          document.all["uploadfile"+len].value="";
          document.all["uploadfile"+len].replaceAdjacentText("beforeBegin", "");
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
      document.formktpwni.action="cetak_KTP_WNI_PVC.jsp?flag=0&spesifik_nik="+document.formktpwni.spesifik_nik.value+"&nama_kel="+document.all["nkel"].value;
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
   // alert("all param"+document.all["param"].value);
    var param=document.all["param"].value;
    var onemember=false;
    var indexFoto = 0;
    var oneimgfoto = false;
    if(v>1)
    {
     for(i=0;i<v;i++)
     {
        if(document.formktpwni.cb[i].checked)
        {
           niks=document.formktpwni.cb[i].value;
           indexFoto = i;
           if(document.all["imgfoto"+indexFoto].src!=null && document.all["imgfoto"+indexFoto].src!="")
           {
               arr[x] = niks+"|"+document.all["imgfoto"+indexFoto].src;
           }
           x++;
           chk=true;
        }
     }
    }
    else if(document.formktpwni.cb==undefined)
    {
        chk=true;
        onemember=true;
        oneimgfoto = true;
        if(document.formktpwni.member.value==2)
        {
        niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"+indexFoto].src;
        }
        else if(document.formktpwni.member.value==1)
        {
        niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"].src;
        }
    }
    else
    {
        chk=true;
        onemember=true;
        if(document.formktpwni.member.value==2)
        {
            niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"+indexFoto].src;
        }
        else if(document.formktpwni.member.value==1)
        {
            niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"].src;
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
    var indexFoto = 0;
    var oneimgfoto = false;
    if(v>1)
    {
     if (document.all["imgdokumen"].src==null || document.all["imgdokumen"].src=="") {
        window.alert('Penandatangan Dokumen belum disetup');
        return;
     }
     for(i=0;i<v;i++)
     {
        if(document.formktpwni.cb[i].checked)
        {
           niks=document.formktpwni.cb[i].value;
           indexFoto = i;
           if(document.all["imgfoto"+indexFoto].src!=null && document.all["imgfoto"+indexFoto].src!="" &&
              document.all["imgperson"+indexFoto].src!=null && document.all["imgperson"+indexFoto].src!="")
           {
               arr[x] = niks+"|"+document.all["imgfoto"+indexFoto].src+"|"+document.all["imgperson"+indexFoto].src;
           }
           else
           {
               alert("Belum Pilih Foto / Tandatangan / Sidik Jari ke "+indexFoto+"!");
               return;
           }
           x++;
           chk=true;
        }
     }
    }
    else if(document.formktpwni.cb.length==undefined)
    {
        chk=true;
        onemember=true;
        oneimgfoto = true;
        if(document.formktpwni.member.value==2)
        {
        niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"+indexFoto].src+"|"+document.all["imgperson"+indexFoto].src;
        }
        else if(document.formktpwni.member.value==1)
        {
        niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"].src+"|"+document.all["imgperson"].src;
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
            niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"+indexFoto].src+"|"+document.all["imgperson"+indexFoto].src;
        }
        else if(document.formktpwni.member.value==1)
        {
            niks = document.formktpwni.cb.value+"|"+document.all["imgfoto"].src+"|"+document.all["imgperson"].src;
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

	var kendali = document.formktpwni.tampilkdl;
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

      if( oneimgfoto==false)
        {
            if ( document.all["imgfoto"+indexFoto].src==null || document.all["imgfoto"+indexFoto].src=="") {
            alert("Belum Pilih Foto!");
            return;
            }
            if ( document.all["imgperson"+indexFoto].src==null || document.all["imgperson"+indexFoto].src=="") {
            alert("Belum Pilih Tandatangan / Sidik Jari!");
            return;
            }
        }
        else if( oneimgfoto==true &&  document.formktpwni.member.value==1)
        {
            if (document.all["imgfoto"].src==null || document.all["imgfoto"].src=="") {
               alert("Belum Pilih Foto!");
            return;
            }
            if (document.all["imgperson"].src==null || document.all["imgperson"].src=="") {
               alert("Belum Pilih Tandatangan / Sidik Jari!");
            return;
            }
        }
        else if( oneimgfoto==true && document.formktpwni.member.value==2)
        {
            if ( document.all["imgfoto0"].src==null || document.all["imgfoto0"].src=="") {
            alert("Belum Pilih Foto!");
            return;
            }
            if ( document.all["imgperson0"].src==null || document.all["imgperson0"].src=="") {
               alert("Belum Pilih Tandatangan / Sidik Jari!");
            return;
            }
        }

        {
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
            //alert(penandatangan)
            window.open("cetak_KTP_Lampiran_PVC.jsp?kewarganegaraan=WNI&radiobutton="+document.all['stat_print'].value+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&nama_kec="+document.all["nama_kec"].value+"&cb="+param+"&imgdokumen="+document.all["imgdokumen"].src+"&nama_kel="+document.all["nkel"].value+ "&no_kel="+document.formktpwni.no_kel.value + "&selidx=" + document.all['selidx'].value+penandatangan+"&tmpkendali="+kendaliValue, '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no' );
        }
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
      document.formktpwni.action="cetak_KTP_WNI_PVC.jsp?flag=" + flag+"&nama_kel="+document.all["nkel"].value+"&no_kel="+document.all["no_kel"].value;//+"&param="+document.all["param"].value;
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
      document.all["start"].value = document.all["start"].value - 5;
      document.all["end"].value = document.all["end"].value - 5;
      document.formktpwni.action="cetak_KTP_WNI_PVC.jsp?flag=" + flag+"&nama_kel="+document.all["nkel"].value+"&no_kel="+document.all["no_kel"].value;//+"&param="+document.all["param"].value;
      document.formktpwni.submit();
   }
}

function resetPage(obj) {
document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;document.all['nkel'].value=obj.options[obj.selectedIndex].text;document.all['selidx'].value=obj.selectedIndex;document.all['start'].value=0;document.all['end'].value=0;document.all['tot_rec'].value=0;document.all['page_no'].value=0;document.all['tot_page'].value=0;
return true;
}
