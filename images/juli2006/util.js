 var key="";

function checkedAll(cb, cekcb) {
  if(cb!=null && cb.length!=undefined) {
     for (i=0; i<cb.length; i++)  {
        cb[i].checked = cekcb.checked;
     }
  }
}

function selectAll(obj,obj1)
{
var param="";
param=document.all['allniks'].value;
	for(i=0;i<obj1.length;i++)
	   {
	      obj1[i].checked=obj.checked
              if (obj.checked)  param=param+"|"+obj1[i].value;
           }
if (obj.checked )  document.all['allniks'].value=param;
document.all['allniks'].value="";
}

function dynamicComboBox(comboBox, index, elements) {
  comboBox.length = 1;
  var indexElements = index;
  var valueElements = elements;
  count = indexElements.length;
 // alert("count="+count)
  for (i=0;i<count;i++) {
     var itm = document.createElement("OPTION");
 //    alert("index="+indexElements[i])
     itm.value=indexElements[i];
  //   alert("value="+valueElements[i])
     itm.text=valueElements[i];
     comboBox.add(itm);
  }
}

function setKey(e,obj)
{

if ((parseInt(e.keyCode,10)>=96 && parseInt(e.keyCode,10)<=105) || (parseInt(e.keyCode,10)>=48 && parseInt(e.keyCode,10)<=57)
||  (e.keyCode==13))
{

 if (e.keyCode==13)
 {
  if (trim(key)!="")
    {
	if (key<=obj.length)
	     {
               obj.selectedIndex=key;
          	key="";
	     }
  	  else
	   {
	    key="";
	    alert("Nomor Pekerjaan yang isi belum sesuai !");
	   }
    }
 }
 else
 {
  var str="";
if (e.keyCode>=96 && e.keyCode<=105)
  str=e.keyCode-48;
else
str=e.keyCode;
 key=trim(key)+String.fromCharCode(str)
 }
 }
}

function setupPekerjaan(comboBox, wn)
{
   if (wn==1) {
 comboBox.length = 1;
base = "http://siakoffline.depdagri.go.id/pkrjn.xml";
var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
xmlDoc.async="false";
xmlDoc.load(base);
rows = xmlDoc.documentElement.childNodes;
count = rows.length;
 for (i=0;i<count;i++) {
     row = rows.item(i).childNodes;
     var itm = document.createElement("OPTION");
     itm.value=row.item(0).text;
     itm.text=itm.value + " - " + row.item(1).text;
     comboBox.add(itm);
  }
}
else if (wn==2) {
 var arrIndexWna = new Array("1", "2", "3",
                          "4", "5", "6", "7",
                          "8", "9", "10", "11",
                          "12");
 var arrValueWna = new Array(
                          "1 - Trading and Industry",
                          "2 - Forestry",
                          "3 - Mining and Energy",
                          "4 - Public Work",
                          "5 - Farming",
                          "6 - Religion",
                          "7 - Bank and Financial",
                          "8 - Health and Society",
                          "9 - Tourism",
                          "10 - Transportation and Communication",
                          "11 - Culture and Education",
                          "12 - Others");
     dynamicComboBox(comboBox, arrIndexWna, arrValueWna)
  }


/* var arrIndexWni = new Array("1", "2", "3",
                          "4", "5", "6", "7",
                          "8", "9", "10", "11",
                          "12", "13", "14", "15","16");
 var arrValueWni = new Array(
                          "1 - Pelajar/Mahasiswa",
                          "2 - Mengurus Rumah Tangga",
                          "3 - Pensiunan",
                          "4 - Belum/Tidak Bekerja",
                          "5 - Petani/Pekebun",
                          "6 - Peternak",
                          "7 - Nelayan/Perikanan",
                          "8 - Industri",
                          "9 - Konstruksi",
                          "10 - Perdagangan",
                          "11 - Transportasi",
                          "12 - Pegawai Negeri Sipil",
                          "13 - Tentara Nasional Indonesia",
                          "14 - Kepolisian R.I.",
                          "15 - Jasa Lainnya",
                          "16 - Lainnya");
*/

}

function checkTanggal(dd, mm)
{

	if(dd.value.length > 1)
	{
		for(i = 0; i < dd.value.length;i++)
		{
			if(isNaN(dd.value.charAt(i)) || dd.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi!")
				dd.focus()
				dd.value=""
				return false
			}
		}
		if(dd.value > 31 || dd.value == 00)
		{
			alert("Isian tanggal tidak benar,periksa kembali!")
			dd.focus()
			dd.value=""
			return false
		}
		mm.focus()
		return false
	}
}

