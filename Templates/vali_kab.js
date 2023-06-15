function validate()
{
var invalid = "";
var Max=2;
if (domain2323223.value==invalid)
{
	alert("Kode Propinsi belum diisi !");
}
else if(domain2323223.value.length < Max)
		{
			if (parseInt(domain2323223.value,10)!= domain2323223.value)
			{
			alert("Data Anda Salah, Silahkan Coba Lagi !!");
			}
			else{
			alert("kode kecamatan hanya 2 digit !!");}
		}

	else if (parseInt(domain2323223.value,10)!= domain2323223.value)
	{
	alert("Data Anda Salah, Silahkan Coba Lagi !!");
	}
var invalid = "";
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";

str = domain2324222.value;

if(str==invalid)
{
alert("Nama Propinsi belum diisi !");
}
   var temp = str;
   var obj = /^(\s*)([\W\w]*)(\b\s*$)(|[A-Za-z]\w*)$/;
   if (obj.test(temp))
   { temp = temp.replace(obj, '$2'); }
   var obj = / +/g;
   temp = temp.replace(obj, " ");
   str=temp;
   for (var i=0; i < str.length; i++) {
   temp = "" + str.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	//if(isNaN(str.value))

	{		alert("Data Anda Salah, Silahkan Coba Lagi !!  "+ temp);
	}

no_kab.value=domain2323223.value;
nama_kab.value=domain2324222.value;
}