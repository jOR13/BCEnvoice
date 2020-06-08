tableextension 50518 SalesCMHeaderExt extends "Sales Cr.Memo Header"
{
    fields
    {

        field(50518; UUIDNCHG; Text[250])
        {
            Caption = 'UUID';
            //TableRelation = facturas_Timbradas.UUID where(Folio = field("No."));
        }
        field(50519; UUIDRelacionadoHG; Text[250])
        {
            Caption = 'UUID Relacionado';
            TableRelation = facturas_Timbradas.UUID where(Folio = field("Applies-to Doc. No."));
            DataClassification = ToBeClassified;
        }

    }
}

pageextension 50626 PageSalesCMHeader extends "Posted Sales Credit Memos"
{
    layout
    {
        addafter("Location Code")
        {
            field(UUID; UUIDNCHG)
            {
                ApplicationArea = all;
            }

            field(UUIDRelacionado; UUIDRelacionadoHG)
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}