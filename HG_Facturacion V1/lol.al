page 50543 "Soap Test Page"
{
    PageType = Card;
    Caption = 'Soap Test Page';

    actions
    {
        area(processing)
        {
            action("Create Soap Message")
            {
                Caption = 'Create Soap Message';
                ApplicationArea = All;
                Image = XMLFile;

                trigger OnAction()
                var
                    XML: Codeunit "SOAP Document";
                begin
                    XML.CreateSoapMessage;
                end;
            }
        }
    }
}

codeunit 50810 "XML DOM Mgt."
{
    trigger OnRun();
    begin
    end;

    procedure AddElement(var pXMLNode: XmlNode; pNodeName: Text; pNodeText: Text; pNameSpace: Text; var pCreatedNode: XmlNode): Boolean
    var
        lNewChildNode: XmlNode;
    begin
        if pNodeText <> '' then
            lNewChildNode := XmlElement.Create(pNodeName, pNameSpace, pNodeText).AsXmlNode()
        else
            lNewChildNode := XmlElement.Create(pNodeName, pNameSpace).AsXmlNode();
        if pXMLNode.AsXmlElement().Add(lNewChildNode) then begin
            pCreatedNode := lNewChildNode;
            exit(true);
        end;
    end;

    procedure AddRootElement(var pXMLDocument: XmlDocument; pNodeName: Text; var pCreatedNode: XmlNode): Boolean
    begin
        pCreatedNode := XmlElement.Create(pNodeName).AsXmlNode();
        exit(pXMLDocument.Add(pCreatedNode));
    end;

    procedure AddRootElementWithPrefix(var pXMLDocument: XmlDocument; pNodeName: Text; pPrefix: Text; pNameSpace: text; var pCreatedNode: XmlNode): Boolean
    begin
        pCreatedNode := XmlElement.Create(pNodeName, pNameSpace).AsXmlNode();
        pCreatedNode.AsXmlElement().Add(XmlAttribute.CreateNamespaceDeclaration(pPrefix, pNameSpace));
        exit(pXMLDocument.Add(pCreatedNode));
    end;

    procedure AddElementWithPrefix(var pXMLNode: XmlNode; pNodeName: Text; pNodeText: Text; pPrefix: Text; pNameSpace: text; var pCreatedNode: XmlNode): Boolean
    var
        lNewChildNode: XmlNode;
    begin
        if pNodeText <> '' then
            lNewChildNode := XmlElement.Create(pNodeName, pNameSpace, pNodeText).AsXmlNode()
        else
            lNewChildNode := XmlElement.Create(pNodeName, pNameSpace).AsXmlNode();
        lNewChildNode.AsXmlElement().Add(XmlAttribute.CreateNamespaceDeclaration(pPrefix, pNameSpace));
        if pXMLNode.AsXmlElement().Add(lNewChildNode) then begin
            pCreatedNode := lNewChildNode;
            exit(true);
        end;
    end;

    procedure AddPrefix(var pXMLNode: XmlNode; pPrefix: Text; pNameSpace: text): Boolean
    begin
        pXMLNode.AsXmlElement().Add(XmlAttribute.CreateNamespaceDeclaration(pPrefix, pNameSpace));
        exit(true);
    end;

    procedure AddAttribute(var pXMLNode: XmlNode; pName: Text; pValue: Text): Boolean
    begin
        pXMLNode.AsXmlElement().SetAttribute(pName, pValue);
        exit(true);
    end;

    procedure AddAttributeWithNamespace(var pXMLNode: XmlNode; pName: Text; pNameSpace: text; pValue: Text): Boolean
    begin
        pXMLNode.AsXmlElement().SetAttribute(pName, pNameSpace, pValue);
        exit(true);
    end;

    procedure FindNode(pXMLRootNode: XmlNode; pNodePath: Text; var pFoundXMLNode: XmlNode): Boolean
    begin
        exit(pXMLRootNode.SelectSingleNode(pNodePath, pFoundXMLNode));
    end;

    procedure FindNodeWithNameSpace(pXMLRootNode: XmlNode; pNodePath: Text; pPrefix: Text; pNamespace: Text; var pFoundXMLNode: XmlNode): Boolean
    var
        lXmlNsMgr: XmlNamespaceManager;
        lXMLDocument: XmlDocument;
    begin

        if pXMLRootNode.IsXmlDocument() then
            lXmlNsMgr.NameTable(pXMLRootNode.AsXmlDocument().NameTable())
        else begin
            pXMLRootNode.GetDocument(lXMLDocument);
            lXmlNsMgr.NameTable(lXMLDocument.NameTable());
        end;
        lXMLNsMgr.AddNamespace(pPrefix, pNamespace);
        exit(pXMLRootNode.SelectSingleNode(pNodePath, lXmlNsMgr, pFoundXMLNode));
    end;

    procedure FindNodesWithNameSpace(pXMLRootNode: XmlNode; pXPath: Text; pPrefix: Text; pNamespace: Text; var pFoundXmlNodeList: XmlNodeList): Boolean
    var
        lXmlNsMgr: XmlNamespaceManager;
        lXMLDocument: XmlDocument;
    begin
        if pXMLRootNode.IsXmlDocument() then
            lXmlNsMgr.NameTable(pXMLRootNode.AsXmlDocument().NameTable())
        else begin
            pXMLRootNode.GetDocument(lXMLDocument);
            lXmlNsMgr.NameTable(lXMLDocument.NameTable());
        end;
        lXMLNsMgr.AddNamespace(pPrefix, pNamespace);
        exit(FindNodesWithNamespaceManager(pXMLRootNode, pXPath, lXmlNsMgr, pFoundXmlNodeList));
    end;

    procedure FindNodesWithNamespaceManager(pXMLRootNode: XmlNode; pXPath: Text; pXmlNsMgr: XmlNamespaceManager; var pFoundXmlNodeList: XmlNodeList): Boolean
    begin
        if not pXMLRootNode.SelectNodes(pXPath, pXmlNsMgr, pFoundXmlNodeList) then
            exit(false);
        if pFoundXmlNodeList.Count() = 0 then
            exit(false);
        exit(true);
    end;

    procedure FindNodeXML(pXMLRootNode: XmlNode; pNodePath: Text): Text
    var
        lFoundXMLNode: XmlNode;
    begin
        if pXMLRootNode.SelectSingleNode(pNodePath, lFoundXMLNode) then
            exit(lFoundXMLNode.AsXmlElement().InnerXml());
    end;

    procedure FindNodeText(pXMLRootNode: XmlNode; pNodePath: Text): Text
    var
        lFoundXMLNode: XmlNode;
    begin
        if pXMLRootNode.SelectSingleNode(pNodePath, lFoundXMLNode) then
            exit(lFoundXMLNode.AsXmlElement().InnerText());
    end;

    procedure FindNodeTextWithNameSpace(pXMLRootNode: XmlNode; pNodePath: Text; pPrefix: Text; pNamespace: Text): Text
    var
        lXmlNsMgr: XmlNamespaceManager;
        lXMLDocument: XmlDocument;
    begin

        if pXMLRootNode.IsXmlDocument() then
            lXmlNsMgr.NameTable(pXMLRootNode.AsXmlDocument().NameTable())
        else begin
            pXMLRootNode.GetDocument(lXMLDocument);
            lXmlNsMgr.NameTable(lXMLDocument.NameTable());
        end;
        lXMLNsMgr.AddNamespace(pPrefix, pNamespace);
        exit(FindNodeTextNs(pXMLRootNode, pNodePath, lXmlNsMgr));
    end;

    procedure FindNodeTextNs(pXMLRootNode: XmlNode; pNodePath: Text; pXmlNsMgr: XmlNamespaceManager): Text
    var
        lFoundXMLNode: XmlNode;
    begin
        if pXMLRootNode.SelectSingleNode(pNodePath, pXmlNsMgr, lFoundXMLNode) then
            exit(lFoundXMLNode.AsXmlElement().InnerText());
    end;

    procedure FindNodes(pXMLRootNode: XmlNode; pNodePath: Text; var pFoundXMLNodeList: XmlNodeList): Boolean
    begin
        if not pXMLRootNode.SelectNodes(pNodePath, pFoundXmlNodeList) then
            exit(false);
        if pFoundXmlNodeList.Count() = 0 then
            exit(false);
        exit(true);
    end;

    procedure GetRootNode(pXMLDocument: XmlDocument; var pFoundXMLNode: XmlNode): Boolean
    var
        lXmlElement: XmlElement;
    begin
        pXMLDocument.GetRoot(lXmlElement);
        pFoundXMLNode := lXmlElement.AsXmlNode();
    end;

    procedure FindAttribute(pXMLNode: XmlNode; var pXmlAttribute: XmlAttribute; pAttributeName: Text): Boolean
    begin
        exit(pXMLNode.AsXmlElement().Attributes().Get(pAttributeName, pXmlAttribute));
    end;

    procedure GetAttributeValue(pXMLNode: XmlNode; pAttributeName: Text): Text
    var
        lXmlAttribute: XmlAttribute;
    begin
        if pXMLNode.AsXmlElement().Attributes().Get(pAttributeName, lXmlAttribute) then
            exit(lXmlAttribute.Value());
    end;

    procedure AddDeclaration(var pXMLDocument: XmlDocument; pVersion: Text; pEncoding: Text; pStandalone: Text)
    var
        lXmlDeclaration: XmlDeclaration;
    begin
        lXmlDeclaration := XmlDeclaration.Create(pVersion, pEncoding, pStandalone);
        pXMLDocument.SetDeclaration(lXmlDeclaration);
    end;

    procedure AddGroupNode(var pXMLNode: XmlNode; pNodeName: Text)
    var
        lXMLNewChild: XmlNode;
    begin
        AddElement(pXMLNode, pNodeName, '', '', lXMLNewChild);
        pXMLNode := lXMLNewChild;
    end;

    procedure AddNode(var pXMLNode: XmlNode; pNodeName: Text; pNodeText: Text)
    var
        lXMLNewChild: XmlNode;
    begin
        AddElement(pXMLNode, pNodeName, pNodeText, '', lXMLNewChild);
    end;

    procedure AddLastNode(var pXMLNode: XmlNode; pNodeName: Text; pNodeText: Text)
    var
        lXMLNewChild: XmlNode;
        lXMLElement: XmlElement;
    begin
        AddElement(pXMLNode, pNodeName, pNodeText, '', lXMLNewChild);
        if pXMLNode.GetParent(lXMLElement) then
            pXMLNode := lXMLElement.AsXmlNode();
    end;

    procedure GetXmlNSMgr(pXMLRootNode: XmlNode; pPrefix: Text; pNamespace: Text; var pXmlNsMgr: XmlNamespaceManager): Text
    var
        lXMLDocument: XmlDocument;
    begin

        if pXMLRootNode.IsXmlDocument() then
            pXmlNsMgr.NameTable(pXMLRootNode.AsXmlDocument().NameTable())
        else begin
            pXMLRootNode.GetDocument(lXMLDocument);
            pXmlNsMgr.NameTable(lXMLDocument.NameTable());
        end;
        pXmlNsMgr.AddNamespace(pPrefix, pNamespace);
    end;

    procedure AddNameSpace(var pXmlNsMgr: XmlNamespaceManager; pPrefix: text; pNamespace: text);
    begin
        pXmlNsMgr.AddNamespace(pPrefix, pNamespace);
    end;

    procedure AddNamespaces(var pXmlNsMgr: XmlNamespaceManager; pXMLDocument: XmlDocument)
    var
        lXmlAttributeCollection: XmlAttributeCollection;
        lXmlAttribute: XmlAttribute;
        lXMLElement: XmlElement;
    begin
        pXmlNsMgr.NameTable(pXMLDocument.NameTable());
        pXMLDocument.GetRoot(lXMLElement);
        lXmlAttributeCollection := lXMLElement.Attributes();
        if lXMLElement.NamespaceUri() <> '' then
            pXmlNsMgr.AddNamespace('', lXMLElement.NamespaceUri());
        Foreach lXmlAttribute in lXmlAttributeCollection do
            if StrPos(lXmlAttribute.Name(), 'xmlns:') = 1 then
                pXmlNsMgr.AddNamespace(DELSTR(lXmlAttribute.Name(), 1, 6), lXmlAttribute.Value());
    end;

    procedure XMLEscape(pText: Text): Text
    var
        lXMLDocument: XmlDocument;
        lRootXmlNode: XmlNode;
        lXmlNode: XmlNode;
    begin
        lXMLDocument := XmlDocument.Create();
        AddElement(lRootXmlNode, 'XMLEscape', pText, '', lXmlNode);
        exit(lXmlNode.AsXmlElement().InnerXml());
    end;

    procedure LoadXMLDocumentFromText(pXMLText: Text; var pXMLDocument: XmlDocument)
    begin
        if pXMLText = '' then
            exit;
        XmlDocument.ReadFrom(pXMLText, pXMLDocument);
    end;

    procedure LoadXMLNodeFromText(pXMLText: Text; var pXMLNode: XmlNode)
    var
        lXmlDocument: XmlDocument;
    begin
        LoadXMLDocumentFromText(pXMLText, lXmlDocument);
        pXMLNode := lXmlDocument.AsXmlNode();
    end;

    procedure LoadXMLDocumentFromInStream(pInStream: InStream; var pXMLDocument: XmlDocument)
    begin
        XmlDocument.ReadFrom(pInStream, pXMLDocument);
    end;

    procedure LoadXMLNodeFromInStream(pInStream: InStream; var pXMLNode: XmlNode)
    var
        lXmlDocument: XmlDocument;
    begin
        LoadXMLDocumentFromInStream(pInStream, lXmlDocument);
        pXMLNode := lXmlDocument.AsXmlNode();
    end;

    procedure RemoveNamespaces(pXmlText: Text): Text
    var
        XMLDOMMgt: Codeunit "XML DOM Management";
    begin
        exit(XMLDOMMgt.RemoveNamespaces(pXmlText));
    end;

    procedure SetUTF88Declaration(var pXMLDocument: XmlDocument; pStandaloneTxt: Text);
    var
        lXmlDeclaration: XmlDeclaration;
    begin
        lXmlDeclaration := XmlDeclaration.Create('1.0', 'utf-8', pStandaloneTxt);
        pXMLDocument.SetDeclaration(lXmlDeclaration);
    end;

    procedure ReplaceInvalidXMLCharacters(pText: Text): Text
    var
        lText: Text;
    begin
        lText := pText;
        lText := lText.Replace('&', '&amp;');
        lText := lText.Replace('<', '&lt;');
        lText := lText.Replace('>', '&gt;');
        lText := lText.Replace('"', '&quot;');
        lText := lText.Replace('''', '&apos;');
        exit(lText);
    end;

    procedure RemoveXMLRestrictedCharacters(pXmlText: Text): Text
    var
        lXmlText: Text;
        lChar: array[30] of Char;
        lArrayLen: Integer;
        li: Integer;
    begin

        if pXmlText = '' then
            exit(pXmlText);

        lXmlText := pXmlText;

        lChar[1] := 1;
        lChar[2] := 2;
        lChar[3] := 3;
        lChar[4] := 4;
        lChar[5] := 5;
        lChar[6] := 6;
        lChar[7] := 7;
        lChar[8] := 8;
        lChar[9] := 11;
        lChar[10] := 12;
        lChar[11] := 14;
        lChar[12] := 15;
        lChar[13] := 16;
        lChar[14] := 17;
        lChar[15] := 18;
        lChar[16] := 19;
        lChar[17] := 20;
        lChar[18] := 21;
        lChar[19] := 22;
        lChar[20] := 23;
        lChar[21] := 24;
        lChar[22] := 25;
        lChar[23] := 26;
        lChar[24] := 27;
        lChar[25] := 28;
        lChar[26] := 29;
        lChar[27] := 30;
        lChar[28] := 31;
        lChar[29] := 127;

        lArrayLen := ArrayLen(lChar);
        for li := 1 to lArrayLen do
            lXmlText := DelChr(lXmlText, '=', lChar[li]);
        exit(lXmlText);
    end;
}
codeunit 50765 "SOAP Document"
{
    var
        XMLDomMgt: Codeunit "XML DOM Mgt."; //https://diveshboramsdnavblog.wordpress.com/2018/03/09/vs-code-xml-dom-management-part-2/
        SoapNS11: Label 'http://schemas.xmlsoap.org/soap/envelope/', Locked = true;
        SoapNS12: Label 'http://www.w3.org/2003/05/soap-envelope', Locked = true;
        XsiNS: Label 'http://www.w3.org/2001/XMLSchema-instance', Locked = true;
        XsdNS: Label 'http://www.w3.org/2001/XMLSchema', Locked = true;

    //Use this function to Create a Soap Message
    procedure CreateSoapMessage();
    var
        lXmlDocument: XmlDocument;
        lEnvolopeXmlNode: XmlNode;
        lHeaderXmlNode: XmlNode;
        lBodyXmlNode: XmlNode;
        lTempXmlNode: XmlNode;
        lXMLText: Text;
    begin
        CreateSoapDocument(lXmlDocument, 1, lEnvolopeXmlNode, lHeaderXmlNode, lBodyXmlNode);

        //Add Additional Nodes to the Soap Headers if Needed- Below is the Sample
        XMLDomMgt.AddElement(lHeaderXmlNode, 'SampleHeaders', 'Test', SoapNS12, lTempXmlNode);

        //You can add/append an existing Node to the Soap Body using XmlNode.AsXmlElement.InnerXml - Below is the Sample
        XMLDomMgt.AddElement(lBodyXmlNode, 'SampleBody', 'Test', SoapNS12, lTempXmlNode);

        lXmlDocument.WriteTo(lXMLText);
        Message(lXMLText);
    end;

    //Use this function to Create a Soap Document with Soap Version 1.1 & 1.2. This function will return the XML Document along with the reference of the created nodes like Envelope, Header & Body.
    procedure CreateSoapDocument(var pXmlDocument: XmlDocument; pVersion: Option "1.1","1.2"; var pEnvelopeXmlNode: XmlNode; var pHeaderXmlNode: XmlNode; var pBodyXmlNode: XmlNode);
    begin
        CreateEnvelope(pXmlDocument, pEnvelopeXmlNode, pVersion);
        CreateHeader(pEnvelopeXmlNode, pHeaderXmlNode, pVersion);
        CreateBody(pEnvelopeXmlNode, pBodyXmlNode, pVersion);
    end;

    //Use this function to Create a Soap Document with Soap Version 1.1 & 1.2. This function will return the XML Document along with the reference of the created Body node.
    procedure CreateSoapDocumentBody(var pXmlDocument: XmlDocument; pVersion: Option "1.1","1.2"; var pBodyXmlNode: XmlNode);
    var
        lEnvelopeXmlNode: XmlNode;
        lHeaderXmlNode: XmlNode;
    begin
        CreateSoapDocument(pXmlDocument, pVersion, lEnvelopeXmlNode, lHeaderXmlNode, pBodyXmlNode);
    end;

    //This function will create a Soap Envelope
    procedure CreateEnvelope(var pXmlDocument: XmlDocument; var pEnvelopeXmlNode: XmlNode; pVersion: Option "1.1","1.2");
    begin
        pXmlDocument := XmlDocument.Create;
        With XMLDomMgt do begin
            AddDeclaration(pXmlDocument, '1.0', 'UTF-8', 'no');
            if pVersion = pVersion::"1.1" then
                AddRootElementWithPrefix(pXmlDocument, 'Envelope', 'Soap', SoapNS11, pEnvelopeXmlNode)
            else
                AddRootElementWithPrefix(pXmlDocument, 'Envelope', 'Soap', SoapNS12, pEnvelopeXmlNode);
            AddPrefix(pEnvelopeXmlNode, 'xsi', XsiNS);
            AddPrefix(pEnvelopeXmlNode, 'xsd', XsdNS);
        end;
    end;

    //This function will create a Soap Header
    procedure CreateHeader(var pEnvelopeXmlNode: XmlNode; var pHeaderXmlNode: XmlNode; pVersion: Option "1.1","1.2");
    begin
        if pVersion = pVersion::"1.1" then
            XMLDOMMgt.AddElement(pEnvelopeXmlNode, 'Header', '', SoapNS11, pHeaderXmlNode)
        else
            XMLDOMMgt.AddElement(pEnvelopeXmlNode, 'Header', '', SoapNS12, pHeaderXmlNode);
    end;

    //This function will create a Soap Body
    procedure CreateBody(var pSoapEnvelope: XmlNode; var pSoapBody: XmlNode; pVersion: Option "1.1","1.2");
    begin
        if pVersion = pVersion::"1.1" then
            XMLDOMMgt.AddElement(pSoapEnvelope, 'Body', '', SoapNS11, pSoapBody)
        else
            XMLDOMMgt.AddElement(pSoapEnvelope, 'Body', '', SoapNS12, pSoapBody);
    end;

}