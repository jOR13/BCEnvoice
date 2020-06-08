page 50539 PedimentosPageHG
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PedimentosTableHG;

    layout
    {
        area(Content)
        {
            group(Pedimentos)
            {
                Caption = 'Todos los pedimentos';

                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Caption = 'No';
                }
                field(FechaTxt; FechaTxt)
                {
                    ApplicationArea = All;
                    Caption = 'Fecha txt';
                }
                field(FechaDate; FechaDate)
                {
                    ApplicationArea = All;
                    Caption = 'Fecha';
                }
                field(Pedimento; Pedimento)
                {
                    ApplicationArea = All;
                    Caption = 'Pedimento';
                }
                field(NombreAduana; NombreAduana)
                {
                    ApplicationArea = All;
                    Caption = 'Nombre de Aduana';
                }
                field(Lote; Lote)
                {
                    ApplicationArea = All;
                    Caption = 'Lote';
                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;
                    Caption = 'Articulo';
                }
                field(QtyPos; QtyPos)
                {
                    ApplicationArea = All;
                    Caption = 'Cantidad +';
                }
                field(QtyNeg; QtyNeg)
                {
                    ApplicationArea = All;
                    Caption = 'Cantidad -';
                }
                field(IsPurchase; IsPurchase)
                {
                    ApplicationArea = All;
                    Caption = 'Es Compra';
                }
                field(LineNo; LineNo)
                {
                    ApplicationArea = All;
                    Caption = 'Numero de linea';
                }
                field(DocumentNo; DocumentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Numero de Documento';
                }
                field(Restante; Restante)
                {
                    ApplicationArea = All;
                    Caption = 'Restante';
                }
                field(TransType; TransType)
                {
                    ApplicationArea = All;
                    Caption = 'Tipo de Transaccion';
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
