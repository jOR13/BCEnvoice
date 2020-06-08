report 50540 PedimentosReportHG
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'PedimentosReport.docx';

    dataset
    {
        dataitem(PedimentosTable;
        PedimentosTableHG)
        {
            DataItemLinkReference = "PedimentosTable";
            DataItemTableView = sorting("Pedimento", "No.") order(ascending);

            column(FechaTxt;
            FechaTxt)
            {
            }
            column(FechaDate;
            FechaDate)
            {
            }
            column(ItemNo;
            ItemNo)
            {
            }
            column(Lote;
            Lote)
            {
            }
            column(Pedimento;
            Pedimento)
            {
            }
            column(NombreAduana;
            NombreAduana)
            {
            }
            column(QtyPos;
            QtyPos)
            {
            }
            column(QtyNeg;
            QtyNeg)
            {
            }
            column(Restante;
            Restante)
            {
            }
            column(TransType;
            TransType)
            {
            }
        }
    }
    var
        myInt: Integer;
}
