page 50005 "Posted Vendor Inv. Booking"
{
    ApplicationArea = All;
    Caption = 'Posted Vendor Invoice Booking';
    PageType = List;
    SourceTable = "Posted Cust\vend Inv Booking";
    UsageCategory = Lists;
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where("Vendor Code" = filter(<> ''));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("AVN Document No."; Rec."AVN Document No.")
                {
                    ToolTip = 'Specifies the value of the AVN Document No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Tracking No"; Rec."Tracking No")
                {
                    ToolTip = 'Specifies the value of the Tracking No field.';
                }
                field("Tracking No for RTO If Diff."; Rec."Tracking No for RTO If Diff.")
                {
                    ToolTip = 'Specifies the value of the Tracking No for RTO If Different field.';
                }
                field("Vendor Code"; Rec."Vendor Code")
                {
                    ToolTip = 'Specifies the value of the Vendor Code field.';
                }

                field("Branch for GST (Location)"; Rec."Branch for GST (Location)")
                {
                    ToolTip = 'Specifies the value of the Branch for GST (Location) field.';
                }
                field("Order From Address"; Rec."Order From Address")
                {
                    ToolTip = 'Specifies the value of the Order From Address field.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field.';
                }
                field("Vendor Invoice Date"; Rec."Vendor Invoice Date")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Ledger Code"; Rec."Ledger Code")
                {
                    ToolTip = 'Specifies the value of the Ledger Code field.';
                }
                field("Amount Before GST"; Rec."Amount Before GST")
                {
                    ToolTip = 'Specifies the value of the Amount Before GST field.';
                }
                field("GST Group"; Rec."GST Group")
                {
                    ToolTip = 'Specifies the value of the GST Group field.';
                }
                field(SAC; Rec.SAC)
                {
                    ToolTip = 'Specifies the value of the SAC field.';
                }
                field("Shipment Status"; Rec."Shipment Status")
                {
                    ToolTip = 'Specifies the value of the Shipment Status field.';
                }
                field("Branch (G1)"; Rec."Branch (G1)")
                {
                    ToolTip = 'Specifies the value of the Branch (G1) field.';
                }
                field("Business Vertical (G2)"; Rec."Business Vertical (G2)")
                {
                    ToolTip = 'Specifies the value of the Business Vertical (G2) field.';
                }

                field("Sales Person"; Rec."Sales Person")
                {
                    ToolTip = 'Specifies the value of the Sales Person field.';
                }
                field("Shipped to address"; Rec."Shipped to address")
                {
                    ToolTip = 'Specifies the value of the Shipped to address field.';
                }
                field("Shipyaari ID No."; Rec."Shipyaari ID No.")
                {
                    ToolTip = 'Specifies the value of the Shipyaari ID No. field.';
                }
                field(Created; Rec."Order Created")
                {

                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}