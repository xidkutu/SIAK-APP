function blank()
{
//alert(domain232322.length);
var invalid = "";
var Max=2;


    while (domain2323223.value.substring(0,1) == ' ') 
{
        domain2323223.value = domain2323223.value.substring(1, domain2323223.value.length);
}
while (domain2323223.value.substring(domain2323223.value.length-1,domain2323223.value.length) == ' ')
 {
      domain2323223.value = domain2323223.value.substring(0, domain2323223.value.length-1);
}

if(domain2323223.value.charAt(0)=='-')
				{
				alert("Data Anda Salah, Silahkan Coba Lagi !!" );
				domain2323223.focus();
				domain2323223.select();
				return false;
				}
				
if (domain2323223.value==invalid)
{
	alert("Kode Propinsi belum diisi !");
	domain2323223.focus();
	domain2323223.select();
	return false;
}
else if(domain2323223.value.length < Max)
		{
			if (parseInt(domain2323223.value)!= domain2323223.value) 
			{
			alert("Data Anda Salah, Silahkan Coba Lagi !!");
			domain2323223.focus();
			domain2323223.select();
			return false;
			}
			else{
			alert("kode kecamatan hanya 2 digit !!");
			domain2323223.focus();
			domain2323223.select();
			return false}
		}

	else if (parseInt(domain2323223.value)!= domain2323223.value) 
	{
	alert("Data Anda Salah, Silahkan Coba Lagi !!");
	domain2323223.focus();
	domain2323223.select();
	return false
	}
	
	
	
	
var invalid = "";
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
str = domain2324222.value;

if(str==invalid)
{
alert("Nama Propinsi belum diisi !");
domain2324222.focus();
domain2324222.select();
return false;
}
   
   while (str.substring(0,1) == ' ') 
{
        str = str.substring(1, str.length);
}
while (str.substring(str.length-1,str.length) == ' ')
 {
      str= str.substring(0, str.length-1);
}

   for (var i=0; i < str.length; i++) 
   {
   if(str.charAt(i)== parseInt(str.charAt(i)))
{
alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			domain2324222.focus();
			domain2324222.select();
			return false;
}
   temp = "" + str.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1") 
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  "+ temp);
			domain2324222.focus();
			domain2324222.select();
			return false;
	}
	
	var temp = str;
   var obj = /^(\s*)([\W\w]*)(\b\s*$)(|[A-Za-z]\w*)$/;
   if (obj.test(temp)) 
   { temp = temp.replace(obj, '$2'); }
   var obj = / +/g;
   temp = temp.replace(obj, " ");
   str=temp;
	no_kab .value=domain2323223.value;
	nama_kab.value=str;


}
