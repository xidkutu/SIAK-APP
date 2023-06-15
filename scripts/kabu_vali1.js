function blank()
{
	var invalid = "";
	var Max=2;
	str = frm.nama_kab.value;

        if(frm.no_prop.value == "")
	{
			alert("Kode Provinsi belum diisi!")
			frm.nama_prop.focus()
			return false
	}
	else if (frm.no_kab.value==invalid)
	{
		alert("Kode  Kabupaten/Kota belum diisi !");
		frm.no_kab.focus();
		frm.no_kab.value="";
		return false;
	}
	else if(frm.no_kab.value == 0)
	{
		alert("Kode Kabupaten/Kota tidak boleh dengan angka nol !.")
		frm.no_kab.focus();
		frm.no_kab.value="";
		return false;
	}
	else if(str==invalid)
	{
		alert("Nama Kabupaten/Kota belum diisi !");
		frm.nama_kab.focus();
		frm.nama_kab.value="";
		return false;
	}
}

function test1()
{
	for (i=0; i < frm.nama_kab.value.length; i++)
	{
		 if(!((frm.nama_kab.value.charAt(i) >= 'A' && frm.nama_kab.value.charAt(i) <= 'Z') || (frm.nama_kab.value.charAt(i) >= 'a' && frm.nama_kab.value.charAt(i) <= 'z') || (frm.nama_kab.value.charAt(i) == ' ')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   frm.nama_kab.focus()
		   frm.nama_kab.value=""
		}
	}
        return false
}

function test()
{
	if(isNaN(frm.no_kab.value))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		frm.no_kab.focus()
		frm.no_kab.value=""
	}
        return(false)
}

function able()
{
     if(frm.tam.disabled==true)
     {
       frm.tam.disabled=false
     }
}

function ex()
{
   v=window.history.length;
   history.go(-v);
}