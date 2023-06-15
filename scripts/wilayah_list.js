function pilih_kab(frm)    //untuk pilih kabupaten
{
var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;

frm.no_kab.value="";
frm.nama_kab.length=1;

for(i=1;i<=frm.kabtot.value;i++)
{
strpid="propid" + i;
strkid="kid" + i;
strknama="knama"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];

 if  (objpropid.value==frm.nama_prop.options[frm.nama_prop.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab.add(itm);
         }
}}

function pilih_kec(frm)	//untuk pilih kecamatan
{
var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();

var strpid,strkid,strkecid,strkecnama;

frm.no_kec.value="";
frm.nama_kec.length=1;

for(i=1;i<=frm.kectot.value;i++)
{
strpid="kec_propid" + i;
strkid="kec_kid" + i;
strkecid="kec_id" + i;
strkecnama="kec_nama"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==frm.nama_prop.options[frm.nama_prop.selectedIndex].value) &&
(objkabid.value==frm.nama_kab.options[frm.nama_kab.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec.add(itm);
         }
}}
