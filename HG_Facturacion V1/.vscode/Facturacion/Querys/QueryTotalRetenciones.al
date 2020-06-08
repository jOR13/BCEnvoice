query 50514 QueryTotalRetenciones
{
    QueryType = Normal;

    elements
    {
        dataitem(totalRetenciones; totalRetenciones)
        {
            column(Folio; Folio)
            {
            }
            column(TotalImpuestosRetenidos; TotalImpuestosRetenidos)
            {
                Method = Sum;
            }
            column(Importe; Importe)
            {
                Method = Sum;
            }
            column(Impuesto; Impuesto)
            {

            }
            column(TasaOCuota; TasaOCuota)
            {
            }
            column(TipoFactor; TipoFactor)
            {
            }

        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}
