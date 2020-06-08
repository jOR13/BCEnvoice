table 50526 traslado
{
    DataClassification = ToBeClassified;

    fields
    {

        field(10; id; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(1; Folio; Text[200])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Base; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(3; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
            //  DecimalPlaces = 1 : 2;

        }

        field(4; Impuesto; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(5; TasaOCuota; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(6; TipoFactor; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(7; ImpuestoPDF; Text[20])
        {
            DataClassification = ToBeClassified;

        }



    }

    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }


}

table 50769 totalTraslados
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(2; Folio; text[250])
        {
            DataClassification = ToBeClassified;

        }

        field(3; TotalImpuestosTrasladados; decimal)
        {
            DataClassification = ToBeClassified;
            //DecimalPlaces = 1 : 2;

        }

        field(4; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
            //DecimalPlaces = 1 : 2;

        }

        field(5; Impuesto; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(6; TasaOCuota; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(7; TipoFactor; Text[20])
        {
            DataClassification = ToBeClassified;

        }




    }

    keys
    {
        key(PK; id)

        {
            Clustered = true;
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