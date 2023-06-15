function noke()
{


if(isNaN(setupkec.no_kec.value))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" );
                setupkec.no_kec.value="";
		setupkec.no_kec.focus();
                return false;
	}

for(var i=0; i < setupkec.no_kec.value.length; i++)
{
         if(setupkec.no_kec.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" );
                 setupkec.no_kec.value="";
		 setupkec.no_kec.focus();
		 return false;
               }
}
if(setupkec.no_kec.value.length==2)
{
setupkec.no_kec.focus();
}

}