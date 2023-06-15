// Client end Validations for Kecamatan,kelurahan

function validate(data,data1)
{
var s = data
var s1 = data1
                        if(s.value.length == "")
			{
				alert("Kode Kecamatan belum diisi !")
				setupkec.no_kec.focus();
				setupkec.no_kec.focus();
                                return false
			}
                        if((s.value == "0") || (s.value == "00"))
			{
				alert("Kode Kecamatan belum diisi !")
				setupkec.no_kec.focus();
				setupkec.no_kec.focus();
                                return false
			}

			if(s1.value.length == "")
			{
				alert("Nama Kecamatan belum diisi !")
				setupkec.nama_kec.focus();
				setupkec.nama_kec.focus();
                                return false
			}

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




if(setupkec.no_prop.value=="" )
{
alert("Kode Provinsi belum diisi!")
		setupkec.nama_prop.focus();
		 return false;
}
if(setupkec.no_kab.value=="" )
{
alert("Kode Kabupaten belum diisi!")
		setupkec.nama_kab.focus();
		 return false;
}
}

function pilih_kab(frm)    //untuk pilih kabupaten
{
var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;

var v=frm;
//alert(v);
setupkec.no_kab.value="";
setupkec.nama_kab.length=1;


for(i=1;i<=v;i++)
{

strpid="propid" + i;
strkid="kid" + i;
strknama="knama"+i;
objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];

   if (objpropid.value==setupkec.nama_prop.options[setupkec.nama_prop.selectedIndex].value)
         {

          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          setupkec.nama_kab.add(itm);
         }
}

}