document.oncontextmenu = new Function("return false")
var firedBefore = false;
var reMapKey = 600;
function doFullScreen(URLPage) {
        var myBar = "directories=no,location=no,menubar=no,scrollbars=no,status=no,titlebar=no,toolbar=no";
        var myOptions = "fullscreen=yes, resizable=no";
        var myFeatures = myBar + ',' + myOptions;
        //alert("open");
        window.open(URLPage, 'a', myFeatures);
       // window.onUnLoad = doClose;
        
       // doClose();
      }
function doClose () {
   self.opener=null;self.close();
//   window.opener.close();
//   window.opener = null;
  // window.opener.close();
}
function doKeyDown (e) {
  var myKeyCode      = e.keyCode;
  var mySrcElement   = e.srcElement;
  var isShiftPressed = e.shiftKey;
  var isCtrlPressed  = e.ctrlKey;
  var isAltPressed   = e.altKey;
  
  

  // Enter(13), Shift(16), Ctrl(17), Alt(18), CapsLock(20), P (80), F (70), O (79), F4 (114), F11(122), ESC(27) keys?
  if(isCtrlPressed||isAltPressed) {
     //alert("inside e.ctrlKey");
     window.event.returnValue=false;
     if ((myKeyCode!=17) && (myKeyCode!=18)) {
     
        if (window.event) {
           //alert("remap");
           window.event.keyCode = reMapKey;
        }
        event.returnValue = false;
        return false;
     }     
     
  }
  else
  {
  
   // alert("inside e.ctrlKey");
    //window.event.returnValue=true;
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
