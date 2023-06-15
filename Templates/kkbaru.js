function suda()
{
var kksemula=nokksemula.no_kk_semula.value;
if (kksemula=="")
{
	alert("Kode Nomor Kartu Keluarga Semula belum diisi !");
	nokksemula.no_kk_semula.focus();
	nokksemula.no_kk_semula.select();
	return false;
}

if(isNaN(kksemula))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		nokksemula.no_kk_semula.focus();
                nokksemula.no_kk_semula.select();
	        return false;
	}
for(var i=0; i < kksemula.length; i++)
{
         if(kksemula.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 nokksemula.no_kk_semula.focus();
                 nokksemula.no_kk_semula.select();
	         return false;
               }
}
}

