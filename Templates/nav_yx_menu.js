
// ------
var isIE4=false,isNN4=false;
var flagMenu="M",flagLink="L",flagCommand="C",flagSeparator="S",flagInfo="I",flagImageLink="iL",flagImageMenu="iM",flagImageCommand="iC";
var menuTimer=600,layerCount=0,imageCount=0;
var groupValid=true,instanceValid=true,instanceReady=false;
var turnOn="",turnOff="",frameWidth=0,frameHeight=0;
var pixelImage='<img src="images/onePixel.gif" width="1" height="1" border="0">';
var yxG=new Array(),gCount=0,yxGroup=null,yxI=new Array(),iCount=0,yxS=new Array(),sCount=0,yxStyle=null;
var lastInstance=-1,lastIndex=1,holdOn=false;

// ------
function getArray(_array) { return eval("window."+_array); }
function getID() { return "yxLayer"+(++layerCount)+""; }
function getName() { return "yxImage"+(++imageCount)+""; }
function showMessage(_message) { window.status=_message; }
function showError(_error) { showMessage(_error); groupValid=false; }
function checkBrowser() { isIE4=(document.all)?true:false; isNN4=(document.layers)?true:false; }

function setParameter() {
  if (isNN4) {
    turnOn="show"; turnOff="hidden";
  }
  else {
    turnOn="visible"; turnOff="hidden";
  }
}

function getGroup(_name) {
  var theGroup=null;

  for (var i=0; i<gCount; i++) {
    if (yxG[i].name==_name) { theGroup=yxG[i]; break; }
  }

  return theGroup;
}

function _getHolder(_name) {
  var holder=null;

  if (isIE4) {
    if (document.all[_name]) { holder=document.all[_name]; holder.css=holder.style; }
  }
  else {
    if (document.layers[_name]) { holder=document.layers[_name]; holder.css=holder; }
  }

  return holder;
}

function _makeHolder() {
  var holder=null;

  if (isIE4) {
    var layerID=getID();
    document.body.insertAdjacentHTML("BeforeEnd",('<div id="'+layerID+'" style="position:absolute; left:0; top:0; width:0; visibility:visible; z-index:1;"></div>'));
    holder=document.all[layerID];

    holder.css=holder.style;
  }
  else {
    holder=new Layer(1);

    holder.zIndex=1;
    holder.visibility="show";

    holder.left=0; holder.top=0;

    holder.css=holder;
  }

  return holder;
}

function getHolder(_name,_x,_y) {
  var holder=null;

  if (_name!="") { holder=_getHolder(_name); }
  if (holder==null) { holder=_makeHolder(); }

  moveLayerBy(holder,_x,_y);

  return holder;
}

function getStyle(_name) {
  _name=(_name=="")?"default":_name;
  for (var i=0; i<sCount; i++) {
    if (yxS[i].styleName==_name) { return yxS[i]; }
  }

  return yxStyle;
}

function getLength(_content) {
  var theLength=0;

  if (isIE4) {
    var layerID=getID();
    document.body.insertAdjacentHTML("BeforeEnd",('<div id="'+layerID+'" style="position:absolute; visibility:hidden;">'+_content+'</div>'));
    theLength=document.all[layerID].children[0].offsetWidth;
  }
  else {
    var layer=new Layer(1);
    layer.visibility="hidden";
    with (layer.document) {
      open(); writeln(_content); close();
    }

    theLength=layer.document.width;
  }

  return theLength;
}

function makeLayer(_width,_content,_color,_index,_holder) {
  var layer=null;

  if (isIE4) {
    var layerID=getID();
    _holder.insertAdjacentHTML("BeforeEnd",('<div id="'+layerID+'" style="position:absolute; left:0; top:0; width:'+_width+'; background-color:'+_color+'; visibility:hidden; z-index:'+_index+';">'+_content+'</div>'));
    layer=_holder.document.all[layerID];

    layer.css=layer.style;
  }
  else {
    layer=new Layer(_width,_holder);

    layer.zIndex=_index;
    layer.visibility="hidden";

    layer.left=-_width; layer.top=0;

    with (layer.document) {
      open(); writeln(_content); close();
    }

    layer.bgColor=_color;

    layer.css=layer;
  }

  return layer;
}

