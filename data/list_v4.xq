xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
<standOff xml:lang="zh">
    <listPlace>{
            for $p in distinct-values(//placeName)
            return
                <place><placeName>{$p}</placeName></place>
        }
    </listPlace>
    <listPerson>{
            for $p in distinct-values(//persName)
            return
                <person><persName>{$p}</persName></person>
        }</listPerson>
    <listOrg>{
            for $p in distinct-values(//orgName)
            return
                <org><orgName>{$p}</orgName></org>
        }</listOrg>
</standOff>