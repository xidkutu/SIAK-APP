function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function hak() {
   hak(form1)
}
function hak(form1)
{
	if(trim(form1.pwd.value) == "")
	{
		alert("Kata kunci belum diisi !")
		form1.pwd.focus()
		form1.pwd.value=""
		return false
	}

	if(form1.pwd.value.length < 8)
	{
		alert("Kata kunci harus lebih dari 8 karakter  !")
		form1.pwd.focus()
		form1.pwd.value=""
		return false
	}

	if(trim(form1.konf_pwd.value) == "")
	{
		alert("Konfirmasi kata kunci belum diisi !")
		form1.konf_pwd.focus()
		form1.konf_pwd.value=""
		return false
	}
	if(trim(form1.pwd.value) != trim(form1.konf_pwd.value))
	{
		alert("Kata kunci/Konfirmasi kata kunci yang dimasukkan tidak sama !")
		form1.konf_pwd.value=""
		form1.pwd.value=""
		form1.pwd.focus()
		return false
	}
	if(form1.nama_lvl.options[0].selected == true)
	{
		alert("Tingkat Adm Pemerintahan belum diisi !.")
		form1.nama_lvl.focus()
		return false
	}

	if(form1.nama_lvl.options[2].selected == true &&  form1.naprop.disabled == false &&  form1.naprop.options[0].selected == true)
	{
		alert("Kode - Nama Propinsi belum diisi !.")
		form1.naprop.focus()
		return false
	}
	if(form1.nama_lvl.options[3].selected == true &&  form1.naprop.disabled == false &&  form1.naprop.options[0].selected == true)
	{
		alert("Kode - Nama Propinsi belum diisi !.")
		form1.naprop.focus()
		return false
	}

	if(form1.nama_lvl.options[4].selected == true &&  form1.naprop.disabled == false &&  form1.naprop.options[0].selected == true)
	{
		alert("Kode - Nama Propinsi belum diisi !.")
		form1.naprop.focus()
		return false
	}

	if(form1.nama_lvl.options[3].selected == true && form1.nakab.disabled == false && form1.nakab.options[0].selected == true)
	{
		alert("Kode - Nama Kabupaten/Kota belum diisi !.")
		form1.nakab.focus()
		return false
	}

	if(form1.nama_lvl.options[4].selected == true && form1.nakab.disabled == false  && form1.nakab.options[0].selected == true)
	{
		alert("Kode - Nama Kabupaten/Kota belum diisi !.")
		form1.nakab.focus()
		return false
	}

	if(form1.nama_lvl.options[4].selected == true && form1.nakec.disabled == false  && form1.nakec.options[0].selected == true)
	{
		alert("Kode - Nama Kecamatan belum diisi !.")
		form1.nakec.focus()
		return false
	}
	if(form1.nama_div.options[0].selected == true)
	{
		alert("Nama Devisi belum diisi !.")
		form1.nama_div.focus()
		return false
	}
	if(form1.jenis_mod.options[0].selected == true)
	{
		alert("Hak Akses  belum diisi !.")
		form1.jenis_mod.focus()
		return false
	}



  	/*if((form1.nama_lvl.options[1].selected == true && form1.nama_div.options[1].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true))
	{
		alert("Hak Akses hanya Buku Laporan atau  Statis Vital dan Laporan atau Statistik Nasional !")
		form1.jenis_mod.focus()
		return false
	}


	if((form1.nama_lvl.options[2].selected == true && form1.nama_div.options[1].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true))
	{
		alert("Hak Akses hanya Statis Vital dan Laporan atau Statistik Nasional !")
		form1.jenis_mod.focus()
		return false
	}

     if((form1.nama_lvl.options[2].selected == true && form1.nama_div.options[4].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true))
	{
		alert("Hak Akses hanya Persetujuan Pengguna !")
		form1.jenis_mod.focus()
		return false
	}
	if((form1.nama_lvl.options[3].selected == true && form1.nama_div.options[1].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Buku Laporan atau  Statis Vital dan Laporan !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[3].selected == true && form1.nama_div.options[2].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Dafduk WNA !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[3].selected == true && form1.nama_div.options[3].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Capil Lahir-Mati-Kawin-Cerai !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[3].selected == true && form1.nama_div.options[4].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Persetujuan Pengguna !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[3].selected == true && form1.nama_div.options[6].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Capil Cetak Ulang Akta !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[3].selected == true && form1.nama_div.options[5].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Dafduk Ubah Biodata/Cetak Ulang WNA !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[4].selected == true && form1.nama_div.options[1].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Buku Laporan atau Statistik Vital dan Laporan !")
		form1.jenis_mod.focus()
		return false
	}
	if((form1.nama_lvl.options[4].selected == true && form1.nama_div.options[3].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Capil Lahir-Mati !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[4].selected == true && form1.nama_div.options[2].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[5].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Dafduk WNI !")
		form1.jenis_mod.focus()
		return false
	}

	if((form1.nama_lvl.options[4].selected == true && form1.nama_div.options[5].selected == true) && (form1.jenis_mod.options[1].selected == true || form1.jenis_mod.options[2].selected == true || form1.jenis_mod.options[3].selected == true || form1.jenis_mod.options[4].selected == true || form1.jenis_mod.options[6].selected == true || form1.jenis_mod.options[7].selected == true || form1.jenis_mod.options[8].selected == true || form1.jenis_mod.options[9].selected == true || form1.jenis_mod.options[10].selected == true || form1.jenis_mod.options[11].selected == true || form1.jenis_mod.options[12].selected == true))
	{
		alert("Hak Akses hanya Dafduk Ubah Biodata/Cetak Ulang WNI !")
		form1.jenis_mod.focus()
		return false
	}*/

}