function moveLayerTo(_layer,_x,_y) {
  if (isIE4) {
    _layer.style.pixelLeft=_x; _layer.style.pixelTop=_y;
  }
  else {
    _layer.moveTo(_x,_y);
  }
}

function moveLayerBy(_layer,_x,_y) {
  if (isIE4) {
    _layer.style.pixelLeft+=_x; _layer.style.pixelTop+=_y;
  }
  else {
    _layer.moveBy(_x,_y);
  }
}

function makeSeparator(_separator,_width,_height,_form,_style) {
  var itemWidth=0,itemHeight=0,itemLayout="";

  if (_form==0) {
    itemWidth=_width-_style.spacing*2; itemHeight=2;
    itemLayout='<table align="left" width="'+itemWidth+'" height="2" cellpadding="0" cellspacing="0" border="0"><tr align="left" valign="top"><td bgcolor="'+_style.borderColorDark+'" width="'+itemWidth+'" height="1">'+pixelImage+'</td></tr><tr align="left" valign="top"><td bgcolor="'+_style.borderColorBright+'" width="'+itemWidth+'" height="1">'+pixelImage+'</td></tr></table>';
  }
  else {
    itemWidth=2; itemHeight=_height-_style.spacing*2;
    itemLayout='<table align="left" width="2" height="'+itemHeight+'" cellpadding="0" cellspacing="0" border="0"><tr align="left" valign="top"><td bgcolor="'+_style.borderColorDark+'" width="1" height="'+itemHeight+'">'+pixelImage+'</td><td bgcolor="'+_style.borderColorBright+'" width="1" height="'+itemHeight+'">'+pixelImage+'</td></tr></table>';
  }

  if (isIE4) {
    _separator.layer.innerHTML=itemLayout;
  }
  else {
    with (_separator.layer.document) {
      open(); writeln(itemLayout); close();
    }
  }

  _separator.width=itemWidth; _separator.height=itemHeight;
}

function setClip(_layer,_x1,_y1,_x2,_y2) {
  _layer.clip.left=_x1; _layer.clip.top=_y1;
  _layer.clip.width=_x2-_x1; _layer.clip.height=_y2-_y1;
}

function blurIt(_items) {
  var itemCount=_items.length;
  for (var i=0; i<itemCount; i++) {
    if (_items[i].layer.focused) {
      if (_items[i].type==flagMenu || _items[i].type==flagImageMenu) { _items[i].menu.hideMenu(); }

      _items[i].layer.turnColor(false);
      break;
    }
  }
}

function _initGroup() {
  showMessage("Parsing menu definitions");

  gCount=yxGroup.length;
  for (var i=0; i<gCount && groupValid; i++) {
    yxG[i]=new _groupOBJ(yxGroup[i]);
    yxG[i].readGroup();
  }

  if (groupValid) {
    yxStyle=new _styleOBJ("default",6,1,2,"#cccccc","#cccccc","#ffffff",1,"#f8f8f8","#666666","verdana,arial",14,"normal","none","#000000",1,7,7,"tag1r.gif","images/",100);

    showMessage("Parsed menu definitions");

    buildMenu();

    if (instanceValid) {
      instanceReady=true;

      if (isNN4) {
        frameWidth=window.innerWidth; frameHeight=window.innerHeight;
        window.onresize=resizeFrame;
      }

      showMessage("Menu activated");
    }
  }
}

function _addStyle(_styleName,_paddingWidth,_paddingHeight,_spacing,_spacingColor,_colorNormal,_colorHighlighted,_border,_borderColorBright,_borderColorDark,_textFont,_textSize,_textWeight,_textDecoration,_textColor,_tag,_tagWidth,_tagHeight,_tagImage,_imagePath,_widthRatio) {
  yxS[sCount++]=new _styleOBJ(_styleName,_paddingWidth,_paddingHeight,_spacing,_spacingColor,_colorNormal,_colorHighlighted,_border,_borderColorBright,_borderColorDark,_textFont,_textSize,_textWeight,_textDecoration,_textColor,_tag,_tagWidth,_tagHeight,_tagImage,_imagePath,_widthRatio);
}

