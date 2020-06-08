table 50523 facturas_Timbradas
{

    fields
    {
        field(1; id; Integer)
        {
            CaptionML = ENU = 'ID';
            //AutoIncrement = true;
        }

        field(2; Fecha; Text[100])
        {
        }

        field(3; Descripcion; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(4; Nombre; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(5; RFC; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(6; Folio; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Subtotal; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(8; IVA; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(9; Total; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(10; UUID; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(11; "Metodo de pago"; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(13; "Lugar de expedición"; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(14; "Regimen Fiscal"; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(15; UsoCFDI; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(16; FormaDePago; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(17; Moneda; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(18; SelloDigitalCFD; Text[550])
        {
            DataClassification = ToBeClassified;
        }

        field(19; SelloSAT; Text[550])
        {
            DataClassification = ToBeClassified;
        }

        field(25; CertificadoCadena; Text[2048])
        {
            DataClassification = ToBeClassified;
        }

        field(26; CertificadoCadenaPart2; Text[2048])
        {
            DataClassification = ToBeClassified;
        }

        field(21; NoCertificadoSAT; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(22; NoCertificado; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23; FechaTimbrado; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(24; tipoDeComprobante; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(27; "QR String"; Text[550])
        {
            DataClassification = ToBeClassified;
        }

        field(28; NombreReceptor; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(29; RfcReceptor; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(30; CantidadLetra; Text[1500])
        {
            DataClassification = ToBeClassified;
        }

        field(31; TotalText; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(32; TipoCambio; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(39; "UUID Relacionado"; Text[250])
        {
            DataClassification = ToBeClassified;
        }





    }

    keys
    {
        key(PK; UUID)
        {
            Clustered = true;
        }

    }

    procedure RefreshList();
    var
        refreshList: Codeunit codeUnitWS;
    begin
        refreshList.Refresh();
    end;

}