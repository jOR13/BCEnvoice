page 50510 WSPageRetenciones
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Retenciones;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(Base; Base)
                {
                    ApplicationArea = All;
                }
                field(Folio; Folio)
                {
                    ApplicationArea = All;
                }

                field(id; id)
                {
                    ApplicationArea = All;
                }
                field(Importe; Importe)
                {
                    ApplicationArea = All;
                }
                field(Impuesto; Impuesto)
                {
                    ApplicationArea = All;
                }
                field(TasaOCuota; TasaOCuota)
                {
                    ApplicationArea = All;
                }
                field(TipoFactor; TipoFactor)
                {
                    ApplicationArea = All;
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