function _addInstance(_name,_type,_position,_holder,_x,_y,_direction,_form,_initial,_target,_group,_style1,_style2) {
  if (instanceValid) {
    showMessage("Adding menu instance: ["+_name+"]");

    var iIndex=iCount++;
    yxI[iIndex]=new instanceOBJ(iIndex,_name,_type,_position,_holder,_x,_y,_direction,_form,_initial,_target,_group,_style1,_style2);

    if (yxI[iIndex].group!=null) {
      yxI[iIndex].makeInstance();
      if (yxI[iIndex].initial) { yxI[iIndex].showInstance(); }

      showMessage("Added menu instance: ["+_name+"]");
    }
    else {
      instanceValid=false;
      showError("Menu Group Not Found: ["+_group+"] for Instance ["+_name+"]");
    }
  }
}

function getInstance(_name) {
  for (var i=0; i<iCount; i++) {
    if (yxI[i].name==_name) { return i; break; }
  }

  return -1;
}

function resizeFrame() { if (window.innerWidth!=frameWidth || window.innerHeight!=frameHeight) { document.location.reload(); } }
function _hideInstance(_instance) { yxI[_instance].timer=eval('setTimeout("yxI['+_instance+'].hideInstance()",'+menuTimer+')'); }
function clearTimer(_instance) { clearTimeout(yxI[_instance].timer); }

function _openMenu(_name) {
  if (!holdOn && instanceReady) {
    holdOn=true;

    for (var i=0; i<iCount; i++) {
      if (yxI[i].name==_name) {
        yxI[i].showInstance();
      }
      else {
        yxI[i].hideInstance();
      }
    }

    holdOn=false;
  }
}

function _closeMenu(_name) {
  if (!holdOn && instanceReady) {
    holdOn=true;

    var iIndex=getInstance(_name);
    if (iIndex!=-1) {
      if (yxI[iIndex].shown) { _hideInstance(iIndex); }
    }

    holdOn=false;
  }
}

function _closeMenuNow(_name) {
  if (!holdOn && instanceReady) {
    holdOn=true;

    var iIndex=getInstance(_name);
    if (iIndex!=-1) {
      if (yxI[iIndex].shown) { yxI[iIndex].hideInstance(); }
    }

    holdOn=false;
  }
}

function _switchMenu(_name) {
  if (!holdOn && instanceReady) {
    holdOn=true;

    for (var i=0; i<iCount; i++) {
      if (yxI[i].name==_name) {
        if (yxI[i].shown) {
          yxI[i].hideInstance();
        }
        else {
          yxI[i].showInstance();
        }
      }
      else {
        yxI[i].hideInstance();
      }
    }

    holdOn=false;
  }
}

function _moveMenuTo(_name,_x,_y) {
  if (instanceReady) {
    var iIndex=getInstance(_name);
    if (iIndex!=-1) { yxI[iIndex].moveInstanceTo(_x,_y); }
  }
}

function _moveMenuBy(_name,_x,_y) {
  if (instanceReady) {
    var iIndex=getInstance(_name);
    if (iIndex!=-1) { yxI[iIndex].moveInstanceBy(_x,_y); }
  }
}

// ------
function _itemOBJ(_ITEM) {
  this.type=_ITEM[0];

  if (this.type!=flagSeparator) {
    this.name=_ITEM[1];

    if (this.type!=flagInfo) {
      this.help=_ITEM[2];
      this.value=_ITEM[3];

      if (this.type==flagMenu || this.type==flagImageMenu) {
        this.menu=new _menuOBJ(_ITEM[4],parseInt(_ITEM[5]));
        this.tag=_ITEM[6];
      }
      else {
        this.tag="0";
      }

      if (this.type==flagCommand || this.type==flagImageCommand || this.type==flagLink || this.type==flagImageLink) {
        this.onCodes=_ITEM[4]; this.outCodes=_ITEM[5];
      }

      if (this.type==flagImageLink || this.type==flagImageCommand) {
        this.initial=_ITEM[6]; this.swapping=_ITEM[7];
        this.imageWidth=parseInt(_ITEM[8]); this.imageHeight=parseInt(_ITEM[9]);
      }
      else if (this.type==flagImageMenu) {
        this.initial=_ITEM[7]; this.swapping=_ITEM[8];
        this.imageWidth=parseInt(_ITEM[9]); this.imageHeight=parseInt(_ITEM[10]);
      }
    }
  }
}

