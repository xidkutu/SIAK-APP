function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function setNamaLurah(idx)
{
var obj=new Object();
if (parseInt(idx,10)!=0)
{
obj.name=trim("namapej")+(idx-1);
return  (document.all[obj.name].value);
}
return("");
}

function setNipLurah(idx)
{
var obj=new Object();
if (parseInt(idx,10)!=0)
{
obj.name=trim("nippej")+(idx-1);
return  (document.all[obj.name].value);
}
return("");
}


function setJabatanLurah(idx)
{
var obj=new Object();
if (parseInt(idx,10)!=0)
{
obj.name=trim("pej")+(idx-1);
return  (document.all[obj.name].value);
}
return("");
}



function setNamaCamat(idx)
{
var obj=new Object();

if (parseInt(idx,10)!=0)
{

obj.name=trim("namacamat")+(idx-1);

return  (document.all[obj.name].value);
}
return("");
}

function setNipCamat(idx)
{
var obj=new Object();
if (parseInt(idx,10)!=0)
{
obj.name=trim("nipcamat")+(idx-1);
return  (document.all[obj.name].value);
}
return("");
}