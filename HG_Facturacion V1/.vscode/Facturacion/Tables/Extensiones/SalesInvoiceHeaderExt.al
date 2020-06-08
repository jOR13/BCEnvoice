tableextension 50519 SalesInvoiceHeaderExst extends "Sales Invoice Header"
{
    fields
    {

        field(50520; UUIDHG; Text[250])
        {
            Caption = 'UUID';
            TableRelation = facturas_Timbradas.UUID where(Folio = field("No."));
            DataClassification = ToBeClassified;
        }

        /*        field(50521; XML; Blob)
                {
                    Caption = 'XML';
                    DataClassification = ToBeClassified;
                }

        */
        field(50522; "UUID Relation HG"; Text[250])
        {
            //TableRelation = UUIDRelacionados."UUID Relacionado" where(Folio = field("No."));
            //ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }

        field(505223; "Tipo relacion"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Seleccione","Facturas","Notas de credito";

        }

        /*
        field(50256; SubTotalDescuento; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(50257; DescuentoTotal; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        */

    }


    var
        myInt: Integer;
        status: Boolean;
}