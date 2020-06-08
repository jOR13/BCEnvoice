pageextension 50536 ItemLineTrackingCardExtHG extends "Item Tracking Lines"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field(PedDate; PedDate)
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
        }
    }
    var
        isVisible: Boolean;
}
