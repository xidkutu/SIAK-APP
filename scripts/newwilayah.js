//added by Yopie
function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function ch_kab(prop_val,kab_obj)
{
if ((trim(prop_val)!="") && (prop_val!=null))
    {
var tot_kab=0;
var obj=new Object();
var obj_no=new Object();
var obj_nama=new Object();
obj.name="p"+prop_val;

tot_kab=document.all[obj.name].value;
//document.all['nama_kab_ibu'].length=1;
kab_obj.length=1;

   for(i=1;i<=tot_kab;i++)
    {

      obj_no.name="k"+prop_val+i;
      obj_nama.name="kn"+prop_val+i;
         var itm = document.createElement("OPTION");
          itm.text=document.all[obj_nama.name].value;
          itm.value=document.all[obj_no.name].value;
//          document.all['nama_kab_ibu'].add(itm);
          kab_obj.add(itm);
    }
    }
}


function ch_kec(prop_val,kab_val,kec_obj)
{
if ((trim(prop_val)!="") && (trim(kab_val)!="") && (prop_val!=null) && (kab_val!=null))
   {
var tot_kec=0;
var a=new Object();
var b=new Object();
var c=new Object();
var d=new Object();

a.name="q"+prop_val+kab_val;
tot_kec=document.all[a.name].value;

//document.all['nama_kec_ibu'].length=1;
kec_obj.length=1;

     for(i=1;i<=tot_kec;i++)
        {
               c.name="kc" + prop_val+kab_val+i;
               d.name="kcn" +  prop_val+kab_val+i;

              var itm = document.createElement("OPTION");
              itm.value=document.all[c.name].value;
              itm.text=document.all[d.name].value;
//              document.all['nama_kec_ibu'].add(itm);
              kec_obj.add(itm);
        }
   }
}

function ch_kel(prop_val,kab_val,kec_val,kel_obj)
{
if ((prop_val!=null) && (trim(prop_val)!="") && (kab_val!=null) && (trim(kab_val)!="")
   && (kec_val!=null) && (trim(kec_val)!=""))
   {
   var tot_kel=0;
   var a=new Object();
   var b=new Object();
   var c=new Object();
   var d=new Object();
   var e=new Object();

   a.name="r" + prop_val+kab_val+kec_val;

   tot_kel=document.all[a.name].value;

    kel_obj.length=1;

       for(i=1;i<=tot_kel;i++)
       {
              b.name="kl" + prop_val+kab_val+kec_val+i;
              c.name="kln" + prop_val+kab_val+kec_val+i;

              var itm = document.createElement("OPTION");
              itm.value=document.all[b.name].value;
              itm.text=document.all[c.name].value;
              kel_obj.add(itm);
       }
   }
}

function wilreset(objnoprop,objnokab,objnamakab,objnokec,objnamakec,objnokel,objnamakel)
{
      objnoprop.value="";
      objnokab.value="";
      objnamakab.length=1;
      objnokec.value="";
      objnamakec.length=1;

     if (objnokel!=null) objnokel.value="";
     if (objnamakel!=null)  objnamakel.length=1;
}

function getObj(obj)
{
return document.all[obj];
}
