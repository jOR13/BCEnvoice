pageextension 50507 pmtTermsExt extends "Payment Terms"
{
    Editable = true;
    layout
    {
        addafter(Description)
        {
            field(MetodoDePago; MetodoDePago)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}

page 50861 terminoDepagos
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Payment Terms";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Calc. Pmt. Disc. on Cr. Memos"; "Calc. Pmt. Disc. on Cr. Memos")
                {
                    ApplicationArea = All;
                }
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Discount %"; "Discount %")
                {
                    ApplicationArea = All;
                }
                field("Discount Date Calculation"; "Discount Date Calculation")
                {
                    ApplicationArea = All;
                }
                field("Due Date Calculation"; "Due Date Calculation")
                {
                    ApplicationArea = All;
                }

                field("Last Modified Date Time"; "Last Modified Date Time")
                {
                    ApplicationArea = All;
                }
                field(MetodoDePago; MetodoDePago)
                {
                    ApplicationArea = All;
                }
                field("SAT Payment Term"; "SAT Payment Term")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}

