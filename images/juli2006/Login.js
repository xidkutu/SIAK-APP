function space(s)
{
	for (i=0; i < s.value.length; i++)
	{
		if(s.value.charAt(i) == ' ')
		{
			s.focus()
			s.value=""
		}
	}
}