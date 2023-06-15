function getBase() {
//base = "http://localhost/";
//base = "http://192.10.10.115/";
//base = "http://siakonline.depdagri.go.id/";
base = "http://siakoffline.depdagri.go.id/";
//base = "http://192.10.10.114/";
//base = "http://192.10.10.118:7003/";
// base = "http://tester2000/";
return base;
}

function getPropXML() {
  base = getBase();
  base = base + "setup_prop.xml";
  return base;
}

function getKabXML(prop_val) {
  base = getBase();
  base = base + "p"+prop_val+".xml";
  return base;
}

function getKecXML(prop_val, kab_val) {
  base = getBase();
  base = base + "kb"+prop_val+kab_val+".xml";
  return base;
}

function getKelXML(prop_val, kab_val, kec_val) {
  base = getBase();
  base = base + "kc"+prop_val+kab_val+kec_val+".xml";
  return base;
}

function getProps() {
  fileName = getPropXML();
  getXMLNodes(fileName, pilwil.naprop);
}

function trim(strText) {
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);
   return strText;
}
function getXMLNodes(fileName, obj) {
  var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  xmlDoc.async="false";
  xmlDoc.load(fileName);
  rows = xmlDoc.documentElement.childNodes;
  count = rows.length;
  for (i=0;i<count;i++) {
     row = rows.item(i).childNodes;
     var itm = document.createElement("OPTION");
     itm.value=row.item(0).text;
     itm.text=row.item(1).text;
     obj.add(itm);
  }
}

function getKelurahanItem(prop_val,kab_val,kec_val, kel_val, index) {
//alert(prop_val);
//alert(kab_val);
//alert(kec_val);
//alert(kel_val);
   fileName= getKelXML(prop_val,kab_val,kec_val);
   var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
   xmlDoc.async="false";
   xmlDoc.load(fileName);
   rows = xmlDoc.documentElement.childNodes;
   count = rows.length;
   for (i=0;i<count;i++) {
     row = rows.item(i).childNodes;
     if (row.item(0).text==kel_val) {
       itm=row.item(index).text;
       return itm;
     }
  }
  return '';
}

function ch_kab(prop_val, kab_obj, refreshKel)
{

  if ((trim(prop_val)!="") && (prop_val!=null)) {
     pilwil.nakab.length=1;
     pilwil.nkab.value="";
     if (refreshKel=="true") {
        pilwil.nakel.length=1;
        pilwil.nkel.value="";
     }
     var fileName= getKabXML(prop_val);
     getXMLNodes(fileName, kab_obj);
  }
}

function ch_kec(prop_val,kab_val, kec_obj, refreshKel)
{
  ch_kec(prop_val,kab_val, kec_obj, refreshKel, "false");
}

function ch_kec(prop_val,kab_val, kec_obj, refreshKel, dis_kab)
{
if ((trim(prop_val)!="") && (trim(kab_val)!="") && (prop_val!=null) && (kab_val!=null))
   {
   if (dis_kab=="false") {
     pilwil.nakec.length=1;
   }
   pilwil.nkec.value="";
   if (refreshKel=="true") {
      pilwil.nakel.length=1;
      pilwil.nkel.value="";
   }
   fileName= getKecXML(prop_val,kab_val);
   getXMLNodes(fileName, kec_obj);
  }
}

function ch_kel(prop_val,kab_val,kec_val, kel_obj) {
   ch_kel(prop_val,kab_val,kec_val, kel_obj, "false");
}
function ch_kel(prop_val,kab_val,kec_val, kel_obj, dis_kec) {
if ((prop_val!=null) && (trim(prop_val)!="") && (kab_val!=null) && (trim(kab_val)!="") && (kec_val!=null) && (trim(kec_val)!="")) {
   if (dis_kec=="false") {
      pilwil.nakel.length=1;
   }
   pilwil.nkel.value="";
   fileName= getKelXML(prop_val,kab_val,kec_val);
   getXMLNodes(fileName, kel_obj);
  }
}
function wilreset(objnoprop,objnokab,objnamakab,objnokec,objnamakec,objnokel,objnamakel) {
      objnoprop.value="";
      objnokab.value="";
      objnamakab.length=1;
      objnokec.value="";
      objnamakec.length=1;
     if (objnokel!=null) objnokel.value="";
     if (objnamakel!=null)  objnamakel.length=1;
}

function wilreset2(objnoprop,objnokab,objnamakab,objnokec,objnamakec)
{
      objnoprop.value="";
      objnokab.value="";
      objnamakab.length=1;
      objnokec.value="";
      objnamakec.length=1;
}

