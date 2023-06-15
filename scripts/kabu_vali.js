function blank()
{
//alert(domain232322.length);
var invalid = "";
var Max=2;


    while (frm.no_kab.value.substring(0,1) == ' ')
{
        frm.no_kab.value =frm.no_kab.value.substring(1, frm.no_kab.value.length);
}
while (frm.no_kab.value.substring(frm.no_kab.value.length-1,frm.no_kab.value.length) == ' ')
 {
      frm.no_kab.value = frm.no_kab.value.substring(0, frm.no_kab.value.length-1);
}

if(frm.no_kab.value.charAt(0)=='-')
				{
				alert("Data Anda Salah, Silahkan Coba Lagi !!" );
				frm.no_kab.focus();
				frm.no_kab.select();
				return false;
				}

if (frm.no_kab.value==invalid)
{
	alert("Kode Propinsi belum diisi !");
	frm.no_kab.focus();
	frm.no_kab.select();
	return false;
}
else if(frm.no_kab.value.length < Max)
		{
			if (parseInt(frm.no_kab.value,10)!= frm.no_kab.value)
			{
			alert("Data Anda Salah, Silahkan Coba Lagi !!");
			frm.no_kab.focus();
			frm.no_kab.select();
			return false;
			}
			else{
			alert("kode kecamatan hanya 2 digit !!");
			frm.no_kab.focus();
			frm.no_kab.select();
			return false}
		}

	else if (parseInt(frm.no_kab.value,10)!= frm.no_kab.value)
	{
	alert("Data Anda Salah, Silahkan Coba Lagi !!");
	frm.no_kab.focus();
	frm.no_kab.select();
	return false
	}




var invalid = "";
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
str = frm.nama_kab.value;

if(str==invalid)
{
alert("Nama Propinsi belum diisi !");
frm.nama_kab.focus();
frm.nama_kab.select();
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
   if(str.charAt(i)== parseInt(str.charAt(i),10))
{
alert("Data Anda Salah, Silahkan Coba Lagi !!  ");
			frm.nama_kab.focus();
			frm.nama_kab.select();
			return false;
}
   temp = "" + str.substring(i, i+1);
   }
   if(val.indexOf(temp) == "-1")
	{
			alert("Data Anda Salah, Silahkan Coba Lagi !!  "+ temp);
			frm.nama_kab.focus();
			frm.nama_kab.select();
			return false;
	}

	var temp = str;
   var obj = /^(\s*)([\W\w]*)(\b\s*$)(|[A-Za-z]\w*)$/;
   if (obj.test(temp))
   { temp = temp.replace(obj, '$2'); }
   var obj = / +/g;
   temp = temp.replace(obj, " ");
   str=temp;
	frm.no_kab_tmp.value=frm.no_kab.value;
	frm.nama_kab_tmp.value=str;
}

function test()
{
	if(isNaN(frm.no_kab.value))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		frm.no_kab.focus()
		frm.no_kab.value=""
		return(false)
	}
}

function test1()
{
	 if(!isNaN(frm.nama_kab.value))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!  ")
		frm.nama_kab.focus()
		frm.nama_kab.value=""
		return (false)
	}
}