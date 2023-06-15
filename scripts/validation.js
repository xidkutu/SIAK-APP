// Client end Validations for Kecamatan,kelurahan

function validate(data,data1)
{
	s = data
	s1 = data1

	if(s.value == "")
	{
		alert("Kode Kecamatan belum diisi!")
		form1.no_kec.focus()
		form1.no_kel.focus()
		return false
	}
	else
	{
		if(parseInt(s.value,10) != s.value)
		{
			alert("Please enter numeric values only!")
			form1.no_kec.focus()
                        form1.no_kec.value=""
			form1.no_kel.focus()
                        form1.no_kel.value=""
                        return false
		}
		else if(s.value.length < 2)
		{
			alert("Kode Kecamatan hanya 2 digit!")
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
					alert("Please enter characters only!")
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

	form1.no_kel_temp.value = form1.no_kel.value
	form1.nama_kel_temp.value = temp
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