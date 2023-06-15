function nop()
{
if(isNaN(setpuprof.no_prop.value))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
                setpuprof.no_prop.value="";
		setpuprof.no_prop.focus();
                return false;
	}


for(var i=0; i < setpuprof.no_prop.value.length; i++)
{
         if(setpuprof.no_prop.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" );
                 setpuprof.no_prop.value="";
		 setpuprof.no_prop.focus();
                 return false;
               }
}
if(setpuprof.no_prop.value.length==2)
{
setpuprof.nama_prop.focus();
}
}
