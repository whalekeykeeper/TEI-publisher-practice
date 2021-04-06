xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

(:This xquery could only find the same placeName in two *.xml files,
it cannot yield a full standoff nodetree as what is planned originally.
Once we use "else <place>$placeSCB</place>, the result turns to be a permutation. :)
declare variable $SCB := doc("mainDoc.xml");
declare variable $listPlace := doc("../data/listPlace.xml");
<standOff
    xml:lang="zh">
    
    <listPlace>
        {
            (:for $placeSCB in $SCB//place
            (\:Does not work. Because in mainDoc.xml, there exists a node "place" contains two subnode "placeName":\)
            let $oldPlace := $listPlace//place[local-name(//placeName) = local-name($placeSCB/placeName)]
            return
                if (exists($oldPlace))
                then
                    <place>{$oldPlace}</place>
                else
                    <place>{$placeSCB}</place>
                    :)
        }
    </listPlace>
    
    <listPlace>
        {
            for $placeSCB in $SCB//place
            for $placeReadAct in $listPlace//place
            return
                (:Should we check for attribute @lang="zh" ?:)
                if ($placeSCB//placeName = $placeReadAct//placeName)
                then
                    <place>{$placeReadAct}</place>
                else
                    (:<place>{$placeSCB}</place>:)
                    ()
        }
    </listPlace>
    
    <listPerson>{
            for $personReadAct in doc("../data/listPlace.xml")//person
            for $personSCB in //person
            return
                if ($personSCB/persName = $personReadAct/persName)
                then
                    <person>{$personReadAct}</person>
                else
                    ()
        }
    </listPerson>
    
    <listOrg>{
            for $orgSCB in //org
            for $orgReadAct in doc("../data/listPlace.xml")//org
            return
                if ($orgSCB/orgName = $orgReadAct/orgName)
                then
                    <org><orgName>{$orgReadAct}</orgName></org>
                else
                    ()
        }</listOrg>
</standOff>