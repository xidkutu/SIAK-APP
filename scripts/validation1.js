// Client end Validations for Kecamatan,kelurahan

function validate(data,data1)
{
	s = data
	s1 = data1

	if(form1.no_prop.value == "")
	{
		alert("Kode Provinsi belum diisi!")
		form1.nama_prop.focus()
		return false
	}
	else if(form1.no_kab.value == "")
	{
		alert("Kode Kabupaten/Kota belum diisi!")
		form1.nama_kab.focus()
		return false
	}
	else if(form1.no_kec.value == "")
	{
		alert("Kode Kecamatan belum diisi!")
		form1.nama_kec.focus()
		return false
	}
	else if(form1.no_kel.value == "")
	{
		alert("Kode Desa/Kelurahan belum diisi!")
		form1.no_kel.focus()
		return false
	}
	else if(form1.no_kel.value == 0)
	{
		alert("Kode Desa/Kelurahan tidak boleh dengan angka nol !.")
		form1.no_kel.focus();
		form1.no_kel.value="";
		return false;
	}
	else if(form1.nama_kel.value == "")
	{
		alert("Nama Desa/Kelurahan belum diisi!")
		form1.nama_kel.focus()
		return false
	}


	else
	{
		if(parseInt(s.value,10) != s.value)
		{
			alert("Data Anda Salah, Silahkan Coba Lagi !")
			form1.no_kec.focus()
                        form1.no_kec.value=""
			form1.no_kel.focus()
                        form1.no_kel.value=""
                        return false
		}

		else
		{
			if(s1.value.length == "")
			{
				alert("Nama Kecamaten belum diisi !")
				form1.nama_kec.focus()
                                form1.nama_kec.value=""
	         		form1.nama_kel.focus()
                                form1.nama_kel.value=""
                                return false
			}
			else
			{
				if(!(parseInt(s1.value,10) != s1.value))
				{
					alert("Data Anda Salah, Silahkan Coba Lagi !")
					form1.nama_kel.focus()
					form1.nama_kel.value=""
					return false
				}
			}
		}
	}

	var temp = form1.nama_kel.value

	var obj = /^(\s*)([\W\w]*)(\b\s*$)/

	if (obj.test(temp))
	{
		temp = temp.replace(obj, '$2')
	}

	var obj = / +/g

	temp = temp.replace(obj, " ")

	if (temp == " ")
	{
		temp = ""
	}

}



function kab(frm)
{

var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;


frm.no_kab.value="";
frm.nama_kab.length=1;

for(i=1;i<=frm.kabtot.value;i++)
{

strpid="propid" + i;
strkid="kid" + i;
strknama="knama"+i;
objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];

alert(strpid);
alert(objpropid);
alert(frm.nama_prop.options[frm.nama_prop.selectedIndex].value);

  if  (objpropid.value==frm.nama_prop.options[frm.nama_prop.selectedIndex].value)
  {
alert('entered' + i);
       var itm = document.createElement("OPTION");
       itm.text=objkabnama.value;
       itm.value=objkabid.value;
       frm.nama_kab.add(itm);
    }
}
}

function test1()
{
	for (i=0; i < form1.nama_kel.value.length; i++)
	{
		 if(!((form1.nama_kel.value.charAt(i) >= 'A' && form1.nama_kel.value.charAt(i) <= 'Z') || (form1.nama_kel.value.charAt(i) >= 'a' && form1.nama_kel.value.charAt(i) <= 'z') || (form1.nama_kel.value.charAt(i) == ' ')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   form1.nama_kel.focus()
		   form1.nama_kel.value=""
		}
	}
        return false
}

function test()
{
	if(isNaN(form1.no_kel.value))
	{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		form1.no_kel.focus()
		form1.no_kel.value=""
	}
        return(false)
}

function able()
{
     if(form1.tam.disabled==true)
     {
       form1.tam.disabled=false
     }
}
function ex()
{
   v=window.history.length;
   history.go(-v);
}

function kec(frm)
{
var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();

var strpid,strkid,strkecid,strkecnama;


frm.no_kec.value="";
frm.nama_kec.length=1;

for(i=1;i<=frm.kectot.value;i++)
{

strpid="kec_propid" + i;
strkid="kec_kid" + i;
strkecid="kec_id" + i;
strkecnama="kec_nama"+i;



objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];



if ((objpropid.value==frm.nama_prop.options[frm.nama_prop.selectedIndex].value) && (objkabid.value==frm.nama_kab.options[frm.nama_kab.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec.add(itm);
        }}}