var totsel_kb,totsel_kc,totsel_kl;

function pilih_kab()    //untuk pilih kabupaten
{
var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;
var selkabctr=0;
document.all['no_kab'].value="";
document.all['nama_kab'].length=1;

//tambahan
//if( document.all['level'].value!="" && document.all['level'].value>=3)
//{

if(document.all['no_kec']!=null)
{
document.all['no_kec'].value="";
document.all['nama_kec'].length=1;
}
//}
if(document.all['no_kel']!=null)
{
document.all['no_kel'].value="";
document.all['nama_kel'].length=1;
}
//end tambahan

for(i=1;i<=document.all['kabtot'].value;i++)
{

strpid="propid" + i;
strkid="kid" + i;
strknama="knama"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];

  if  (objpropid.value==document.all['nama_prop'].options[document.all['nama_prop'].selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          document.all['nama_kab'].add(itm);
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

document.all['no_kec'].value="";
document.all['nama_kec'].length=1;

//tambahan
if(document.all['no_kel']!=null)
{
document.all['no_kel'].value="";
document.all['nama_kel'].length=1;
}
//end tambaha
for(i=1;i<=document.all['kectot'].value;i++)
{
strkecid="kec_id" + i;
strkecnama="kec_nama"+i;
strkid="kec_kid" + i;
strpid="kec_propid" + i;


objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ( (objpropid.value==document.all['no_prop'].value) && (objkabid.value==document.all['no_kab'].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          document.all['nama_kec'].add(itm);
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

document.all['no_kel'].value="";
document.all['nama_kel'].length=1;

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

if ((objpropid.value==document.all['no_prop'].value) &&
(objkabid.value==document.all['no_kab'].value) &&
(objkecid.value==document.all['no_kec'].value))
{
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          document.all['nama_kel'].add(itm);
          selkelctr++;
}
}
totsel_kl=selkelctr;
}