function checkBulan(mm, yyyy)
{
	if(mm.value.length > 1)
	{
		for(i = 0; i < mm.value.length;i++)
		{
			if(isNaN(mm.value.charAt(i)) || mm.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi!")
				mm.focus()
				mm.value=""
				return false
			}
		}
		if(mm.value > 12 || mm.value == 00)
		{
			alert("Isian bulan tidak benar,periksa kembali!")
			mm.focus()
			mm.value=""
			return false
		}


		yyyy.focus()
		return false
	}
}
function checkTahun(dd, mm, yyyy)
{
	d = new Date(mm.value+"/"+dd.value+"/"+yyyy.value)
	now = new Date()
	d1 = d.getDate()
	d2 = d.getMonth()+1
	d3 = now.getYear()


	if(yyyy.value.length > 3)
	{
		for(i = 0; i < yyyy.value.length;i++)
		{
			if(isNaN(yyyy.value.charAt(i)) || yyyy.value.charAt(i) == ' ')
			{
				alert("Data Anda Salah, Silahkan Coba Lagi!")
				yyyy.focus()
				yyyy.value=""
				return false
			}
		}
		  if(yyyy.value < 1800 || yyyy.value > d3 || yyyy.value == 0000)
		{
			alert("Isian tahun tidak benar,periksa kembali!")
			yyyy.focus()
			yyyy.value=""
			return false
		}


		if(d > now)
		{
			alert("Isian tahun tidak benar,periksa kembali!")
			yyyy.focus()
			yyyy.value=""
			mm.focus()
			mm.value=""
			dd.focus()
			dd.value=""

			return false
		}
	}
}


function validasiTanggal(dayObj, monthObj, yearObj, notMoreThanToday /*true / false*/, index /*valid>=0  not using tab index <0*/) {
        days = 30;
        y = parseInt(yearObj.value,10);
        m = parseInt(monthObj.value,10);
        d = parseInt(dayObj.value,10);
        if (((y%4)==0) && (m==2)){
          //kabisat
          days = 29
        } else {
          if ((((m%2)!=0) && (m<8)) || (((m%2)==0) && (m>=8))) {
             days = 31
          }
        }
        if ((d<0) || (d>days)) {
          alert("Isian tanggal tidak benar,periksa kembali!")
          if (index>=0) {
             tp1.setSelectedIndex(index)
	     dayObj.focus()
          }
	  dayObj.value=""
	  return false
        }
        if ((m<0) || (m>12)) {
          alert("Isian tanggal tidak benar,periksa kembali!")
          if (index>=0) {
             tp1.setSelectedIndex(index)
	     monthObj.focus(1)
          }
	  monthObj.value=""
	  return false
        }
        if (y<1000) {
          alert("Isian tanggal tidak benar,periksa kembali!")
          if (index>=0) {
             tp1.setSelectedIndex(index)
	     yearObj.focus()
          }
	  yearObj.value=""
	  return false
        }
        var theDay = new Date(y, m-1, d);
        var today = new Date();
        if (notMoreThanToday && theDay>today) {
          alert("Isian tanggal melebihi tanggal sekarang,periksa kembali!")
          if (index>=0) {
             tp1.setSelectedIndex(index)
             dayObj.focus()
          }
	  dayObj.value=""
	  monthObj.value=""
	  yearObj.value=""
	  return false
        }
}

function selectAndFocusControl(nik, tab, index) {
   if (tab!=null) {
      tab.setSelectedIndex(index)
      nik.focus()
   }
}

function validateNIK(nik, owner, tab, index) {
   if(nik.value == "") {
      alert("NIK "+owner+" belum diisi !")
      selectAndFocusControl(nik, tab, index)
      return false
   }
   if(nik.value.length != 16 && nik.value.substring(0,1) != 'A') {
      alert("Pengisian NIK 16 digit !")
      selectAndFocusControl(nik, tab, index)
      return false
   }
   if(nik.value.substring(0,1) == 'A' && nik.value.length != 17) {
      alert("Pengisian NIK 17 digit !")
      selectAndFocusControl(nik, tab, index)
      return false
   }
}

