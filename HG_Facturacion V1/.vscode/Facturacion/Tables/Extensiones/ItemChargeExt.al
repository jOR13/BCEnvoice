tableextension 50517 ItemChargeExt extends "Item Charge"
{
    fields
    {
        field(50621; "C. A Costo"; Boolean)
        {
            DataClassification = ToBeClassified;
            Enabled = true;
            Editable = true;
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
    }

    var
        myInt: Integer;
}

pageextension 50622 ItemChargePageExt extends "Item Charges"
{
    layout
    {
        addfirst(Control1)
        {
            field("C. A Costo"; "C. A Costo")
            {
                ApplicationArea = All;
                Editable = true;
                Enabled = true;
                Style = Favorable;
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