function _menuOBJ(_array,_width) {
  this.array=_array;
  this.width=_width;

  this.items=new Array();

  this.readMenu=readMenu;
}

function _groupOBJ(_GROUP) {
  this.name=_GROUP[0];

  this.menu=new _menuOBJ(_GROUP[1],parseInt(_GROUP[2]));

  this.readGroup=readGroup;
}

function _styleOBJ(_styleName,_paddingWidth,_paddingHeight,_spacing,_spacingColor,_colorNormal,_colorHighlighted,_border,_borderColorBright,_borderColorDark,_textFont,_textSize,_textWeight,_textDecoration,_textColor,_tag,_tagWidth,_tagHeight,_tagImage,_imagePath,_widthRatio) {
  this.styleName=_styleName;
  this.paddingWidth=_paddingWidth; this.paddingHeight=_paddingHeight;
  this.spacing=_spacing; this.spacingColor=_spacingColor;
  this.colorNormal=_colorNormal; this.colorHighlighted=_colorHighlighted;
  this.borderOn=(_border==0)?false:true; this.borderColorBright=_borderColorBright; this.borderColorDark=_borderColorDark;
  this.textFont=_textFont; this.textSize=_textSize; this.textWeight=_textWeight; this.textDecoration=_textDecoration; this.textColor=_textColor;
  this.tagOn=(_tag==0)?false:true; this.tagWidth=_tagWidth; this.tagHeight=_tagHeight; this.tagImage=_tagImage;
  this.imagePath=_imagePath;
  this.widthRatio=_widthRatio;
}

function styleOBJ(_style) {
  this.tagOpening='<span style="text-decoration:'+_style.textDecoration+'; font-size:'+_style.textSize+'px; color:'+_style.textColor+'; font-weight:'+_style.textWeight+'; font-family:'+_style.textFont+';">';
  this.tagClosing='</span>';
  this.tagImage='<td width="'+_style.tagWidth+'" align="left" valign="middle"><img src="'+_style.imagePath+_style.tagImage+'" width="'+_style.tagWidth+'" height="'+_style.tagHeight+'" border="0"></td>';
  this.tagDummy='<td width="'+_style.tagWidth+'" align="left" valign="middle">'+pixelImage+'</td>';
  this.paddingCol=(_style.paddingWidth==0)?'':('<td width="'+_style.paddingWidth+'">'+pixelImage+'</td>');
}

function itemOBJ(_instance,_type) {
  this.instance=_instance;
  this.type=_type;

  this.width=0; this.height=0;

  this.layer=null;

  this.makeItem=makeItem;
  this.showItem=showIt;
  this.hideItem=hideIt;
  this.moveItem=moveIt;

  if (this.type==flagMenu || this.type==flagImageMenu) {
    this.menu=new menuOBJ(this.instance,false);
  }
}

function padOBJ(_instance) {
  this.instance=_instance;

  this.x=0; this.y=0;

  this.width=0; this.height=0;

  this.layer=null;

  this.makePad=makePad;
  this.showPad=showIt;
  this.hidePad=hideIt;
  this.movePad=moveIt;
}

function menuOBJ(_instance,_initial) {
  this.instance=_instance;
  this.initial=_initial;

  this.shown=false;

  this.pad=new padOBJ(this.instance);
  this.items=new Array();

  this.makeMenu=makeMenu;
  this.showMenu=showMenu;
  this.hideMenu=hideMenu;
}

function instanceOBJ(_instance,_name,_type,_position,_holder,_x,_y,_direction,_form,_initial,_target,_group,_style1,_style2) {
  this.instance=_instance,
  this.name=_name;
  this.type=_type;
  this.position=_position;
  this.holder=getHolder(_holder,_x,_y);
  this.x=0; this.y=0;
  this.direction=_direction;
  this.form=_form;
  this.initial=(_initial==0)?false:true;
  this.target=(_target=="")?'':(' target="'+_target+'"');
  this.group=getGroup(_group);

  this.style=new Array();
  this.style[0]=getStyle(_style1); this.style[1]=getStyle(_style2);

  this.styleX=new Array();
  this.styleX[0]=new styleOBJ(this.style[0]); this.styleX[1]=new styleOBJ(this.style[1]);

  this.maxX=0; this.maxY=0; this.minX=0; this.minY=0;

  this.timer=-1;
  this.shown=false;

  this.menu=new menuOBJ(this.instance,this.initial);

  this.makeInstance=makeInstance;
  this.showInstance=showInstance;
  this.hideInstance=hideInstance;
  this.moveInstanceTo=moveInstanceTo;
  this.moveInstanceBy=moveInstanceBy;
}

