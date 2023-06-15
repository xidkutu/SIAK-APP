function val()
{
str = domain2324222.value;

if(domain2323223.value=="")
{
alert("Kode Propinsi belum diisi !");
domain2323223.focus();
}

else if(!(str==""))
{
//alert("Nama Propinsi belum diisi !");

   var temp = str;
   var obj = /^(\s*)([\W\w]*)(\b\s*$)(|[A-Za-z]\w*)$/;
   if (obj.test(temp)) 
   { temp = temp.replace(obj, '$2'); }
   var obj = / +/g;
   temp = temp.replace(obj, " ");
   str=temp;
no_kab.value=domain2323223.value;
nama_kab.value=str;
}
}