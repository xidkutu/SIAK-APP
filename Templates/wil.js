var totsel_p,totsel_kb,totsel_kc,totsel_kl;
/*
function pilih_kab()    //untuk pilih kabupaten
{
var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;
var selkabctr=0;

document.all['no_kab_ibu'].value="";
document.all['nama_kab_ibu'].length=1;

for(i=1;i<=document.all['kabtot'].value;i++)
{

strpid="propid" + i;
strkid="kid" + i;
strknama="knama"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];

  if  (objpropid.value==document.all['nama_prop_ibu'].options[document.all['nama_prop_ibu'].selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          document.all['nama_kab_ibu'].add(itm);
selkabctr++;
         }
}
totsel_kb=selkabctr;
}

function pilih_kec()	//untuk pilih kecamatan
{
var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();
var selkecctr=0;
var strpid,strkid,strkecid,strkecnama;

document.all['no_kec_ibu'].value="";
document.all['nama_kec_ibu'].length=1;

for (i=1;i<=document.all['kectot'].value;i++)
{
strkecid="kec_id" + i;
strkecnama="kec_nama"+i;
strkid="kec_kid" + i;
strpid="kec_propid" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==document.all['nama_prop_ibu'].options[document.all['nama_prop_ibu'].selectedIndex].value) && (objkabid.value==document.all['nama_kab_ibu'].options[document.all['nama_kab_ibu'].selectedIndex].value))
         {

          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          document.all['nama_kec_ibu'].add(itm);
             selkecctr++;
         }
}
totsel_kc=selkecctr;
}

function pilih_kel()	//untuk pilih kecamatan
{

var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkelid=new Object();
var objkelnama=new Object();
var selkelctr=0
var strpid,strkid,strkecid,strkelid,strkelnama;

document.all['no_kel_ibu'].value="";
document.all['nama_kel_ibu'].length=1;

for(i=1;i<=document.all['keltot'].value;i++)
{
strpid="kel_propid" + i;
strkid="kel_kabid" + i;
strkecid="kel_kecid" + i;
strkelid="kel_id" + i;
strkelnama="kel_nama" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkelid=document.all[strkelid];
objkelnama=document.all[strkelnama];

if ((objpropid.value==document.all['nama_prop_ibu'].options[document.all['nama_prop_ibu'].selectedIndex].value) &&
(objkabid.value==document.all['nama_kab_ibu'].options[document.all['nama_kab_ibu'].selectedIndex].value) &&
(objkecid.value==document.all['nama_kec_ibu'].options[document.all['nama_kec_ibu'].selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          document.all['nama_kel_ibu'].add(itm);
          selkelctr++;
}
}
totsel_kl=selkelctr;
}


function ch_kab(prop_val)
{

var tot_kab=0;
var obj=new Object();
var obj_no=new Object();
var obj_nama=new Object();
obj.name="p"+prop_val;

tot_kab=document.all[obj.name].value;
document.all['nama_kab_ibu'].length=1;

   for(i=1;i<=tot_kab;i++)
    {

      obj_no.name="k"+prop_val+i;
      obj_nama.name="kn"+prop_val+i;
         var itm = document.createElement("OPTION");
          itm.text=document.all[obj_nama.name].value;
          itm.value=document.all[obj_no.name].value;
          document.all['nama_kab_ibu'].add(itm);
    }
}


function ch_kec(prop_val,kab_val)
{
var tot_kec=0;
var a=new Object();
var b=new Object();
var c=new Object();
var d=new Object();

a.name="q"+prop_val+kab_val;
tot_kec=document.all[a.name].value;
document.all['nama_kec_ibu'].length=1;
     for(i=1;i<=tot_kec;i++)
        {
               c.name="kc" + prop_val+kab_val+i;
               d.name="kcn" +  prop_val+kab_val+i;

              var itm = document.createElement("OPTION");
              itm.value=document.all[c.name].value;
              itm.text=document.all[d.name].value;
              document.all['nama_kec_ibu'].add(itm);
        }
}

function ch_kel(prop_val,kab_val,kec_val)
{
   var tot_kel=0;
   var a=new Object();
   var b=new Object();
   var c=new Object();
   var d=new Object();
   var e=new Object();

   a.name="r" + prop_val+kab_val+kec_val;
   tot_kel=document.all[a.name].value;
   document.all['nama_kel_ibu'].length=1;

       for(i=1;i<=tot_kel;i++)
       {
              b.name="kl" + prop_val+kab_val+kec_val+i;
              c.name="kln" + prop_val+kab_val+kec_val+i;

              var itm = document.createElement("OPTION");
              itm.value=document.all[b.name].value;
              itm.text=document.all[c.name].value;
              document.all['nama_kel_ibu'].add(itm);
       }
}

function ch_prop(prop_code)
{
var idx=parseInt(document.all['klasf_pndh'].selectedIndex)

if (((idx==1) || (idx==2) || (idx==3) || (idx==4)) &&  (prop_code!=document.all['no_prop'].value))
    {
      alert("Diluar pilihan klasifikasi pindah !");
       document.all['no_prop_ibu'].value=document.all['no_prop'].value;
//        ch_kab(document.all['no_prop'].value);
        document.all['nama_kab_ibu'].length=1;
        document.all['nama_kec_ibu'].length=1;
        document.all['nama_kel_ibu'].length=1;
      //  document.all['nama_prop_ibu'].options[getSelectedIndex()].selected=true;
        document.all['nama_prop_ibu'].selectedIndex=0;
    }
}
*/
function getSelectedIndex()
{
   for(i=0;i<=document.all['prop_tot'].value;i++)
    {
    if (document.all['nama_prop_ibu'].options[i].value=document.all['no_prop'].value)
        return i;
    }
}

