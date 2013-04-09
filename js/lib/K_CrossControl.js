// http://www.step1.cn/map/Step1Map.js
// http://www.step1.cn/googleapi/map/total.html#K_CrossControl

// converted for Maps API version 2

// See also http://www.step1.cn/map/cross.txt
//
// Added this code to place the K_CrossControl on the map
//   var crossControl=new K_CrossControl();
//   map.addControl(crossControl);

// ====================================================================
// _toPixel(_number) - convert a number to a pixel string
function _toPixel(a){
	return Math.round(a)+"px"
}

// _setAbsPosition(_element,_point) -
function _setAbsPosition(a,b){
	var c=a.style;
	c.position="absolute";
	c.left=_toPixel(b.x);
	c.top=_toPixel(b.y)
}

// _setWidthHeightStyle(_element,_size) -
function _setWidthHeightStyle(a,b){
	var c=a.style;
	c.width=_toPixel(b.width);
	c.height=_toPixel(b.height)
}

// _getOwnerDocument() -
function _getOwnerDocument(a){
	return(a?a.ownerDocument:null) || document
}

// _appendChild(_element,_child) -
function _appendChild(a,b){
	a.appendChild(b)
}

// _createElement(_elementType,_parent,_absPosition,_widthHeight) -
// _elementType - string - type of element
// _parent - DOM element - container
// _absPosition - GPoint - absolute position of element in container
// _widthHeight - GSize - width and height of element
function _createElement(a,b,c,d){
	var e=_getOwnerDocument(b).createElement(a);
	if(b)_appendChild(b,e);
	if(c)_setAbsPosition(e,c);
	if(d)_setWidthHeightStyle(e,d);
	return e
}

// ====================================================================
function K_CrossControl(length,size,color,image) {
	this.length=length || 8;
	this.size=size || 1;
	if(color) {
		this.color=color;
	}
	else {
		this.color="black";
	}
	if(image) {
		this.image=image;
	}
	else {
		this.image="/wsimages/crosshair.gif";
	}
}

K_CrossControl.prototype=new GControl();

K_CrossControl.prototype.initialize=function(_map) {
	this.Map=_map;
	var size = new GSize((this.length*2)+this.size,(this.length*2)+this.size);
	this.div = _createElement("div",_map.getContainer(),null,size);
	this.div.id = "K_CrossControl_div";
	var img = _createElement("img",this.div,GPoint.ORIGIN,size);
	img.src=this.image;
	img.id="K_CrossControl_img";
	this.div.style.zIndex=4;
	return this.div;
}

K_CrossControl.prototype.getDefaultPosition=function() {
	return new GControlPosition(
			G_ANCHOR_BOTTOM_RIGHT,
			new GSize(Math.round(this.Map.getContainer().offsetWidth/2)-this.length,
				Math.round(this.Map.getContainer().offsetHeight/2)-this.length))
}