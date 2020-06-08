query 50512 QrySIH
{
    QueryType = Normal;

    elements
    {
        // dataitem(totalTraslados; totalTraslados)
        //{
        dataitem(Sales_Invoice_Header; "Sales Invoice Header")
        {
            //DataItemLink = "No." = totalTraslados.Folio;

            DataItemTableFilter = UUIDHG = filter(= '');

            column(Folio; "No.") { }
            column(Serie; "Order No.") { }
            column(Fecha; "Posting Date") { }
            column(CondicionesDePago; "Due Date") { }
            column(Subtotal; Amount) { }

            //column(SubTotalDescuento; SubTotalDescuento){}

            //column(DescuentoTotal; DescuentoTotal){}
            column(Moneda; "Currency Code") { }
            column(TipoCambio; "Currency Factor") { }
            column(Total; "Amount Including VAT") { }
            column(Nombre; "Sell-to Customer Name") { }
            column(RFC; "VAT Registration No.") { }
            column(UsoCFDI; "CFDI Purpose") { }

            column(TipoRelacion; "CFDI Relation") { }
            column(UUIDRelation; "UUID Relation HG")
            {
            }

            column(UUID; UUIDHG) { }

            dataitem(Payment_Method; "Payment Method")
            {
                SqlJoinType = InnerJoin;
                DataItemLink = Code = Sales_Invoice_Header."Payment Method Code";

                column(FormaPago; Description) { }

                dataitem(Payment_Terms1; "Payment Terms")
                {
                    DataItemLink = Code = Sales_Invoice_Header."Payment Terms Code";
                    SqlJoinType = InnerJoin;
                    column(MetodoPago; "SAT Payment Term")
                    {
                    }

                }
            }

        }

        // column(TotalImpuestosTrasladados; TotalImpuestosTrasladados)
        // {

        //}
        //}

    }
    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin
    end;
}