function loadXMLDoc(filename) {
  console.log(filename); 
  if (window.ActiveXObject) {
    xhttp = new ActiveXObject("Msxml2.XMLHTTP");
  }
  else {
    xhttp = new XMLHttpRequest();
  }
  xhttp.open("GET", filename, false);  
  xhttp.setRequestHeader('Access-Control-Allow-Headers', '*');
  xhttp.setRequestHeader('Access-Control-Allow-Origin', '*');
  xhttp.setRequestHeader("Content-Type", "application/json");
  xhttp.setRequestHeader('Allow-File-Access-From-', '*');
 
  xhttp.send();
  return xhttp.responseXML;
}

function displayJournals() {
  xml = loadXMLDoc("alphabet.xml");
  console.log(xml);
  xsl = loadXMLDoc("page1.xsl");
  console.log(xsl);
 
  if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
    ex = xml.transformNode(xsl);
    document.getElementById("journal_div").innerHTML = ex;
  }
  
  else if (document.implementation && document.implementation.createDocument) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    resultDocument = xsltProcessor.transformToFragment(xml, document);
    console.log("Result");
    console.log(resultDocument);
    document.getElementById("journal_div").appendChild(resultDocument);
  }
}

function displayVolumes(firstLetter) {
  console.log(firstLetter);
  xml = loadXMLDoc("movies.xml");
  console.log(xml);
  xsl = loadXMLDoc("page2.xsl");
  console.log(xsl);
  
  if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
    ex = xml.transformNode(xsl);
    document.getElementById("volume_div").innerHTML = ex;
  }
  
  else if (document.implementation && document.implementation.createDocument) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    xsltProcessor.setParameter(null,"firstLetter",firstLetter);
    resultDocument = xsltProcessor.transformToFragment(xml, document);
    console.log(resultDocument);
    console.log("removing volume_div");
    e = document.getElementById("volume_div")
    f = document.getElementById("number_div")
    while (e.hasChildNodes()) {
      console.log("Hello");
      e.removeChild(e.firstChild);
      f.removeChild(f.firstChild);
    }
    e = document.getElementById("volume_div")
    while (e.hasChildNodes()) {
      e.removeChild(e.firstChild);
      f.removeChild(f.firstChild);
    }
    e.appendChild(resultDocument);
  }
}

function displayArticles(mytitle) {
  console.log(mytitle);
  xml = loadXMLDoc("movies.xml");
  console.log(xml);
  xsl = loadXMLDoc("page3.xsl");
  console.log(xsl);
 
  if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
    ex = xml.transformNode(xsl);
    document.getElementById("number_div").innerHTML = ex;
  }
 
  else if (document.implementation && document.implementation.createDocument) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    xsltProcessor.setParameter(null,"mytitle",mytitle);
   
    resultDocument = xsltProcessor.transformToFragment(xml, document);
    console.log(resultDocument);
    
    
    console.log("removing number_div");
    e = document.getElementById("number_div")
    while (e.hasChildNodes()) {
      console.log("Hello");
      e.removeChild(e.firstChild);
    }
   
    e.appendChild(resultDocument);
  }
}
