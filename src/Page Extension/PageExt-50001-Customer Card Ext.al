pageextension 50001 "Customer Card Ext." extends "Customer Card"
{
    layout
    {
        addafter("State Code")
        {
            field("Shipment Status"; Rec."Shipment Status")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}