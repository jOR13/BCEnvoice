table 50525 temporal
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; getRec; Text[250])
        {
            DataClassification = ToBeClassified;
            InitValue = '';
        }

        field(2; DocNo; Text[250])
        {
            DataClassification = ToBeClassified;
            InitValue = '';
        }
    }

    keys
    {
        key(PK; getRec)
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