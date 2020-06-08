table 50542 PedimentosTableHG
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "FechaTxt"; Text[30])
        {
            Editable = true;
            Caption = 'FECHA TXT';
            DataClassification = ToBeClassified;
        }
        field(9; "FechaDate"; Date)
        {
            Editable = true;
            Caption = 'FECHA';
            DataClassification = ToBeClassified;
        }
        field(3; "Pedimento"; Text[21])
        {
            Caption = 'PEDIMENTO';
            DataClassification = ToBeClassified;
            Numeric = true;
        }
        field(4; "NombreAduana"; Text[20])
        {
            Caption = 'NOMBRE DE ADUANA';
            DataClassification = ToBeClassified;
        }
        field(5; "Lote"; Code[50])
        {
            //TableRelation = "Tracking Specification"."Lot No.";
            Caption = 'LOTE';
            DataClassification = ToBeClassified;
        }
        field(6; "ItemNo"; Code[20])
        {
            Caption = 'ARTÍCULO';
            DataClassification = ToBeClassified;
        }
        field(7; "QtyPos"; Decimal)
        {
            Caption = 'CANTIDAD(+)';
            DataClassification = ToBeClassified;
        }
        field(8; "QtyNeg"; Decimal)
        {
            Caption = 'CANTIDAD(-)';
            DataClassification = ToBeClassified;
        }
        field(10; "IsPurchase"; Boolean)
        {
            Caption = 'Is Purchase Order';
            DataClassification = ToBeClassified;
        }
        field(11; "LineNo"; Integer)
        {
            Caption = 'Numero de Linea';
            DataClassification = ToBeClassified;
        }
        field(12; "DocumentNo"; Code[20])
        {
            Caption = 'Numero de Documento';
            DataClassification = ToBeClassified;
        }
        field(13; "Restante"; Decimal)
        {
            Caption = 'Restante';
            DataClassification = ToBeClassified;
        }
        field(14; "TransType"; Text[10])
        {
            Caption = 'Tipo de transaccion';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Lote, LineNo, DocumentNo)
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    var
        myInt: Integer;
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
