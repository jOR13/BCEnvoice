page 50508 facturas
{
    PageType = List;
    SourceTable = facturas_Timbradas;
    CaptionML = ENU = 'Facturas timbradas';
    Editable = false;
    SourceTableView = order(descending);

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Folio; Folio)
                {
                    ApplicationArea = All;
                }
                field(Total; Total)
                {
                    ApplicationArea = All;
                }
                field(Subtotal; Subtotal)
                {
                    ApplicationArea = All;
                }
                field(IVA; IVA)
                {
                    ApplicationArea = All;
                }
                field(Descripcion; Descripcion)
                {
                    ApplicationArea = All;
                }
                field(Fecha; Fecha)
                {
                    ApplicationArea = All;
                }
                field(FechaTimbrado; FechaTimbrado)
                {
                    ApplicationArea = All;
                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                }
                field(NombreReceptor; NombreReceptor)
                {
                    ApplicationArea = All;
                }
                field(CantidadLetra; CantidadLetra)
                {
                    // ApplicationArea = All;
                }
                field(CertificadoCadena; CertificadoCadena)
                {
                    ApplicationArea = All;
                }
                field(CertificadoCadenaPart2; CertificadoCadenaPart2)
                {
                    ApplicationArea = All;
                }
                field(FormaDePago; FormaDePago)
                {
                    ApplicationArea = All;
                }
                field("Lugar de expedición"; "Lugar de expedición")
                {
                    ApplicationArea = All;
                }
                field("Metodo de pago"; "Metodo de pago")
                {
                    ApplicationArea = All;
                }
                field(Moneda; Moneda)
                {
                    ApplicationArea = All;
                }
                field(NoCertificado; NoCertificado)
                {
                    ApplicationArea = All;
                }
                field(NoCertificadoSAT; NoCertificadoSAT)
                {
                    ApplicationArea = All;
                }
                field("QR String"; "QR String")
                {
                    ApplicationArea = All;
                }
                field(RFC; RFC)
                {
                    ApplicationArea = All;
                }
                field("Regimen Fiscal"; "Regimen Fiscal")
                {
                    ApplicationArea = All;
                }
                field(RfcReceptor; RfcReceptor)
                {
                    ApplicationArea = All;
                }
                field(SelloDigitalCFD; SelloDigitalCFD)
                {
                    ApplicationArea = All;
                }
                field(SelloSAT; SelloSAT)
                {
                    ApplicationArea = All;
                }
                field(TipoCambio; TipoCambio)
                {
                    ApplicationArea = All;
                }
                field(TotalText; TotalText)
                {
                    ApplicationArea = All;
                }
                field(UUID; UUID)
                {
                    ApplicationArea = All;
                }
                field(UsoCFDI; UsoCFDI)
                {
                    ApplicationArea = All;
                }
                field(id; id)
                {
                    ApplicationArea = All;
                }
                field(tipoDeComprobante; tipoDeComprobante)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshList)
            {
                ApplicationArea = all;
                CaptionML = ENU = 'Refrescar lista';
                Promoted = true;
                PromotedCategory = Process;
                Image = CalculateLines;
                trigger OnAction();

                begin
                    RefreshList();
                    CurrPage.Update;
                    cod.calCImporteTraslado();
                    if FindFirst then;
                end;
            }

            action(Borrar)
            {
                ApplicationArea = all;
                CaptionML = ENU = 'Borrar lista';
                Promoted = true;
                PromotedCategory = Process;
                Image = Delete;
                trigger OnAction();
                var
                    ft: Record facturas_Timbradas;
                    ftc: Record Conceptos;
                begin
                    ft.DeleteAll();
                    ftc.DeleteAll();
                    CurrPage.Update;
                    if FindFirst then;
                end;
            }


            action(lletra)
            {
                ApplicationArea = all;
                CaptionML = ENU = 'Letra';
                Promoted = true;
                PromotedCategory = Process;
                Image = Delete;
                trigger OnAction();
                var
                    total: decimal;
                    NumText: text;
                begin

                end;
            }

        }
    }

    trigger OnOpenPage();
    begin
        //RefreshIssues();
        //if FindFirst then;
    end;

    var
        cod: Codeunit codeUnitWS;
}