function wilreset0(objnoprop,objnokab,objnamakab)
{
      objnoprop.value="";
      objnokab.value="";
      objnamakab.length=1;
}


function reset(no_obj, nama_obj)
{
      no_obj.value="";
      nama_obj.value="";
      nama_obj.length=1;
}
function getObj(obj)
{
return document.all[obj];
}


  function pilih_prop_select_only(nama_prop_obj) {
    fileName= getPropXML();
    getXMLNodes(fileName, nama_prop_obj);
  }

 function pilih_kab_select_only(prop_obj, kab_obj, kec_obj, kel_obj)
{
    if ((prop_obj!=null) && (trim(prop_obj.value)!="")) {
      kab_obj.length = 1;
      kec_obj.length = 1;
      kel_obj.length = 1;
      fileName= getKabXML(prop_obj.value);
      getXMLNodes(fileName, kab_obj);
    }
  }

  function pilih_kec_select_only(prop_obj, kab_obj, kec_obj, kel_obj) {
    if ((prop_obj!=null) && (trim(prop_obj.value)!="") && (kab_obj!=null) && (trim(kab_obj.value)!="")) {
      kec_obj.length = 1;
      kel_obj.length = 1;
      fileName= getKecXML(prop_obj.value, kab_obj.value);
      getXMLNodes(fileName, kec_obj);
    }
  }

  function pilih_kel_select_only(prop_obj, kab_obj, kec_obj, kel_obj) {
    if ((prop_obj!=null) && (trim(prop_obj.value)!="") && (kab_obj!=null) && (trim(kab_obj.value)!="") && (kec_obj!=null) && (trim(kec_obj.value)!="")) {
      fileName= getKelXML(prop_obj.value, kab_obj.value, kec_obj.value);
      kel_obj.length=1;
      getXMLNodes(fileName, kel_obj);
    }
  }


  function pilih_prop_with_textbox(no_prop_obj, nama_prop_obj, no_kab_obj, nama_kab_obj, no_kec_obj, nama_kec_obj, no_kel_obj, nama_kel_obj) {

          no_prop_obj.value="";
          nama_prop_obj.length=1;
          if ((no_kab_obj!=null) && (nama_kab_obj!=null)) {
            no_kab_obj.value="";
            nama_kab_obj.length=1;
          }
          if ((no_kec_obj!=null) && (nama_kec_obj!=null)) {
            no_kec_obj.value="";
            nama_kec_obj.length=1;
          }
          if ((no_kel_obj!=null) && (nama_kel_obj!=null)) {
            no_kel_obj.value="";
            nama_kel_obj.length=1;
          }
          fileName= getPropXML();
          getXMLNodes(fileName, nama_prop_obj);

  }

  function pilih_kab_with_textbox(prop_val, no_kab_obj, nama_kab_obj, no_kec_obj, nama_kec_obj, no_kel_obj, nama_kel_obj) {
      if ((prop_val!=null) && (trim(prop_val)!="")) {
        no_kab_obj.value="";
        nama_kab_obj.length=1;
        if ((no_kec_obj!=null) && (nama_kec_obj!=null)) {
          no_kec_obj.value="";
          nama_kec_obj.length=1;
        }
        if ((no_kel_obj!=null) && (nama_kel_obj!=null)) {
          no_kel_obj.value="";
          nama_kel_obj.length=1;
        }
        fileName= getKabXML(prop_val);
        getXMLNodes(fileName, nama_kab_obj);
      }
  }


  function pilih_kec_with_textbox(prop_val, kab_val, no_kec_obj, nama_kec_obj, no_kel_obj, nama_kel_obj) {
    if ((prop_val!=null) && (trim(prop_val)!="") && (kab_val!=null) && (trim(kab_val)!="")) {
      no_kec_obj.value="";
      nama_kec_obj.length=1;
      if ((no_kel_obj!=null) && (nama_kel_obj!=null)) {
        no_kel_obj.value="";
        nama_kel_obj.length=1;
      }
      fileName= getKecXML(prop_val, kab_val);
      getXMLNodes(fileName, nama_kec_obj);
    }
  }

  function pilih_kel_with_textbox(prop_val, kab_val, kec_val, no_kel_obj, nama_kel_obj) {
    if ((prop_val!=null) && (trim(prop_val)!="") && (kab_val!=null) && (trim(kab_val)!="") && (kec_val!=null) && (trim(kec_val)!="")) {
      no_kel_obj.value="";
      nama_kel_obj.length=1;
      fileName= getKelXML(prop_val, kab_val, kec_val);
      getXMLNodes(fileName, nama_kel_obj);
    }
  }