// ------
function readMenu() {
  var theMenu=getArray(this.array);
  if (theMenu) {
    var menuLength=theMenu.length;
    for (var i=0; i<menuLength && groupValid; i++) {
      this.items[i]=new _itemOBJ(theMenu[i]);

      if (this.items[i].type==flagMenu || this.items[i].type==flagImageMenu) { this.items[i].menu.readMenu(); }
    }
  }
  else {
    showError("Menu Not Found: ["+this.array+"]");
  }
}

function readGroup() { this.menu.readMenu(); }
function showIt() { this.layer.css.visibility=turnOn; }
function hideIt() { this.layer.css.visibility=turnOff; }
function moveIt(_x,_y) { moveLayerTo(this.layer,_x,_y); }

function makeItem(item,_tag,_width,_index,_form,_active,_level) {
  var instance=yxI[this.instance],iStyle=instance.style[_level],iStyleX=instance.styleX[_level],holder=instance.holder;
  var itemBar="",itemIt=""
  var paddingSpan=(((iStyle.paddingWidth==0)?1:3)+((_tag)?1:0));
  var paddingRow="",tagContent="",barWidth=(item.type==flagSeparator)?2:(_width+((_tag)?iStyle.tagWidth:0)+iStyle.paddingWidth*2);

  if (item.type==flagSeparator) {
    itemBar='<table align="left" width="2" height="2" cellpadding="0" cellspacing="0" border="0"><tr><td width="2" height="2"></td></tr></table>';
  }
  else {
    tagContent=(_tag)?(((item.type==flagImageMenu)||(item.type==flagMenu))?((item.tag=="0")?iStyleX.tagDummy:iStyleX.tagImage):iStyleX.tagDummy):"";

    if (item.type==flagImageLink || item.type==flagImageMenu || item.type==flagImageCommand) {
      if (_form!=2) {
        var imageWidth=(item.imageWidth<=_width)?item.imageWidth:_width;
        var imageHeight=Math.floor(item.imageHeight*imageWidth/item.imageWidth);
      }
      else {
        var imageWidth=item.imageWidth,imageHeight=item.imageHeight;

        barWidth+=(imageWidth-_width);
      }

      var imageName=getName();
      itemIt='<img src="'+iStyle.imagePath+item.initial+'" name="'+imageName+'" width="'+imageWidth+'" height="'+imageHeight+'" border="0">'
    }
    else {
      itemIt=iStyleX.tagOpening+item.name+iStyleX.tagClosing;

      if (_form==2 && item.type!=flagInfo) {
        itemIt="<nobr>"+itemIt+"</nobr>";
        barWidth+=(getLength(itemIt)-_width);
      }
    }

    if (item.type!=flagInfo) {
      itemIt='<a href="'+((item.type==flagCommand || item.type==flagImageCommand)?'javascript:':'')+item.value+'" onMouseOver="'+((item.type!=flagMenu && item.type!=flagImageMenu)?item.onCodes:'')+';window.status='+"'"+item.help+"'"+';return true;"'+((item.type!=flagMenu && item.type!=flagImageMenu)?(' onMouseOut="'+item.outCodes+'"'):'')+((item.type==flagCommand || item.type==flagImageCommand)?'':instance.target)+'>'+itemIt+'</a>';
    }

    paddingRow=(iStyle.paddingHeight==0)?'':('<tr align="left" valign="top"><td colspan="'+paddingSpan+'" width="'+barWidth+'" height="'+iStyle.paddingHeight+'">'+pixelImage+'</td></tr>');

    itemBar='<table align="left" width="'+barWidth+'" cellpadding="0" cellspacing="0" border="0">'+paddingRow+'<tr align="'+((_form==0)?"left":"center")+'" valign="middle">'+((instance.direction==0||instance.direction==3)?'':tagContent)+iStyleX.paddingCol+'<td width="'+_width+'">'+itemIt+'</td>'+iStyleX.paddingCol+((instance.direction==0||instance.direction==3)?tagContent:'')+'</tr>'+paddingRow+'</table>';
  }

  this.layer=makeLayer(barWidth,itemBar,iStyle.colorNormal,_index,holder);

  this.layer.instance=this.instance;
  this.layer.type=item.type;
  this.layer.help=(item.type==flagSeparator || item.type==flagInfo)?"":item.help;
  this.layer.focused=false;
  this.layer.active=_active;

  this.layer.colorHighlighted=iStyle.colorHighlighted; this.layer.colorNormal=iStyle.colorNormal;

  if (item.type==flagImageLink || item.type==flagImageMenu || item.type==flagImageCommand) {
    this.layer.initial=iStyle.imagePath+item.initial; this.layer.swapping=iStyle.imagePath+item.swapping;
    this.layer.imageName=imageName;
  }

  this.layer.onmouseover=overItem;
  this.layer.onmouseout=outIt;
  this.layer.turnColor=turnIt;

  this.width=barWidth;
  this.height=(isIE4)?(this.layer.children[0].offsetHeight):(this.layer.document.height);
}

