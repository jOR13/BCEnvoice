page 50538 PedimentosListPageHG
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PedimentosTableHG;
    Editable = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            group(ReportePedimentos)
            {
                Caption = 'Reportes Pedimentos';

                repeater(Reporte)
                {
                    field(Lote; Lote)
                    {
                        ApplicationArea = All;
                    }
                    field(LineNo; LineNo)
                    {
                        ApplicationArea = All;
                    }
                    field(DocumentNo; DocumentNo)
                    {
                        ApplicationArea = All;
                    }
                    field("No."; "No.")
                    {
                        ApplicationArea = All;
                    }
                    field(FechaDate; FechaDate)
                    {
                        ApplicationArea = All;
                    }
                    field(Pedimento; Pedimento)
                    {
                        ApplicationArea = All;
                    }
                    field(NombreAduana; NombreAduana)
                    {
                        ApplicationArea = All;
                    }
                    field(ItemNo; ItemNo)
                    {
                        ApplicationArea = All;
                    }
                    field(QtyPos; QtyPos)
                    {
                        ApplicationArea = All;
                    }
                    field(QtyNeg; QtyNeg)
                    {
                        ApplicationArea = All;
                    }
                    field(FechaTxt; FechaTxt)
                    {
                        ApplicationArea = All;
                    }
                    field(IsPurchase; IsPurchase)
                    {
                        ApplicationArea = All;
                    }
                    field(Restante; Restante)
                    {
                        ApplicationArea = All;
                    }
                    field(TransType; TransType)
                    {
                        ApplicationArea = All;
                    }


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
