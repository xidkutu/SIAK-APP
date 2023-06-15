function ubah()
{
	if(form1.psw_lama.value == "")
	{
		alert("Kata kunci Lama belum diisi !")
		form1.psw_lama.focus()
		form1.psw_lama.value=""
		return false
	}	
	
	if(form1.psw_lama.value.length < 8)
	{
		alert("Kata kunci Lama harus lebih dari 8 karakter  !")
		form1.psw_lama.focus()
		form1.psw_lama.value=""
		return false
	}
	if(form1.psw_baru.value == "")
	{
		alert("Kata kunci Baru belum diisi !")
		form1.psw_baru.focus()
		form1.psw_baru.value=""
		return false
	}	
	
	if(form1.psw_baru.value.length < 8)
	{
		alert("Kata kunci Baru harus lebih dari 8 karakter  !")
		form1.psw_baru.focus()
		form1.psw_baru.value=""
		return false
	}	
	if(form1.ketik_psw_baru.value == "")
	{
		alert("Ketik Ulang Kata kunci Baru belum diisi !")
		form1.ketik_psw_baru.focus()
		form1.ketik_psw_baru.value=""
		return false
	}	
	
	if(form1.psw_baru.value != form1.ketik_psw_baru.value)
	{
		alert("Kata kunci Baru/Ketik Ulang Kata kunci Baru yang dimasukkan tidak sama !")
		form1.psw_baru.value=""
		form1.ketik_psw_baru.value=""	
		form1.psw_baru.focus()
		return false
	}
	
}