

codeunit 50530 codeSalesOrder
{
    //[EventSubscriber(ObjectType::table, database::"Sales Line", 'OnBeforeInsertEvent', '', true, true)]
    procedure InsertUUID()

    var
        tabla: Record "Sales Line";
        tablaSales: Record "Sales Header";
        psales: page "Sales Order";
        lol: TestPage "Sales Order";

        ItemRec: Record Item;
        Text000: Label 'Item No. %1.\Description: %2. Price: $%3.';
        Text001: Label 'The item was not found.';

    begin
        tablaSales.SetFilter(tablaSales."Document Type", 'Order');
        tablaSales.Find('-');
        Message(Text000, ItemRec."No.", ItemRec.Description, ItemRec."Unit Price");
        if (tablaSales."CFDI Purpose" = '') or (tablaSales."CFDI Relation" = '') or (tablaSales."Payment Terms Code" = '') or (tablaSales."Payment Method Code" = '') then begin

            Message('Debe llenar los campos obligatorios');

            psales.Editable := false;
            tabla.Reset();
            //res := Confirm('Desea salir de la orden?');
            //PostDocument(CODEUNIT::"Sales-Post (Yes/No)", NavigateAfterPost::"Posted Document");

        end;
    end;



}




