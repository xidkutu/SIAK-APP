function n_kap()
{
	if(datakelu.nama_kep.value=="")
	{
	 	alert("Nama Kepala Keluarga belum diisi !");
		datakelu.nama_kep.focus();
	 	datakelu.nama_kep.select();
	 	return false;
	}

	if(datakelu.alamat.value=="")
	{
		alert("Alamat belum diisi !");
		datakelu.alamat.focus();
		datakelu.alamat.value="";
		return false;
	}
/*
	if(datakelu.no_rt.value=="")
	{
		alert(" No RT belum diisi !");
		datakelu.no_rt.select();
		datakelu.no_rt.focus();
		return false;
	}

	if(datakelu.no_rt.value.length <3)
	{
		alert("kode Keluarga hanya RT 3 digit !!");
		datakelu.no_rt.focus();
		datakelu.no_rt.select();
		return false;
	}
*/
	if(datakelu.nama_kel.value=="")
	{
	      alert("Nama Kelurahan belum diisi !!");
	      datakelu.nama_kel.focus();
	      return false;
	}

/*For load*/
if(!(confirm("Nama Kepala Keluarga : "+ datakelu.nama_kep.value+ "\n\nAlamat : "+datakelu.alamat.value+/*"\n\nNo RT: "+datakelu.no_rt.value+*/" \n\n\n Apakah Data ini sudah benar ?")))
{
datakelu.nama_kep.focus();
return false;
}

}
function char(s)
{
	for (i=0; i < s.value.length; i++)
	{
		 if(!((s.value.charAt(i) >= 'A' && s.value.charAt(i) <= 'Z') || (s.value.charAt(i) >= 'a' && s.value.charAt(i) <= 'z') || (s.value.charAt(i) == ' ') || (s.value.charAt(i) == ',') || (s.value.charAt(i) == '.') || (s.value.charAt(i) == "'")))
		 {
		    alert("Data Anda Salah, Silahkan Coba Lagi !")
		    s.focus()
		    s.value=""
		}
	}
        return false
}

function num(s1)
{
	if(isNaN(s1.value))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		s1.focus()
		s1.value=""
	}
        return(false)
}

function char1(s)
{
	for (i=0; i < s.value.length; i++)
	{
		 if(!((s.value.charAt(i) >= 'A' && s.value.charAt(i) <= 'Z') || (s.value.charAt(i) >= 'a' && s.value.charAt(i) <= 'z') || (s.value.charAt(i) == ' ' || s.value.charAt(i) >= 0 && s.value.charAt(i) <= 9 || s.value.charAt(i) == '-' || s.value.charAt(i) == '+' || s.value.charAt(i) == '(' || s.value.charAt(i) == ')')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   s.focus()
		   s.value=""
		}
	}
        return false
}
function num1(s)
{
	for (i=0; i < s.value.length; i++)
	{
		if(!((s.value.charAt(i) >= 0 && s.value.charAt(i) <= 9 ) || s.value.charAt(i) == '-' || s.value.charAt(i) == '+' || s.value.charAt(i) == '(' || s.value.charAt(i) == ')'))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   s.focus()
		   s.value=""
		}
	}
        return false
}

function confKeluar()
{
if(confirm("Apakah benar anda akan keluar?? data keluarga(NO. KK) akan terhapus"))
{
 document.location='WNI_Menu.jsp';
}
}