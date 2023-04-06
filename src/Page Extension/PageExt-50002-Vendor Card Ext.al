pageextension 50002 "Vendor Card Ext." extends "Vendor Card"
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