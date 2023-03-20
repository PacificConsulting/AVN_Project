page 50000 "COD Payable Receivable List"
{
    ApplicationArea = All;
    Caption = 'COD Payable Receivable List';
    PageType = List;
    SourceTable = "COD Payable/Receivable";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("AVN Voucher No."; Rec."AVN Voucher No.")
                {
                    ToolTip = 'Specifies the value of the AVN Voucher No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Tracking No"; Rec."Tracking No")
                {
                    ToolTip = 'Specifies the value of the Tracking No field.';
                }
                field("COD Client Payable Code"; Rec."COD Client Payable Code")
                {
                    ToolTip = 'Specifies the value of the COD Client Payable Code field.';
                }
                field("COD Vendor Code"; Rec."COD Vendor Code")
                {
                    ToolTip = 'Specifies the value of the COD Vendor Code field.';
                }
                field("Portal Report Number "; Rec."Portal Report Number ")
                {
                    ToolTip = 'Specifies the value of the Portal Report Number  field.';
                }
                field("Ledger Code"; Rec."Ledger Code")
                {
                    ToolTip = 'Specifies the value of the Ledger Code field.';
                }
                field("COD Amount "; Rec."COD Amount ")
                {
                    ToolTip = 'Specifies the value of the COD Amount  field.';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
                field("Shipment Status"; Rec."Shipment Status")
                {
                    ToolTip = 'Specifies the value of the Shipment Status field.';
                }
                field("Sales Person"; Rec."Sales Person")
                {
                    ToolTip = 'Specifies the value of the Sales Person field.';
                }
                field("Branch (G1)"; Rec."Branch (G1)")
                {
                    ToolTip = 'Specifies the value of the Branch (G1) field.';
                }
                field("Business Vertical (G2)"; Rec."Business Vertical (G2)")
                {
                    ToolTip = 'Specifies the value of the Business Vertical (G2) field.';
                }

                field(Select; Rec.Select)
                {
                    ToolTip = 'Specifies the value of the Select field.';
                }
            }
        }
    }
}