function makePad(_index,_active,_level) {
  var instance=yxI[this.instance],iStyle=instance.style[_level],holder=instance.holder;
  var menuPad=(iStyle.borderOn && iStyle.spacing>0)?('<table align="left" width="'+this.width+'" height="'+this.height+'" cellspacing="0" cellpadding="0" border="0"><tr align="left" valign="top"><td bgcolor="'+iStyle.borderColorBright+'" width="1" height="'+(this.height-1)+'" rowspan="2">'+pixelImage+'</td><td bgcolor="'+iStyle.borderColorBright+'" width="'+(this.width-2)+'" height="1">'+pixelImage+'</td><td bgcolor="'+iStyle.borderColorDark+'" width="1" height="'+(this.height-1)+'" rowspan="2">'+pixelImage+'</td></tr><tr align="left" valign="top"><td width="'+(this.width-2)+'" height="'+(this.height-2)+'">'+pixelImage+'</td></tr><tr align="left" valign="top"><td bgcolor="'+iStyle.borderColorDark+'" width="'+this.width+'" height="1" colspan="3">'+pixelImage+'</td></tr></table>'):('<table align="left" width="'+this.width+'" height="'+this.height+'" cellpadding="0" cellspacing="0" border="0"><tr><td>'+pixelImage+'</td></tr></table>');

  this.layer=makeLayer(this.width,menuPad,iStyle.spacingColor,_index,holder);

  this.layer.instance=this.instance;
  this.layer.active=_active;

  this.layer.onmouseover=overPad;
  this.layer.onmouseout=outIt;
}

