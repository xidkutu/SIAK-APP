function namake()
{
s1=setupkec.nama_kec;

for (i=0; i < s1.value.length; i++)
	{
		 if(!((s1.value.charAt(i) >= 'A' && s1.value.charAt(i) <= 'Z') || (s1.value.charAt(i) >= 'a' && s1.value.charAt(i) <= 'z') || (s1.value.charAt(i) == ' ')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   setupkec.nama_kec.focus();
                   setupkec.nama_kec.select();
                   return false
		}
	}
}