function set_prop(prop_code)
{
var idx=parseInt(document.all['klasf_pndh'].selectedIndex,10);

  if (((idx==1) || (idx==2) || (idx==3) || (idx==4)) && (prop_code!=document.all['no_prop'].value))
    {
      alert("Diluar pilihan klasifikasi pindah !");
      document.all['no_prop_ibu'].value=document.all['no_prop'].value;
      document.all['nama_kab_ibu'].length=1;
      document.all['nama_kec_ibu'].length=1;
      document.all['nama_kel_ibu'].length=1;
      document.all['nama_prop_ibu'].selectedIndex=0;
      document.all['nama_prop_ibu'].focus();
      return false;
    }
}


function set_kab(kab_code)
{
var idx=parseInt(document.all['klasf_pndh'].selectedIndex,10);
  if (((idx==1) || (idx==2) || (idx==3)) && (kab_code!=document.all['no_kab'].value))
    {
      alert("Diluar pilihan klasifikasi pindah !");
      document.all['no_kab_ibu'].value=document.all['no_kab'].value;
      document.all['nama_kec_ibu'].length=1;
      document.all['nama_kel_ibu'].length=1;
      document.all['nama_kab_ibu'].selectedIndex=0;
      document.all['nama_kab_ibu'].focus();
      return false;
    }
}

function set_kec(kec_code)
{
var idx=parseInt(document.all['klasf_pndh'].selectedIndex,10);
 if (((idx==1) || (idx==2)) && (kec_code!=document.all['no_kec'].value))
    {
         alert("Diluar pilihan klasifikasi pindah !");
         document.all['no_kec_ibu'].value=document.all['no_kec'].value;
         document.all['nama_kel_ibu'].length=1;
         document.all['nama_kec_ibu'].selectedIndex=0;
         document.all['nama_kec_ibu'].focus();
         return false;
    }
}

function set_kel(kel_code)
{
var idx=parseInt(document.all['klasf_pndh'].selectedIndex,10);
if ((idx==2) && (kel_code==document.all['no_kel'].value))
{
         alert("Pilihan Desa/Kelurahan salah !");
         document.all['nama_kel_ibu'].selectedIndex=0;
         document.all['nama_kel_ibu'].focus();
         return false;
}
}

function getSelectedIndexKab(prop_code)
{
var obj=new Object()
obj.name="p"+prop_code;

  for(i=0;i<document.all[obj.name].value;i++)
    {
    if (document.all['nama_kab_ibu'].options[i].value=document.all['no_kab'].value)
      {
       return i;
      }
    }
}


function pilih_kel_validate()
{
   if (document.all['source'].value=="WNI")
   {
       if (document.all["nama_kel1"].selectedIndex==0)
            {
         alert("Desa/Kelurahan belum dipilih !");
         document.all["nama_kel1"].focus();
           return false;
            }
   }
}

function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}
