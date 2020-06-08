/*
pageextension 50620 SCMExt extends "Sales Credit Memo"
{

    layout
    {
        modify("CFDI Purpose")
        {
            ShowMandatory = true;
            ApplicationArea = all;
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                if "CFDI Purpose" = '' then begin
                    Message('Debe llenar el campo de CFDI Purpose');
                end;
            end;
        }
        modify("Payment Terms Code")
        {
            ShowMandatory = true;
            ApplicationArea = all;

            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                if "Payment Terms Code" = '' then begin
                    Message('Debe llenar el campo de Payment Terms Code');
                end;
            end;
        }

        modify("CFDI Relation")
        {
            ShowMandatory = true;
            ApplicationArea = all;

            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                if "CFDI Relation" = '' then begin
                    Message('Debe llenar el campo de CFDI Relation');
                end;
            end;
        }

        modify("Payment Method Code")
        {
            ApplicationArea = all;

            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                if "Payment Method Code" = '' then begin
                    Message('Debe llenar el campo de Payment Method Code');
                end;
            end;
        }


    }


}*/