/*
 function setPermission(level_id,div_id)
   {
         switch(parseInt(div_id))
             {
           case 1:
               switch(parseInt(level_id))
                 {
                   case 1:
                  return("9,10,11");
                   case 2:
                   return("10,11");
                   case 3:
                   return("9,10");
                   case 4:
                   return("9,10");
                  default:
                       return("0");
                  }
           case 2:
                switch(parseInt(level_id))
                 {
                 case 3:
                  return("6");
                 case 4:
                   return("2");
                 default:
                  return("0");
                 }
          case 3:
              switch(parseInt(level_id))
                 {
                 case 3:
                  return("5");
                 case 4:
                   return("3");
                 default:
                  return("0");
                 }
           case 4:
                 switch(parseInt(level_id))
                 {
                 case 2:
                  return("1");
                 case 3:
                  return("1");
                 case 4:
                   return("1");
                 default:
                  return("0");
                 }
            case 5:
                 switch(parseInt(level_id))
                 {
                 case 3:
                  return("8,9");
                 case 4:
                   return("4,9");
                 default:
                  return("0");
                 }
            case 6:
                 switch(parseInt(level_id))
                 {
                 case 3:
                  return("7,9");
                  default:
                  return("0");
                 }
         }
}
*/

function createElement(obj, index, value) {
   var itm = document.createElement("OPTION");
   itm.value=index;
   itm.text= value;
   obj.add(itm);
}

function setPermission(obj, level_id,div_id)
   {
   var modules = new Array(12);
   modules[0] = "-- Pilih Hak Akses --";
   modules[1] = "1 - Persetujuan Pengguna";
   modules[2] = "2 - Dafduk WNI";
   modules[3] = "3 - Capil Lahir-Mati";
   modules[4] = "4 - Dafduk Ubah Biodata/Cetak Ulang WNI";
   modules[5] = "5 - Capil Lahir-Mati-Kawin-Cerai";
   modules[6] = "6 - Dafduk WNA";
   modules[7] = "7 - Capil Cetak Ulang Akta";
   modules[8] = "8 - Dafduk Ubah Biodata/Cetak Ulang WNA";
   modules[9] = "9 - Buku Laporan";
   modules[10] = "10 - Statistik Vital dan Laporan";
   modules[11] = "11 - Statistik Nasional";
   modules[12] = "12 - Administrasi Pengguna";
   modules[13] = "13 - Offline Data Sinkronisasi";

  // createElement(obj, 0, modules[0]);
  obj.length = 1;
if (document.all['offline'].value==0)
createElement(obj, 14, modules[13])
else
{
   switch(parseInt(div_id,10)) {
      case 1:
         switch(parseInt(level_id,10)) {
            case 1: createElement(obj, 10, modules[9]);
                    createElement(obj, 11, modules[10]);
                    createElement(obj, 12, modules[11]); return;
            case 2: createElement(obj, 11, modules[10]);
                    createElement(obj, 12, modules[11]); return;
            case 3: createElement(obj, 10, modules[9]);
                    createElement(obj, 11, modules[10]); return;
            case 4: createElement(obj, 10, modules[9]);
                    createElement(obj, 11, modules[10]); return;
         }
      case 2:
         switch(parseInt(level_id,10)) {
            case 3: createElement(obj, 7, modules[6]); return;
            case 4: createElement(obj, 3, modules[2]); return;
      }
      case 3:
         switch(parseInt(level_id,10)) {
            case 3: createElement(obj, 6, modules[5]); return;
            case 4: createElement(obj, 4, modules[3]); return;
         }
      case 4:
         switch(parseInt(level_id,10)) {
            case 2: createElement(obj, 2, modules[1]); return;
            case 3: createElement(obj, 2, modules[1]); return;
            case 4: createElement(obj, 2, modules[1]); return;
         }
      case 5:
         switch(parseInt(level_id,10)) {
            case 3: createElement(obj, 9, modules[8]);
                    createElement(obj, 10, modules[9]); return;
            case 4: createElement(obj, 5, modules[4]);
                    createElement(obj, 10, modules[9]); return;
         }
      case 6:
         switch(parseInt(level_id,10)) {
            case 3: createElement(obj, 8, modules[7]);
                    createElement(obj, 10, modules[9]); return;
         }
      case 7:
               createElement(obj, 13, modules[12]);
                 return;
   }
   }
}

