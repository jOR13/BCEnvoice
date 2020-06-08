table 50522 Conceptos
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Cantidad; decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(2; ClaveProdServ; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(3; Descripcion; Text[2000])
        {
            DataClassification = ToBeClassified;
        }

        field(4; Importe; decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(5; NoIdentificacion; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(6; Unidad; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(8; ClaveUnidad; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(7; ValorUnitario; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(9; id; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(10; Folio; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(11; BaseTraslado; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(12; ImporteTraslado; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; ImpuestoTraslado; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(14; TasaOCuotaTraslado; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(15; TipoFactor; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(16; ImpuestoPDF; Text[250])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(MyKey; id)
        {
            Clustered = true;
            Enabled = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
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