
xquery version "3.1";

module namespace pm-config="http://www.tei-c.org/tei-simple/pm-config";

import module namespace pm-docx-tei="http://www.tei-c.org/pm/models/docx/tei/module" at "../transform/docx-tei-module.xql";
import module namespace pm-shouchaoben-web="http://www.tei-c.org/pm/models/shouchaoben/web/module" at "../transform/shouchaoben-web-module.xql";
import module namespace pm-shouchaoben-print="http://www.tei-c.org/pm/models/shouchaoben/fo/module" at "../transform/shouchaoben-print-module.xql";
import module namespace pm-shouchaoben-latex="http://www.tei-c.org/pm/models/shouchaoben/latex/module" at "../transform/shouchaoben-latex-module.xql";
import module namespace pm-shouchaoben-epub="http://www.tei-c.org/pm/models/shouchaoben/epub/module" at "../transform/shouchaoben-epub-module.xql";

declare variable $pm-config:web-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "shouchaoben.odd" return pm-shouchaoben-web:transform($xml, $parameters)
    default return pm-shouchaoben-web:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:print-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "shouchaoben.odd" return pm-shouchaoben-print:transform($xml, $parameters)
    default return pm-shouchaoben-print:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:latex-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "shouchaoben.odd" return pm-shouchaoben-latex:transform($xml, $parameters)
    default return pm-shouchaoben-latex:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:epub-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "shouchaoben.odd" return pm-shouchaoben-epub:transform($xml, $parameters)
    default return pm-shouchaoben-epub:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:tei-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docx.odd" return pm-docx-tei:transform($xml, $parameters)
    default return error(QName("http://www.tei-c.org/tei-simple/pm-config", "error"), "No default ODD found for output mode tei")
            
    
};
            
    