function makeMenu(_x,_y,_menu,_index,_form,_parent,_level) {
  var instance=yxI[this.instance],iStyle=instance.style[_level],direction=instance.direction;
  var items=_menu.items,itemCount=items.length;
  var useTag=false;

  for (var i=0; i<itemCount; i++) {
    if (items[i].type==flagMenu || items[i].type==flagImageMenu) {
      useTag=(items[i].tag=="")?(iStyle.tagOn&&_form==0):((items[i].tag=="0")?false:true);
      if (useTag) { break; }
    }
  }

  var itemWidth=Math.floor(_menu.width*iStyle.widthRatio/100);
  if (_form==0) {
    this.pad.width=itemWidth+(iStyle.paddingWidth+iStyle.spacing)*2+((useTag)?iStyle.tagWidth:0);
    this.pad.height=iStyle.spacing;
  }
  else {
    this.pad.width=iStyle.spacing;
  }

  for (var i=0; i<itemCount; i++) {
    this.items[i]=new itemOBJ(this.instance,items[i].type);
    this.items[i].makeItem(items[i],useTag,itemWidth,_index+1,_form,this.initial,_level);

    if (_form==0) {
      this.pad.height+=(this.items[i].height+iStyle.spacing);
    }
    else {
      if (this.pad.height<(this.items[i].height+iStyle.spacing*2)) { this.pad.height=this.items[i].height+iStyle.spacing*2; }
      this.pad.width+=(this.items[i].width+iStyle.spacing);
    }
  }

  this.pad.makePad(_index,this.initial,_level);

  this.pad.x=_x-((direction==1||direction==2)?this.pad.width:0);
  this.pad.y=_y-((direction==2||direction==3)?this.pad.height:0);

  this.pad.movePad(this.pad.x,this.pad.y);

  if (isNN4) {
    this.pad.pminX=_parent.minX; this.pad.pminY=_parent.minY;
    this.pad.pmaxX=_parent.maxX; this.pad.pmaxY=_parent.maxY;

    this.pad.minX=(_parent.minX>this.pad.x)?this.pad.x:_parent.minX;
    this.pad.minY=(_parent.minY>this.pad.y)?this.pad.y:_parent.minY;
    this.pad.maxX=(_parent.maxX<this.pad.x+this.pad.width)?(this.pad.x+this.pad.width):_parent.maxX;
    this.pad.maxY=(_parent.maxY<this.pad.y+this.pad.height)?(this.pad.y+this.pad.height):_parent.maxY;
  }

  var itemX=this.pad.x+iStyle.spacing,itemY=this.pad.y+iStyle.spacing,subX=0,subY=0;
  for (var i=0; i<itemCount; i++) {
    this.items[i].layer.peer=this.items;
    this.items[i].moveItem(itemX,itemY);

    if (items[i].type==flagMenu || items[i].type==flagImageMenu) {
      if (_form==0) {
        subX=itemX+((direction==0||direction==3)?(this.items[i].width):0);
        subY=itemY+((direction==0||direction==1)?(-iStyle.spacing):(this.items[i].height+iStyle.spacing));
      }
      else {
        subX=itemX+((direction==0||direction==3)?(-iStyle.spacing):(this.items[i].width+iStyle.spacing));
        subY=itemY+((direction==0||direction==1)?(this.pad.height-iStyle.spacing):(-iStyle.spacing));
      }

      this.items[i].menu.makeMenu(subX,subY,items[i].menu,_index+2,0,this.pad,1);
      this.items[i].layer.menu=this.items[i].menu;
    }
    else if (items[i].type==flagSeparator) {
      makeSeparator(this.items[i],this.pad.width,this.pad.height,_form,iStyle);
    }

    if (_form==0) {
      itemY+=this.items[i].height+iStyle.spacing;
    }
    else {
      itemX+=this.items[i].width+iStyle.spacing;

      if (isIE4) {
        this.items[i].layer.style.height=this.pad.height-iStyle.spacing*2;
      }
      else {
        this.items[i].layer.clip.height=this.pad.height-iStyle.spacing*2;
      }
    }
  }
}

function showMenu() {
  if (isNN4) { setClip(yxI[this.instance].holder,this.pad.minX,this.pad.minY,this.pad.maxX,this.pad.maxY); }

  this.pad.showPad();

  var itemCount=this.items.length;
  for (var i=0; i<itemCount; i++) { this.items[i].showItem(); }

  this.shown=true;;
}

function hideMenu() {
  var items=this.items,pad=this.pad;

  if (this.initial) {
    blurIt(items);
  }
  else {
    var itemCount=items.length;
    for (var i=0; i<itemCount; i++) {
      if (items[i].type==flagMenu || items[i].type==flagImageMenu) {
        if (items[i].menu.shown) { items[i].menu.hideMenu(); }
      }

      items[i].hideItem();
      items[i].layer.turnColor(false);
    }

    pad.hidePad();

    if (isNN4) { setClip(yxI[this.instance].holder,pad.pminX,pad.pminY,pad.pmaxX,pad.pmaxY); }
  }

  this.shown=this.initial;
}

function makeInstance() { this.menu.makeMenu(this.x,this.y,this.group.menu,1,this.form,this,0); }

function showInstance() {
  clearTimer(this.instance);

  this.holder.css.zIndex=++lastIndex;

  if (!this.shown) {
    this.menu.showMenu();
    this.shown=true;
  }
  else {
    blurIt(this.menu.items);
  }

  lastInstance=this.instance;
}

