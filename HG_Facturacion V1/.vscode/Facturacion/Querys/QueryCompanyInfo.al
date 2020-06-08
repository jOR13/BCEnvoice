query 50511 QueryCompanyInfo
{
    QueryType = Normal;

    elements
    {
        dataitem(Company_Information; "Company Information")
        {
            column(Name; Name) { }
            column(Address; Address) { }
            column(LugarDeExpedicion; "Post Code") { }
            column(RFC; "VAT Registration No.") { }
            column(RegimenFiscal; "SAT Tax Regime Classification") { }
        }
    }
    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin
    end;
}