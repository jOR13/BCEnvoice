page 50529 pruebas
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Invoice Header";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(UUID; UUIDHG)
                {
                    ApplicationArea = All;
                }
                field("UUID Relation"; "UUID Relation HG")
                {
                    ApplicationArea = All;
                }

                field("CFDI Relation"; "CFDI Relation")
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