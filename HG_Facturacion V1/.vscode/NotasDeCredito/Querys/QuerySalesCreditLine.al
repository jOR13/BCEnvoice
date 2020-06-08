query 50532 QrySCL
{
    QueryType = Normal;
    //116103 ieps
    elements
    {


        dataitem(Sales_Cr_Memo_Line; "Sales Cr.Memo Line")
        {
            //DataItemLink = "Order No." = PedimentosTable.DocumentNo;


            DataItemTableFilter = Amount = filter(<> 0);
            column(Folio; "Document No.") { }

            //column(Cantidad; Quantity){ Method = sum; }

            //column(ValorUnitario; "Unit Price"){Method = sum;}
            column(Importe; "Amount")
            {
                Method = sum;
            }
            column(Descripcion; "Description 2") { }
            column(OldDescription; "Description") { }
            //column(Unidad; "Unit of Measure Code") { }
            column(Base; amount)
            {
                Method = sum;
            }
            column(OrderNo; "Order No.") { }


            dataitem(ArticuloInfo; Item)
            {
                DataItemLink = "No." = Sales_Cr_Memo_Line."No.";
                column(NoIdentificacion; "No.") { }
                // column(ClaveProdServ; "SAT Item Classification"){}
                /* dataitem(Unit_of_Measure; "Unit of Measure")
                 {
                     DataItemLink = Code = Sales_Cr_Memo_Line."Unit of Measure Code";
                     column(ClaveUnidad; "SAT UofM Classification") { }
                     //column(Unidad; Description) { }
                }*/

            }
        }
    }


    var
        Desc: Text;

    trigger OnBeforeOpen()
    begin

    end;
}