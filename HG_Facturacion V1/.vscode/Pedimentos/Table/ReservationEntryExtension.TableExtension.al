tableextension 50543 ReservationEntryExtensionHG extends "Reservation Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50544; "PedDate"; Date)
        {
            Caption = 'FECHA';
        }
        field(50546; "Pedimento"; Text[21])
        {
            Caption = 'NO. PEDIMENTO';
        }
        field(50545; "NombreAduana"; Text[20])
        {
            Caption = 'NOMBRE ADUANA';
        }
    }
}