function setupPendidikanAkhir(comboBox, wn) {
 var arrIndexWni = new Array("1", "2", "3",
                          "4", "5", "6", "7",
                          "8", "9", "10");
 var arrValueWni = new Array(
                          "1 - Tidak/Belum Sekolah",
                          "2 - Tidak Tamat SD/Sederajat",
                          "3 - Tamat SD/Sederajat",
                          "4 - SLTP/Sederajat",
                          "5 - SLTA/Sederajat",
                          "6 - Diploma I/II",
                          "7 - Akademi/Diploma III/S. Muda",
                          "8 - Diploma IV/Strata I",
                          "9 - Strata II",
                          "10 - Strata III");

 var arrIndexWna = new Array("1", "2", "3",
                          "4", "5", "6", "7", "8");
 var arrValueWna = new Array(
                          "1 - ELementary",
                          "2 - Junior Height School",
                          "3 - Senior Hight School",
                          "4 - Diploma",
                          "5 - Bachelor",
                          "6 - Religion",
                          "7 - Philosophy of Doctor",
                          "8 - Others");
  if (wn==1) {
     dynamicComboBox(comboBox, arrIndexWni, arrValueWni)
  }
  else if (wn==2) {
     dynamicComboBox(comboBox, arrIndexWna, arrValueWna)
  }
}

function validateWNSuami(nik_suami)
{
var tmp_nik=trim(nik_suami.value);
 if(tmp_nik!="")
 {
      if(tmp_nik.substring(0,1) == 'A')
	{
              if (!((parseInt(tmp_nik.substring(7,9), 10)>=1) && (parseInt(tmp_nik.substring(7,9), 10)<=31)))

               {
               alert("Nik Suami Salah !");
               nik_suami.disabled = false;
               nik_suami.focus();
               return(false);
               }
	}
	if(tmp_nik.substring(0,1) != 'A')
	{

          if (!((parseInt(tmp_nik.substring(6,8), 10)>=1) && (parseInt(tmp_nik.substring(6,8), 10)<=31)))
               {
               alert("Nik Suami Salah !");
               nik_suami.disabled = false;
               nik_suami.focus();
               return(false);
               }

	}
}
}

function validateWNIstri(nik_istri)
{
var tmp_nik=trim(nik_istri.value);

 if(tmp_nik!="")
{
	if(tmp_nik.substring(0,1) == 'A')
	{
           if (!((parseInt(tmp_nik.substring(7,9), 10)>=41) && (parseInt(tmp_nik.substring(7,9), 10)<=71)))
               {
               alert("Nik Istri Salah !");
               nik_istri.disabled = false;
               nik_istri.focus();
               return(false);
               }

	}
	if(tmp_nik.substring(0,1) != 'A')
	{
            if (!((parseInt(tmp_nik.substring(6,8), 10)>=41) && (parseInt(tmp_nik.substring(6,8), 10)<=71)))
               {
               alert("Nik Istri Salah !");
               nik_istri.disabled = false;
               nik_istri.focus();
               return(false);
               }
	}
}
}

function validateWNIbu(nik_ibu,radiobtn)
{
var tmp_nik=trim(nik_ibu.value);

 if(tmp_nik!="")
{
	if(tmp_nik.substring(0,1) == 'A')
	{
           if ((parseInt(tmp_nik.substring(7,9), 10)>=41) && (parseInt(tmp_nik.substring(7,9), 10)<=71)) {
             radiobtn[1].disabled = false;
             radiobtn[1].checked = true;
             radiobtn[0].disabled = true;
           }
           else{
             alert("Nik Ibu Salah!");
             nik_ibu.focus();
             return false ;
           }
	}
	if(tmp_nik.substring(0,1)!= 'A')
	{
            if ((parseInt(tmp_nik.substring(6,8), 10)>=41) && (parseInt(tmp_nik.substring(6,8), 10)<=71)) {
              radiobtn[0].disabled = false;
              radiobtn[0].checked = true;
              radiobtn[1].disabled = true;
            }
             else
               {
               alert("Nik Ibu Salah!");
               nik_ibu.focus();
               return false ;
               }
	}
}
}

function validateWNAyah(nik_ayah,radiobtn)
{
var tmp_nik=trim(nik_ayah.value);

 if(tmp_nik!="")
 {
      if(tmp_nik.substring(0,1) == 'A')
	{
              if ((parseInt(tmp_nik.substring(7,9), 10)>=1) && (parseInt(tmp_nik.substring(7,9), 10)<=31)) {
                radiobtn[1].disabled = false;
                radiobtn[1].checked = true;
                radiobtn[0].disabled = true;
              } else {
                alert("Nik Ayah Salah!");
                nik_ayah.focus();
                return false ;
              }
	}
	if(tmp_nik.substring(0,1)!= 'A')
	{

          if ((parseInt(tmp_nik.substring(6,8), 10)>=1) && (parseInt(tmp_nik.substring(6,8), 10)<=31)) {
              radiobtn[0].disabled = false;
              radiobtn[0].checked = true;
              radiobtn[1].disabled = true;
          } else {
              alert("Nik Ayah Salah!");
              nik_ayah.focus();
              return false ;
          }

	}
}
}