function hideInstance() {
  clearTimer(this.instance);
  window.status=""; 

  if (this.shown) {
    this.menu.hideMenu();
    this.shown=this.initial;
    this.holder.css.zIndex=1;
  }
}

function moveInstanceTo(_x,_y) { clearTimer(this.instance); moveLayerTo(this.holder,_x,_y); }
function moveInstanceBy(_x,_y) { clearTimer(this.instance); moveLayerBy(this.holder,_x,_y); }

// ------
function turnIt(_mode) {
  if (this.type==flagImageLink || this.type==flagImageMenu || this.type==flagImageCommand) {
    this.document.images[this.imageName].src=(_mode)?this.swapping:this.initial;
  }
  else {
    if (isIE4) {
      this.style.backgroundColor=(_mode)?this.colorHighlighted:this.colorNormal;
    }
    else {
      this.bgColor=(_mode)?this.colorHighlighted:this.colorNormal;
    }
  }

  this.focused=_mode;
}

function overItem() {
  var instance=yxI[this.instance];

  clearTimer(this.instance);

  if (lastInstance!=this.instance && lastInstance!=-1) { yxI[lastInstance].hideInstance(); }

  if (this.active && instance.holder.css.zIndex<lastIndex) { instance.holder.css.zIndex=++lastIndex; }

  lastInstance=this.instance;

  if (this.focused) {
    if (this.type==flagMenu || this.type==flagImageMenu) { blurIt(this.menu.items); }
  }
  else {
    blurIt(this.peer);
  }

  if (this.type!=flagSeparator && this.type!=flagInfo) {
    this.turnColor(true);
    window.status=this.help;
  }

  if (this.type==flagMenu || this.type==flagImageMenu) { this.menu.showMenu(); }
}

function overPad() {
  var instance=yxI[this.instance];

  clearTimer(this.instance);

  if (lastInstance!=this.instance && lastInstance!=-1) { yxI[lastInstance].hideInstance(); }

  if (this.active && instance.holder.css.zIndex<lastIndex) { instance.holder.css.zIndex=++lastIndex; }

  lastInstance=this.instance;
}

function outIt() { _hideInstance(this.instance); }

// ------
function initGroup(_group) {
  checkBrowser();

  if (isIE4 || isNN4) {
    setParameter();

    yxGroup=getArray(_group);
    if (yxGroup) {
      setTimeout("_initGroup()",0);
    }
    else {
      showError("Menu Group Not Found: ["+_group+"]");
    }
  }
  else {
    showError("Sorry,you are not using IE4+ or NN4+");
  }
}

function addStyle(_styleName,_paddingWidth,_paddingHeight,_spacing,_spacingColor,_colorNormal,_colorHighlighted,_border,_borderColorBright,_borderColorDark,_textFont,_textSize,_textWeight,_textDecoration,_textColor,_tag,_tagWidth,_tagHeight,_tagImage,_imagePath,_widthRatio) {
  _addStyle(_styleName,_paddingWidth,_paddingHeight,_spacing,_spacingColor,_colorNormal,_colorHighlighted,_border,_borderColorBright,_borderColorDark,_textFont,_textSize,_textWeight,_textDecoration,_textColor,_tag,_tagWidth,_tagHeight,_tagImage,_imagePath,_widthRatio);
}

function addInstance(_name,_type,_position,_holder,_x,_y,_direction,_form,_initial,_target,_group,_style1,_style2) {
  _addInstance(_name,_type,_position,_holder,_x,_y,_direction,_form,_initial,_target,_group,_style1,_style2);
}

function addFrame(_name) { return; }

function openMenu(_fName,_iName) { _openMenu(_iName); }
function closeMenu(_fName,_iName) { _closeMenu(_iName); }
function closeMenuNow(_fName,_iName) { _closeMenuNow(_iName); }
function switchMenu(_fName,_iName) { _switchMenu(_iName); }
function moveMenuTo(_fName,_iName,_x,_y) { _moveMenuTo(_iName,_x,_y); }
function moveMenuBy(_fName,_iName,_x,_y) { _moveMenuBy(_iName,_x,_y); }
