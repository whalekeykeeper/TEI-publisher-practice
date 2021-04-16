xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare variable $SCB := doc("sanjinnanjingcheng.xml");
declare variable $listPlace := doc("../data/listPlace.xml")/listPlace;
declare variable $listPerson := doc("../data/listPerson.xml")/listPerson;
declare variable $listOrg := doc("../data/listOrg.xml")/listOrg;
<standOff
    xml:lang="zh">
    
    <listPlace>
        {
            for $p in $SCB//listPlace/place
            let $path := $listPlace/place/placeName[. = $p/placeName]/..
            return
                if ($p/placeName[. = $listPlace/place/placeName])
                then
                    <place>
                        {
                            <idno
                                type='ReadAct'>{data($path/@*:id)}</idno>,
                            $path/child::node()
                            
                        }
                    </place>
                else
                    $p
        }
    </listPlace>
    
    
    <listPerson>{
            for $p in $SCB//listPerson/person
            let $path := $listPerson/person/persName[(./surname eq $p/persName) or (./forename eq $p/persName)]/..
            return
                if ($p/persName[(. = $listPerson/person/persName[@xml:lang = "zh"]/surname)
                or (. = $listPerson/person/persName[@xml:lang = "zh"]/forename)])
                then
                    <person>
                        {
                            <idno
                                type='ReadAct'>{data($path/@*:id)}</idno>,
                            (: $path/persName, $path/birth, $path/death, $path/listBibl,
                                $path/event, $path/state, $path/socecStatus, $path/note:)
                            $path/child::node()
                        }
                    </person>
                else
                    $p
        }
    </listPerson>
    
    
    <listOrg>{
            for $o in $SCB//listOrg/org
            let $path := $listOrg/org/orgName[. = $o/orgName]/..
            return
                if ($o/orgName[. = $listOrg/org/orgName])
                then
                    <org>
                        {
                            <idno
                                type='ReadAct'>{data($path/@*:id)}</idno>,
                            $path/child::node()
                        }
                    </org>
                else
                    $o
        }</listOrg>
</standOff>
