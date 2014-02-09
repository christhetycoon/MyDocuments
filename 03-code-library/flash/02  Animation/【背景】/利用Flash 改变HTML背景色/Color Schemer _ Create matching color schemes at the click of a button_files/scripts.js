// ------------------------------------------------
// Based on StyleSwitcher functions by Paul Sowden
// http://www.idontsmoke.co.uk/ss/
// - - - - - - - - - - - - - - - - - - - - - - - -
// For details, visit ALA:
// http://www.alistapart.com/stories/alternate/
// ------------------------------------------------

var defaultBackgroundColor = "orange";
var currentBackgroundColor;

function setBackgroundColor(color) {
  var i, a;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
    if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {

      
      a.disabled = true;
      if(a.getAttribute("title") == color) a.disabled = false;
    }
  }
  
  currentBackgroundColor = color;
}

function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }
  else expires = "";
  document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  for(var i=0;i < ca.length;i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
}


window.onunload = function(e) {
  createCookie("backgroundColor", currentBackgroundColor, 365);
}

var cookie = readCookie("backgroundColor");
var bgColor = cookie ? cookie : defaultBackgroundColor;
setBackgroundColor(bgColor);