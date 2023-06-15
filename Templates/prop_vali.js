function blank()
{

var invalid = "";

if (setpuprof.no_prop.value==invalid)
{
	alert("Kode Provinsi belum diisi !");
	setpuprof.no_prop.focus();
	setpuprof.no_prop.select();
	return false;
}
if((setpuprof.no_prop.value=="00") ||(setpuprof.no_prop.value=="0"))
{
                alert("Data Anda Salah, Silahkan Coba Lagi !!" );
                setpuprof.no_prop.select();
		setpuprof.no_prop.focus();
                return false;
}

var invalid = "";
var val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
str = setpuprof.nama_prop.value;

if(str==invalid)
{
alert("Nama Provinsi belum diisi !");
setpuprof.nama_prop.focus();
setpuprof.nama_prop.select();
return false;
}
for (i=0; i < str.length; i++)
	{
		 if(!((str.charAt(i) >= 'A' && str.charAt(i) <= 'Z') || (str.charAt(i) >= 'a' && str.charAt(i) <= 'z') || (str.charAt(i) == ' ')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   setpuprof.nama_prop.focus();
                   setpuprof.nama_prop.select();
                   return false;
		}
	}


}
