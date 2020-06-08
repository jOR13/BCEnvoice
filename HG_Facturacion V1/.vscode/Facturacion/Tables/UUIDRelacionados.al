table 50527 UUIDRelacionados
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Folio; Code[250])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "UUID Relacionado"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; Folio)
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

page 50564 UUIDRELATION
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = UUIDRelacionados;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Folio; Folio)
                {
                    ApplicationArea = All;
                }
                field("UUID Relacionado"; "UUID Relacionado")
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