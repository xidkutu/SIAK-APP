function pilih_kab(frm)    //untuk pilih kabupaten
{
var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;

if(tp1.getSelectedIndex()==1)
{
frm.no_kab_ayh_suami.value="";
frm.nama_kab_ayh_suami.length=1;

  for(i=1;i<=frm.kabtot.value;i++)
  {
   strpid="propid" + i;
   strkid="kid" + i;
   strknama="knama"+i;

   objpropid=document.all[strpid];
   objkabid=document.all[strkid];
   objkabnama=document.all[strknama];

    if(objpropid.value==frm.nama_prop_ayh_suami.options[frm.nama_prop_ayh_suami.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab_ayh_suami.add(itm);
         }
  }
}
else if(tp1.getSelectedIndex()==2)
{
 frm.no_kab_ibu_suami.value="";
 frm.nama_kab_ibu_suami.length=1;

 for(i=1;i<=frm.kabtot1.value;i++)
 {
  strpid="propid_ibu_suami" + i;
  strkid="kid_ibu_suami" + i;
  strknama="knama_ibu_suami"+i;

  objpropid=document.all[strpid];
  objkabid=document.all[strkid];
  objkabnama=document.all[strknama];

  if  (objpropid.value==frm.nama_prop_ibu_suami.options[frm.nama_prop_ibu_suami.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab_ibu_suami.add(itm);
         }
}
}
else if(tp1.getSelectedIndex()==4)
{
frm.no_kab_ayh_istri.value="";
frm.nama_kab_ayh_istri.length=1;

for(i=1;i<=frm.kabtot2.value;i++)
{
strpid="propid_ayh_istri" + i;
strkid="kid_ayh_istri" + i;
strknama="knama_ayh_istri"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];


  if  (objpropid.value==frm.nama_prop_ayh_istri.options[frm.nama_prop_ayh_istri.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab_ayh_istri.add(itm);
         }
}

}
else if(tp1.getSelectedIndex()==5)
{
frm.no_kab_ibu_istri.value="";
frm.nama_kab_ibu_istri.length=1;

for(i=1;i<=frm.kabtot3.value;i++)
{
strpid="propid_ibu_istri" + i;
strkid="kid_ibu_istri" + i;
strknama="knama_ibu_istri"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];


  if  (objpropid.value==frm.nama_prop_ibu_istri.options[frm.nama_prop_ibu_istri.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab_ibu_istri.add(itm);
         }
}

}


}

function pilih_kec(frm)	//untuk pilih kecamatan
{

var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();

var strpid,strkid,strkecid,strkecnama;

if(tp1.getSelectedIndex()==1)
{
  frm.no_kec_ayh_suami.value="";
  frm.nama_kec_ayh_suami.length=1;

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

   if ((objpropid.value==frm.nama_prop_ayh_suami.options[frm.nama_prop_ayh_suami.selectedIndex].value) &&
       (objkabid.value==frm.nama_kab_ayh_suami.options[frm.nama_kab_ayh_suami.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec_ayh_suami.add(itm);

         }
  }
}
else if(tp1.getSelectedIndex()==2)
{
frm.no_kec_ibu_suami.value="";
frm.nama_kec_ibu_suami.length=1;

for(i=1;i<=frm.kectot1.value;i++)
{
strpid="kec_propid_ibu_suami" + i;
strkid="kec_kid_ibu_suami" + i;
strkecid="kec_id_ibu_suami" + i;
strkecnama="kec_nama_ibu_suami"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==frm.nama_prop_ibu_suami.options[frm.nama_prop_ibu_suami.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ibu_suami.options[frm.nama_kab_ibu_suami.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec_ibu_suami.add(itm);

         }
}
}
else if(tp1.getSelectedIndex()==4)
{
frm.no_kec_ayh_istri.value="";
frm.nama_kec_ayh_istri.length=1;

for(i=1;i<=frm.kectot2.value;i++)
{
strpid="kec_propid_ayh_istri" + i;
strkid="kec_kid_ayh_istri" + i;
strkecid="kec_id_ayh_istri" + i;
strkecnama="kec_nama_ayh_istri"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==frm.nama_prop_ayh_istri.options[frm.nama_prop_ayh_istri.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ayh_istri.options[frm.nama_kab_ayh_istri.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec_ayh_istri.add(itm);

         }
}

}
else if(tp1.getSelectedIndex()==5)
{
frm.no_kec_ibu_istri.value="";
frm.nama_kec_ibu_istri.length=1;

for(i=1;i<=frm.kectot3.value;i++)
{
strpid="kec_propid_ibu_istri" + i;
strkid="kec_kid_ibu_istri" + i;
strkecid="kec_id_ibu_istri" + i;
strkecnama="kec_nama_ibu_istri"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==frm.nama_prop_ibu_istri.options[frm.nama_prop_ibu_istri.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ibu_istri.options[frm.nama_kab_ibu_istri.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec_ibu_istri.add(itm);

         }
}

}


}

function pilih_kel(frm)	//untuk pilih kecamatan
{
var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkelid=new Object();
var objkelnama=new Object();

var strpid,strkid,strkecid,strkelid,strkelnama;

if(tp1.getSelectedIndex()==1)
{
frm.no_kel_ayh_suami.value="";
frm.nama_kel_ayh_suami.length=1;

  for(i=1;i<=frm.keltot.value;i++)
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

    if ((objpropid.value==frm.nama_prop_ayh_suami.options[frm.nama_prop_ayh_suami.selectedIndex].value) &&
        (objkabid.value==frm.nama_kab_ayh_suami.options[frm.nama_kab_ayh_suami.selectedIndex].value) &&
        (objkecid.value==frm.nama_kec_ayh_suami.options[frm.nama_kec_ayh_suami.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          frm.nama_kel_ayh_suami.add(itm);

         }
   }
}
else if(tp1.getSelectedIndex()==2)
{
frm.no_kel_ibu_suami.value="";
frm.nama_kel_ibu_suami.length=1;

for(i=1;i<=frm.keltot1.value;i++)
{
strpid="kel_propid_ibu_suami" + i;
strkid="kel_kabid_ibu_suami" + i;
strkecid="kel_kecid_ibu_suami" + i;
strkelid="kel_id_ibu_suami" + i;
strkelnama="kel_nama_ibu_suami" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkelid=document.all[strkelid];
objkelnama=document.all[strkelnama];

if ((objpropid.value==frm.nama_prop_ibu_suami.options[frm.nama_prop_ibu_suami.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ibu_suami.options[frm.nama_kab_ibu_suami.selectedIndex].value) &&
(objkecid.value==frm.nama_kec_ibu_suami.options[frm.nama_kec_ibu_suami.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          frm.nama_kel_ibu_suami.add(itm);

}
}
}
else if(tp1.getSelectedIndex()==4)
{
frm.no_kel_ayh_istri.value="";
frm.nama_kel_ayh_istri.length=1;

for(i=1;i<=frm.keltot2.value;i++)
{
strpid="kel_propid_ayh_istri" + i;
strkid="kel_kabid_ayh_istri" + i;
strkecid="kel_kecid_ayh_istri" + i;
strkelid="kel_id_ayh_istri" + i;
strkelnama="kel_nama_ayh_istri" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkelid=document.all[strkelid];
objkelnama=document.all[strkelnama];

if ((objpropid.value==frm.nama_prop_ayh_istri.options[frm.nama_prop_ayh_istri.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ayh_istri.options[frm.nama_kab_ayh_istri.selectedIndex].value) &&
(objkecid.value==frm.nama_kec_ayh_istri.options[frm.nama_kec_ayh_istri.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          frm.nama_kel_ayh_istri.add(itm);

}
}

}
else if(tp1.getSelectedIndex()==5)
{
frm.no_kel_ibu_istri.value="";
frm.nama_kel_ibu_istri.length=1;

for(i=1;i<=frm.keltot3.value;i++)
{
strpid="kel_propid_ibu_istri" + i;
strkid="kel_kabid_ibu_istri" + i;
strkecid="kel_kecid_ibu_istri" + i;
strkelid="kel_id_ibu_istri" + i;
strkelnama="kel_nama_ibu_istri" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkelid=document.all[strkelid];
objkelnama=document.all[strkelnama];

if ((objpropid.value==frm.nama_prop_ibu_istri.options[frm.nama_prop_ibu_istri.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ibu_istri.options[frm.nama_kab_ibu_istri.selectedIndex].value) &&
(objkecid.value==frm.nama_kec_ibu_istri.options[frm.nama_kec_ibu_istri.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          frm.nama_kel_ibu_istri.add(itm);

}
}

}


}

// Data Wilayah Listing for Data Perkawinan

function pilih_kab4(frm)    //untuk pilih kabupaten
{
var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;

frm.no_kab_pmka_agama.value="";
frm.nama_kab_pmka_agama.length=1;

for(i=1;i<=frm.kabtot4.value;i++)
{
strpid="propid_dt_kwn" + i;
strkid="kid_dt_kwn" + i;
strknama="knama_dt_kwn"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];


  if  (objpropid.value==frm.nama_prop_pmka_agama.options[frm.nama_prop_pmka_agama.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab_pmka_agama.add(itm);
         }
}}

function pilih_kec4(frm)	//untuk pilih kecamatan
{

var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();

var strpid,strkid,strkecid,strkecnama;

frm.no_kec_pmka_agama.value="";
frm.nama_kec_pmka_agama.length=1;

for(i=1;i<=frm.kectot4.value;i++)
{
strpid="kec_propid_dt_kwn" + i;
strkid="kec_kid_dt_kwn" + i;
strkecid="kec_id_dt_kwn" + i;
strkecnama="kec_nama_dt_kwn"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==frm.nama_prop_pmka_agama.options[frm.nama_prop_pmka_agama.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_pmka_agama.options[frm.nama_kab_pmka_agama.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec_pmka_agama.add(itm);

         }
}}

function pilih_kel4(frm)	//untuk pilih kecamatan
{
var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkelid=new Object();
var objkelnama=new Object();

var strpid,strkid,strkecid,strkelid,strkelnama;

frm.no_kel_pmka_agama.value="";
frm.nama_kel_pmka_agama.length=1;

for(i=1;i<=frm.keltot4.value;i++)
{
strpid="kel_propid_dt_kwn" + i;
strkid="kel_kabid_dt_kwn" + i;
strkecid="kel_kecid_dt_kwn" + i;
strkelid="kel_id_dt_kwn" + i;
strkelnama="kel_nama_dt_kwn" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkelid=document.all[strkelid];
objkelnama=document.all[strkelnama];

if ((objpropid.value==frm.nama_prop_pmka_agama.options[frm.nama_prop_pmka_agama.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_pmka_agama.options[frm.nama_kab_pmka_agama.selectedIndex].value) &&
(objkecid.value==frm.nama_kec_pmka_agama.options[frm.nama_kec_pmka_agama.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          frm.nama_kel_pmka_agama.add(itm);

}
}}