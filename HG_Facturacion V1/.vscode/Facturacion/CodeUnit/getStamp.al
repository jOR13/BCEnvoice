codeunit 50504 getStamp
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Page, page::"Posted Sales Invoices", 'OnOpenPageEvent', '', true, true)]
    local procedure timbradas()
    var
        sh: Record "Sales Invoice Header";
        ft: Record facturas_Timbradas;

    begin
        sh.SetFilter(sh.UUIDHG, '');
        if sh.FindSet() then begin
            repeat begin
                if ft.FindSet() then begin
                    repeat begin
                        if sh."No." = ft.Folio then begin
                            sh.UUIDHG := ft.UUID;
                            sh.Modify();
                        end;
                    end until ft.Next() = 0;
                end;
            end until sh.Next() = 0;
        end;
    end;


    //[EventSubscriber(ObjectType::Page, page::"Posted Sales Credit Memos", 'OnOpenPageEvent', '', true, true)]
    procedure NCtimbradas()
    var
        sh: Record "Sales Cr.Memo Header";
        ft: Record facturas_Timbradas;

    begin
        sh.SetFilter(sh.UUIDRelacionadoHG, '');
        if sh.FindSet() then begin
            repeat begin
                if ft.FindSet() then begin
                    repeat begin
                        if sh."Applies-to Doc. No." = ft.Folio then begin
                            sh.UUIDRelacionadoHG := ft.UUID;
                            sh.Modify();
                        end;
                    end until ft.Next() = 0;
                end;
            end until sh.Next() = 0;
        end;
    end;

    var
        myInt: Integer;
}