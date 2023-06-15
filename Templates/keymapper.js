function doKeyDown (e)
{
  var myKeyCode      = e.keyCode;
  var mySrcElement   = e.srcElement;
  var isShiftPressed = e.shiftKey;
  var isCtrlPressed  = e.ctrlKey;
  var isAltPressed   = e.altKey;

  // Enter(13), Shift(16), Ctrl(17), Alt(18), CapsLock(20) keys?
  if(isCtrlPressed||isAltPressed)
  {
  //alert("inside e.ctrlKey");
  window.event.returnValue=false;
  	if (myKeyCode >= 13 && myKeyCode <= 20)
    {
    	event.returnValue = false;
      return false;
     }
  }
  else
  {
	window.event.returnValue=true;
  }

if (window.event.type=="help")
    {
         firedBefore=true;
    }

} // doKeyDown


function callKeyDown()
{
  if (!firedBefore)
  {
         doKeyDown(event);
  }
  else
  {
       firedBefore=!firedBefore
  }
}
