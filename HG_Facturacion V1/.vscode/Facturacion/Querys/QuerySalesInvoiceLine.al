query 50513 QrySIL
{
    QueryType = Normal;
    //116103 ieps
    elements
    {


        dataitem(SalesLineInfo; "Sales Invoice Line")
        {
            //DataItemLink = "Order No." = PedimentosTable.DocumentNo;

            DataItemTableFilter = "No." = filter(<> '111-03-03-01');
            column(Folio; "Document No.") { }
            //column(No_; "No.") { }

            //column(ImporteDescuento; ImporteDescuento) { }


            column(Cantidad; Quantity) { }
            //column(NoIdentificacion; "No.") { }
            column(ValorUnitario; "Unit Price") { }
            column(Importe; "Amount") { }
            // column(ImporteCargoProducto; "Amount Including VAT") { }

            column(Descuento; "Line Discount Amount") { }

            column(Line_Discount__; "Line Discount %") { }

            column(Descripcion; "Description") { }

            //column(OldDescription; "Description") { }
            column(Unidad; "Unit of Measure Code") { }
            column(Base; amount) { }
            column(OrderNo; "Order No.") { }

            dataitem(ArticuloInfo; Item)
            {
                DataItemLink = "No." = SalesLineInfo."No.";
                column(NoIdentificacion; "No.") { }
                column(ClaveProdServ; "SAT Item Classification") { }
                dataitem(Unit_of_Measure; "Unit of Measure")
                {
                    DataItemLink = Code = SalesLineInfo."Unit of Measure Code";
                    column(ClaveUnidad; "SAT UofM Classification") { }

                    dataitem(Item_Charge; "Item Charge")
                    {
                        DataItemLink = "No." = SalesLineInfo."No.";

                        //DataItemTableFilter = "C. A Costo" = filter(= true);
                        column(C__A_Costo; "C. A Costo") { }

                    }

                }

            }
        }
    }


    var
        Desc: Text;

    trigger OnBeforeOpen()
    var
        cod: Codeunit codeUnitWS;
    begin
    end;
}