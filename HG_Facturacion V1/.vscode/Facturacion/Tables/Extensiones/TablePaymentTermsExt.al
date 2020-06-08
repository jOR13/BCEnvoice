tableextension 50521 TablePaymentTermsExt extends "Payment Terms"
{
    fields
    {
        field(50521; MetodoDePago; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}