function setDivision(obj, level_id)
   {
   var modules = new Array(7);
   modules[0] = "-- Pilih Divisi --";
   modules[1] = "1 - Umum";
   modules[2] = "2 - Operator Pendaftaran Penduduk";
   modules[3] = "3 - Operator Catatan Sipil";
   modules[4] = "4 - Supervisor";
   modules[5] = "5 - Supervisor Pendaftaran Penduduk";
   modules[6] = "6 - Supervisor Catatan Sipil";
   modules[7] = "7 - Reset User";

  // createElement(obj, 0, modules[0]);
  obj.length = 1;
  switch(parseInt(level_id,10)) {
     case 1: createElement(obj, 1, modules[1]);
             createElement(obj, 7, modules[7]);
              break;
     case 2: createElement(obj, 1, modules[1]);
             createElement(obj, 4, modules[4]);
             createElement(obj, 7, modules[7]);
             break;
     case 3: createElement(obj, 1, modules[1]);
             createElement(obj, 2, modules[2]);
             createElement(obj, 3, modules[3]);
             createElement(obj, 4, modules[4]);
             createElement(obj, 5, modules[5]);
             createElement(obj, 6, modules[6]);
            createElement(obj, 7, modules[7]);
            break;
     case 4: createElement(obj, 1, modules[1]);
             createElement(obj, 2, modules[2]);
             createElement(obj, 3, modules[3]);
             createElement(obj, 4, modules[4]);
             createElement(obj, 5, modules[5]);
             createElement(obj, 7, modules[7]);
             break;
  }
}

function splitString (stringToSplit,separator,indexselected)
{
   arrayOfStrings = stringToSplit.split(separator)

   for (var i=0; i < arrayOfStrings.length; i++)
   {
          if (arrayOfStrings[i]==indexselected)
          return(indexselected);
   }
   return("0");
}

function checkAccessRight(obj, level_id,div_id, idx)
{
document.all["jenis_mod"].selectedIndex=splitString(setPermission(obj, level_id,div_id),",",idx);
}

function levell() {
   level(form1)
}


function level(form1)
{
	if(trim(form1.nama_lvl.options[form1.nama_lvl.selectedIndex].value) == "0")
	{
                form1.naprop.selectedIndex=0;
                form1.nakab.selectedIndex=0;
                form1.nakec.selectedIndex=0;
                form1.nprop.value="";
                form1.nkab.value="";
                form1.nkec.value="";
		form1.naprop.disabled=true
		form1.nakab.disabled=true
		form1.nakec.disabled=true
	}
	if(trim(form1.nama_lvl.options[form1.nama_lvl.selectedIndex].value) == "1")
	{
                form1.naprop.selectedIndex=0;
                form1.nakab.selectedIndex=0;
                form1.nakec.selectedIndex=0;
                form1.nprop.value="";
                form1.nkab.value="";
                form1.nkec.value="";

		form1.naprop.disabled=true
		form1.nakab.disabled=true
		form1.nakec.disabled=true
	}
	if(trim(form1.nama_lvl.options[form1.nama_lvl.selectedIndex].value) == "2")
	{
		form1.naprop.disabled=false
		form1.nakab.disabled=true
		form1.nakec.disabled=true
	}
	if(trim(form1.nama_lvl.options[form1.nama_lvl.selectedIndex].value) == "3")
	{
		form1.naprop.disabled=false
		form1.nakab.disabled=false
		form1.nakec.disabled=true
	}
	if(trim(form1.nama_lvl.options[form1.nama_lvl.selectedIndex].value) == "4")
	{
		form1.naprop.disabled=false
		form1.nakab.disabled=false
		form1.nakec.disabled=false
	}
        setDivision(form1.nama_div, form1.nama_lvl.value);
}
