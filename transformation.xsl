<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
        <head>
            <title>Profil de Lelika TAGATAMANOGI</title>
            <style>
                body { font-family: Arial, sans-serif; }
                h1 { color: #2E86C1; }
                h2 { color: #2980B9; }
                ul { list-style-type: none; }
                li { margin: 5px 0; }
            </style>
        </head>
        <body>
            <h1>Profil de <xsl:value-of select="rdf:RDF/foaf:Person/foaf:name"/></h1>

            <h2>Détails Personnels</h2>
            <ul>
                <li><strong>Nom Complet:</strong> <xsl:value-of select="rdf:RDF/foaf:Person/foaf:name"/></li>
                <li><strong>Prénom:</strong> <xsl:value-of select="rdf:RDF/foaf:Person/foaf:givenName"/></li>
                <li><strong>Nom de Famille:</strong> <xsl:value-of select="rdf:RDF/foaf:Person/foaf:familyName"/></li>
                <li><strong>Date de Naissance:</strong> <xsl:value-of select="rdf:RDF/foaf:Person/foaf:birthday"/></li>
                <li><strong>Email:</strong> 
                    <a href="{substring-after(rdf:RDF/foaf:Person/foaf:mbox/@rdf:resource, 'mailto:')}">
                        <xsl:value-of select="substring-after(rdf:RDF/foaf:Person/foaf:mbox/@rdf:resource, 'mailto:')"/>
                    </a>
                </li>
                <li><strong>Organisation:</strong> <xsl:value-of select="rdf:RDF/foaf:Person/foaf:organization/foaf:Organization/foaf:name"/></li>
                <li><strong>Page d'Accueil:</strong> 
                    <a href="{rdf:RDF/foaf:Person/foaf:homepage/@rdf:resource}">
                        <xsl:value-of select="rdf:RDF/foaf:Person/foaf:homepage/@rdf:resource"/>
                    </a>
                </li>
            </ul>

            <h2>Connaissances</h2>
            <ul>
                <xsl:for-each select="rdf:RDF/foaf:Person/foaf:knows/foaf:Person">
                    <li>
                        <strong><xsl:value-of select="foaf:name"/></strong> - 
                        <a href="{foaf:homepage/@rdf:resource}">
                            <xsl:value-of select="foaf:homepage/@rdf:resource"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
