function loadXMLDoc(dname)
{
if (window.XMLHttpRequest)
  {
  xhttp=new XMLHttpRequest();
  }
else
  {
  xhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xhttp.open("GET",dname,false);
try {xhttp.responseType="msxml-document"} catch(err) {} // Helping IE
xhttp.send("");
return xhttp;
}