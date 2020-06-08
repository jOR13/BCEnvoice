codeunit 50502 cuqr
{
    procedure DoGenerateBarcode(var Barcode: text[500];
  var tempb: Record TempBlob temporary;
  var nameQRCode: Text[550])
    var
    begin
        Clear(tempb);
        if Barcode = '' then exit;
        BarcodeTypeValue := 'qr';
        UUID := nameQRCode;
        InitArguments(Barcode);
        if not CallWebService() then exit;
        tempb := tempblb;
    end;

    local procedure InitArguments(Barcode: text[500])
    var
        BaseURL: Text;
    begin

        BaseURL := 'https://api.qrserver.com';
        RequestURL := StrSubstNo('%1/v1/create-qr-code/?data=%2', BaseURL, Barcode);

        //BaseURL := 'http://www.barcodes4.me';
        //RequestURL := StrSubstNo('%1/barcode/qr/qr.png?value=%2', BaseURL, Barcode);

        RequestMethod := RequestMethod::get;
    end;

    procedure CallWebService() Success: Boolean
    begin
        Success := CallRESTWebService();
    end;

    procedure CallRESTWebService(): Boolean
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        TempBlob: Record TempBlob temporary;
    begin
        RequestMessage.Method := Format(RequestMethod);
        RequestMessage.SetRequestUri(RequestURL);
        RequestMessage.GetHeaders(Headers);
        Client.Send(RequestMessage, ResponseMessage);
        Headers := ResponseMessage.Headers;
        SetResponseHeaders(Headers);
        Content := ResponseMessage.Content;
        SetResponseContent(Content);
        EXIT(ResponseMessage.IsSuccessStatusCode);
    end;

    procedure SetResponseHeaders(var value: HttpHeaders)
    begin
        ResponseHeaders := value;
    end;

    procedure SetResponseContent(var value: HttpContent)
    var
        InStr: InStream;
        OutStr: OutStream;
    begin
        tempblb.Blob.CreateInStream(InStr);
        value.ReadAs(InStr);
        tempblb.Blob.CreateOutStream(OutStr);
        CopyStream(OutStr, InStr);
    end;

    var
        myInt: Integer;
        //Begin QR Code
        BarcodeTypeValue: Text;
        RequestURL: Text[550];
        RequestMethod: Option get,post,delete,patch,put;
        tempblb: Record TempBlob temporary;
        ResponseHeaders: HttpHeaders;
        UUID: text;
    //End QR Code
}