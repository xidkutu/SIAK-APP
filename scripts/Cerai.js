function suamiistri()
{

	if(trim(form1.nik_suami.value) == "")
	{
		alert("NIK suami belum diisi !")
		tp1.setSelectedIndex(0)
		form1.nik_suami.focus()
		return false
	}
       if(form1.nik_suami.value.length != 16 && form1.nik_suami.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_suami.focus()
		return(false)
	}
	if(form1.nik_suami.value.substring(0,1) == 'A' && form1.nik_suami.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(0)
		form1.nik_suami.focus()
		return(false)
	}


	if(trim(form1.nik_istri.value) == "")
	{
		alert("NIK Istri belum diisi !")
		tp1.setSelectedIndex(1)
		form1.nik_istri.focus()
		return false
	}
       if(form1.nik_istri.value.length != 16 && form1.nik_istri.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(1)
		form1.nik_istri.focus()
		return(false)
	}
	if(form1.nik_istri.value.substring(0,1) == 'A' && form1.nik_istri.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(1)
		form1.nik_istri.focus()
		return(false)
	}

	if(trim(form1.nik_plpor.value) == "")
	{
		alert("NIK Pelapor belum diisi !")
		tp1.setSelectedIndex(2)
		form1.nik_plpor.focus()
		return false
	}

       if(form1.nik_plpor.value.length != 16 && form1.nik_plpor.value.substring(0,1) != 'A')
	{
		alert("Pengisian NIK 16 digit !")
		tp1.setSelectedIndex(2)
		form1.nik_plpor.focus()
		return(false)
	}

	if(form1.nik_plpor.value.substring(0,1) == 'A' && form1.nik_plpor.value.length != 17)
	{
		alert("Pengisian NIK 17 digit !")
		tp1.setSelectedIndex(2)
		form1.nik_plpor.focus()
		return(false)
	}

        document.form1.action="Perceraian_List.jsp";
        document.form1.submit();
        form1.kon.disabled=true;
        form1.sim.disabled = true;

}

function num1(s)
{
	for (i=0; i < s.value.length; i++)
	{
		if(!((s.value.charAt(i) >= 0 && s.value.charAt(i) <= 9 ) || (s.value.charAt(i) == 'A')))
		{
		   alert("Data Anda Salah, Silahkan Coba Lagi !")
		   s.focus()
		}
	}
        return false
}

function validateistri(nik)
{
var tmp_nik=trim(nik.value);

 if(tmp_nik!="")
{
	if(tmp_nik.substring(0,1) == 'A')
	{
           if ((parseInt(tmp_nik.substring(7,9),10)>=41) && (parseInt(tmp_nik.substring(7,9),10)<=71))
                null;
             else
               {
               alert("Nik Istri Salah !");
               nik.focus();
               return(false);
               }
	}

	if(tmp_nik.substring(0,1) != 'A')
	{
            if ((parseInt(tmp_nik.substring(6,8),10)>=41) && (parseInt(tmp_nik.substring(6,8),10)<=71))
                 null;
             else
               {
               alert("Nik Istri Salah !");
               nik.focus();
               return(false);
               }
	}
}
}

function validatesuami(nik)
{
var tmp_nik=trim(nik.value);

 if(tmp_nik!="")
 {
      if(tmp_nik.substring(0,1) == 'A')
	{
              if ((parseInt(tmp_nik.substring(7,9),10)>=1) && (parseInt(tmp_nik.substring(7,9),10)<=31))
                null;
             else
               {
               alert("Nik Suami Salah !");
               nik.focus();
               return(false);
               }
	}
	if(tmp_nik.substring(0,1) != 'A')
	{

          if ((parseInt(tmp_nik.substring(6,8),10)>=1) && (parseInt(tmp_nik.substring(6,8),10)<=31))
                  null;
             else
               {
               alert("Nik Suami Salah !");
               nik.focus();
               return(false);
               }

	}
}
}

function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}
