codeunit 50535 PedimentosCodeHG
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnQueryClosePageEvent', '', true, true)] //
    local procedure OnTmpSet(var Rec: Record "Tracking Specification")
    var
        Pedimento: Record PedimentosTableHG;
        Pedimento2: Record PedimentosTableHG;
        PedimentoGetRest: Record PedimentosTableHG;
        Modified: Boolean;
        Recalculate: Boolean;
    begin
        if (Rec.FindSet) then
            repeat
                if (Rec."Lot No." <> '') then begin
                    IF Pedimento.Get(Rec."Lot No.", Rec."Source Ref. No.", Rec."Source ID") then begin
                        if (Pedimento.Restante < Rec."Quantity (Base)") then begin ////
                            error('No hay suficientes existencias'); ////
                        end;
                        If (Pedimento.FechaDate <> Rec.PedDate) then begin
                            Pedimento.FechaDate := Rec.PedDate;
                            Modified := true;
                        end;
                        If (Pedimento.Pedimento <> Rec.Pedimento) then begin
                            Pedimento.Pedimento := Rec.Pedimento;
                            Modified := true;
                        end;
                        If (Pedimento.NombreAduana <> Rec.NombreAduana) then begin
                            Pedimento.NombreAduana := Rec.NombreAduana;
                            Modified := true;
                        end;
                        if (Rec."Source Type" = 39) then begin
                            If (Pedimento.QtyPos <> Rec."Quantity (Base)") then begin
                                Pedimento.QtyPos := Rec."Quantity (Base)";
                                Modified := true;
                                Recalculate := true;
                            end
                        end
                        else begin
                            If (Pedimento.QtyNeg <> Rec."Quantity (Base)") then begin
                                Pedimento.QtyNeg := Rec."Quantity (Base)";
                                Modified := true;
                                Recalculate := true;
                            end
                        end;
                        if (Modified) then Pedimento.Modify();
                        if (Recalculate) then RecalculateRestante(Pedimento.Pedimento);
                    end
                    Else begin
                        Pedimento2.Init();
                        if (Rec."Source Type" = 39) then begin
                            Pedimento2.IsPurchase := true;
                            Pedimento2.QtyPos := Rec."Quantity (Base)";
                            Pedimento2.Restante := Rec."Quantity (Base)";
                        end
                        else begin
                            if (Rec."Source Type" = 5741) then begin //////////////////
                                Pedimento2.QtyNeg := Rec."Quantity (Base)";
                                PedimentoGetRest.SetCurrentKey(Pedimento, "No.");
                                PedimentoGetRest.SetRange(Pedimento, Rec.Pedimento);
                                PedimentoGetRest.SetAscending("No.", false);
                                PedimentoGetRest.Find('-');
                                Pedimento2.Restante := PedimentoGetRest.Restante - Rec."Quantity (Base)";
                            end
                            else begin
                                Pedimento2.QtyNeg := Rec."Quantity (Base)";
                                PedimentoGetRest.SetCurrentKey(Pedimento, "No.");
                                PedimentoGetRest.SetRange(Pedimento, Rec.Pedimento);
                                PedimentoGetRest.SetAscending("No.", false);
                                PedimentoGetRest.Find('-');
                                Pedimento2.Restante := PedimentoGetRest.Restante - Rec."Quantity (Base)";
                            end;
                        end;
                        Pedimento2.ItemNo := Rec."Item No.";
                        Pedimento2.Lote := Rec."Lot No.";
                        Pedimento2.FechaTxt := FORMAT(Rec.PedDate);
                        Pedimento2.FechaDate := Rec.PedDate;
                        Pedimento2.Pedimento := Rec.Pedimento;
                        Pedimento2.NombreAduana := Rec.NombreAduana;
                        Pedimento2.LineNo := Rec."Source Ref. No.";
                        Pedimento2.DocumentNo := Rec."Source ID";

                        Pedimento2.Insert();
                    end;
                end;
            until (Rec.Next = 0);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAddReservEntriesToTempRecSetOnBeforeInsert', '', true, true)]
    local procedure OnSomethingElse(var TempTrackingSpecification: Record "Tracking Specification")
    var
        Pedimento: Record PedimentosTableHG;
    begin
        IF Pedimento.Get(TempTrackingSpecification."Lot No.", TempTrackingSpecification."Source Ref. No.", TempTrackingSpecification."Source ID") then begin
            TempTrackingSpecification.NombreAduana := Pedimento.NombreAduana;
            TempTrackingSpecification.PedDate := Pedimento.FechaDate;
            TempTrackingSpecification.Pedimento := Pedimento.Pedimento;
        end
    end;

    [EventSubscriber(ObjectType::Table, Database::"Tracking Specification", 'OnBeforeInsertEvent', '', true, true)]
    local procedure OnFillingFields(var Rec: Record "Tracking Specification")
    var
        Pedimento: Record PedimentosTableHG;
        read: Text;
        lengt: Integer;
        bandera: Boolean;
    begin
        Pedimento.SetCurrentKey(Lote, IsPurchase);
        Pedimento.SetRange(Lote, Rec."Lot No.");
        Pedimento.SetRange(IsPurchase, true);
        if ((Pedimento.Find('-')) and (Rec."Source Type" = 37)) then begin ////
            Rec.NombreAduana := Pedimento.NombreAduana;
            Rec.PedDate := Pedimento.FechaDate;
            Rec.Pedimento := Pedimento.Pedimento;
        end;
        ///////aarp 05.06.19 Transacciones entre lotes////////////////START
        if (Rec."Source Type" = 5741) then begin
            Rec.NombreAduana := Pedimento.NombreAduana;
            Rec.PedDate := Pedimento.FechaDate;
            Rec.Pedimento := Pedimento.Pedimento;
        end;
        ///////aarp 05.06.19 Transacciones entre lotes////////////////END   
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnDeleteRecordEvent', '', true, true)]
    local procedure OnDeleteRecord(var Rec: Record "Tracking Specification")
    var
        Pedimento: Record PedimentosTableHG;
    begin
        IF Pedimento.Get(Rec."Lot No.", Rec."Source Ref. No.", Rec."Source ID") then begin
            Pedimento.Delete();
            RecalculateRestante(Rec.Pedimento);
        end
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnDeleteRecordEvent', '', true, true)]
    local procedure OnDelteFromPurchLine(var Rec: Record "Purchase Line")
    var
        Pedimento: Record PedimentosTableHG;
    begin
        Pedimento.SetCurrentKey(DocumentNo, LineNo);
        Pedimento.SetRange(DocumentNo, Rec."Document No.");
        Pedimento.SetRange(LineNo, Rec."Line No.");
        if Pedimento.Find('-') then begin
            Pedimento.DeleteAll();
            RecalculateRestante(Pedimento.Pedimento);
        end
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnDeleteRecordEvent', '', true, true)]
    local procedure OnDelteFromSalesLine(var Rec: Record "Sales Line")
    var
        Pedimento: Record PedimentosTableHG;
    begin
        Pedimento.SetCurrentKey(DocumentNo, LineNo);
        Pedimento.SetRange(DocumentNo, Rec."Document No.");
        Pedimento.SetRange(LineNo, Rec."Line No.");
        if Pedimento.Find('-') then begin
            Pedimento.DeleteAll();
            RecalculateRestante(Pedimento.Pedimento);
        end
    end;

    local procedure RecalculateRestante(var PedimentoNo: Text)
    var
        Pedimento: Record PedimentosTableHG;
        Restante: Decimal;
    begin
        Pedimento.SetCurrentKey(Pedimento, "No.");
        Pedimento.SetRange(Pedimento, PedimentoNo);
        Pedimento.SetAscending("No.", true);
        if (Pedimento.FindSet) then
            repeat
                if (Pedimento.IsPurchase) then begin
                    Restante := Pedimento.Restante;
                end
                else begin
                    Pedimento.Restante := Restante - Pedimento.QtyNeg;
                    Restante := Pedimento.Restante;
                    Pedimento.Modify();
                end;
            until (Pedimento.Next = 0);
    end;

    [EventSubscriber(ObjectType::Table, Database::PedimentosTableHG, 'OnAfterInsertEvent', '', true, true)]
    local procedure setTransType(var Rec: Record PedimentosTableHG)
    var
        read: Text;
        lengt: Integer;
        bandera: Boolean;
        int: Integer;
    begin
        if Rec.IsPurchase then
            Rec.TransType := 'Compra'
        else
            Rec.TransType := 'Venta';
        Rec.Modify();
    end;
    ///Eventos de validación de pedimentos
    [EventSubscriber(ObjectType::Table, Database::"Tracking Specification", 'OnAfterValidateEvent', 'Pedimento', true, true)]
    local procedure validarPedimentotrackingTable(var Rec: Record "Tracking Specification")
    var
        read: Text;
        lengt: Integer;
        bandera: Boolean;
        int: Integer;
    begin
        bandera := false;
        lengt := Text.StrLen(Rec.Pedimento);
        if lengt = 21 then read := rec.Pedimento.Substring(3, 2);
        if read = '  ' then begin
            read := Rec.Pedimento.Substring(7, 2);
            if read = '  ' then begin
                read := Rec.Pedimento.Substring(13, 2);
                if read = '  ' then begin
                    bandera := true;
                end;
            end;
        end;
        if bandera = false then begin
            rec.Pedimento := '';
            Message('La estructura del pedimento no es correcta. Recuerde, 2 digitos seguido por 2 espacios, 2 digitos seguidos por 2 espacios, 4 digitos seguidos por 2 espacios, y 7 digitos para finalizar. Intente de nuevo.');
        end;
    end;
}
