function getText(object)
{
 if (object.selectedIndex!=0) return object.options[object.selectedIndex].text;
return "-";
}
