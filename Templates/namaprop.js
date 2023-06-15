function namap()
{
str = setpuprof.nama_prop.value;
for (i=0; i < str.length; i++)
	{
		 if(!((str.charAt(i) >= 'A' && str.charAt(i) <= 'Z') || (str.charAt(i) >= 'a' && str.charAt(i) <= 'z') || (str.charAt(i) == ' ')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
                   setpuprof.nama_prop.value="";
		   setpuprof.nama_prop.focus();
                   return false;
		}
	}
}
