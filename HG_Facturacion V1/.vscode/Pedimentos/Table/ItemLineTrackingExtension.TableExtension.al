tableextension 50541 ItemLineTrackingExtensionHG extends "Tracking Specification"
{
    fields
    {
        // Add changes to table fields here
        field(50542; "PedDate"; Date)
        {
            Caption = 'FECHA';
        }
        field(50543; "Pedimento"; Text[21])
        {
            Caption = 'NO. PEDIMENTO';
        }
        field(50545; "NombreAduana"; Text[20])
        {
            Caption = 'NOMBRE ADUANA';
        }
    }
}
