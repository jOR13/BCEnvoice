pageextension 50537 ItemsPedimentosExtensionHG extends "Item List" //MyTargetPageId
{
    actions
    {
        addlast(Navigation)
        {
            group("Pedimentos")
            {
                Image = WarehouseRegisters;

                action("Reporte")
                {
                    Image = Report;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myReport: Report PedimentosReportHG;
                    begin
                        //Message('Hello from reporte de pedimentos');
                        myReport.RunModal();
                    end;
                }
                action("List Page")
                {
                    Image = Report;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        excelReport: Page PedimentosListPageHG;
                    begin
                        //Message('Hello from reporte de pedimentos');
                        excelReport.RunModal();
                    end;
                }
            }
        }
    }
}
