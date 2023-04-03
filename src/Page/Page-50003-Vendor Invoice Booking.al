page 50003 "Vendor Inv. Booking"
{
    ApplicationArea = All;
    Caption = 'Vendor Invoice Booking';
    PageType = List;
    SourceTable = "Customer/Vendor Inv. Booking";
    UsageCategory = Lists;
    SourceTableView = where("Vendor Code" = filter(<> ''));

    layout
    {
        area(content)
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
                field(Select; Rec.Select)
                {
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field(Created; Rec."Order Created")
                {

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create Purchase Invoice")
            {
                Caption = 'Create Purchase Invoice';
                Image = SalesInvoice;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    VendInv: Record "Customer/Vendor Inv. Booking";
                    VendInvNew: Record "Customer/Vendor Inv. Booking";
                    DocNo: Code[20];
                begin
                    VendInv.Reset();
                    VendInv.SetRange(Select, true);
                    VendInv.SetFilter("Vendor Code", '<>%1', '');
                    IF VendInv.FindSet() then
                        repeat
                            VendInvNew.Reset();
                            VendInvNew.SetRange(Select, true);
                            //VendInvNew.SetRange("Vendor Code", '<>%1', '');
                            VendInvNew.SetRange("AVN Document No.", VendInv."AVN Document No.");
                            VendInvNew.SetRange("Ledger Code", VendInv."Ledger Code");
                            VendInvNew.SetRange("GST Group", VendInv."GST Group");
                            VendInvNew.SetRange("Order Created", false);
                            IF VendInvNew.FindSet() then
                                repeat
                                    CreatePurchaseInvoice(VendInvNew);
                                until VendInvNew.Next() = 0;
                            IF DocNo <> VendInvNew."AVN Document No." then
                                Message('Purchase Invoice Created with Document No. %1', VendInvNew."AVN Document No.");
                            DocNo := VendInvNew."AVN Document No.";
                        until VendInv.Next() = 0;
                end;
            }
        }
    }
    local procedure CreatePurchaseInvoice(VendInvBookFilter: Record "Customer/Vendor Inv. Booking") //custDocumentNo: Code[20]; GLcode: Code[20]; SACcode: Code[20]
    var
        PurchHeader: record "Purchase Header";
        PurchHFilter: Record "Purchase Header";
        PurchLineFilter: Record "Purchase Line";
        PurchLineInit: Record "Purchase Line";
        PurchL: Record "Purchase Line";
        NoSeriesMgt: Codeunit 396;
        VendInvBookSL: Record "Customer/Vendor Inv. Booking";
        AmtBeforeGST: Decimal;
    begin
        PurchHFilter.Reset();
        PurchHFilter.SetRange("No.", VendInvBookFilter."AVN Document No.");
        IF Not PurchHFilter.FindFirst() then begin
            PurchHeader.Init();
            PurchHeader."Document Type" := PurchHeader."Document Type"::Invoice;
            PurchHeader.Validate("No.", VendInvBookFilter."AVN Document No.");
            PurchHeader.Insert(true);
            PurchHeader.Validate("Buy-from Vendor No.", VendInvBookFilter."Vendor Code");
            PurchHeader.Validate("Posting Date", VendInvBookFilter."Posting Date");
            PurchHeader.Validate("Location Code", VendInvBookFilter."Branch for GST (Location)");
            //PurchHeader.validate("Ship-to Code", VendInvBookFilter."Shipped to address");
            PurchHeader.Validate("Shortcut Dimension 1 Code", VendInvBookFilter."Branch (G1)");
            PurchHeader.Validate("Shortcut Dimension 2 Code", VendInvBookFilter."Business Vertical (G2)");
            //PurchHeader.Validate("Salesperson Code", VendInvBookFilter."Sales Person");
            PurchHeader.Validate("Vendor Invoice No.", VendInvBookFilter."Vendor Invoice No.");

            PurchHeader.Validate("Posting No.", VendInvBookFilter."AVN Document No.");
            //PurchHeader.Validate(in);
            PurchHeader.Modify();
        end;

        PurchLineFilter.Reset();
        PurchLineFilter.SetRange(Type, PurchLineFilter.Type::"G/L Account");
        PurchLineFilter.SetRange("Document No.", VendInvBookFilter."AVN Document No.");
        PurchLineFilter.SetRange("No.", VendInvBookFilter."Ledger Code");
        PurchLineFilter.SetRange("HSN/SAC Code", VendInvBookFilter.SAC);
        IF not PurchLineFilter.FindFirst() then begin
            PurchLineInit.Init();
            PurchLineInit."Document Type" := PurchLineInit."Document Type"::Invoice;
            PurchLineInit."Document No." := VendInvBookFilter."AVN Document No.";

            PurchL.Reset();
            PurchL.SetRange("Document No.", VendInvBookFilter."AVN Document No.");
            IF not PurchL.FindFirst() then
                PurchLineInit."Line No." := 10000
            else
                PurchLineInit."Line No." := PurchL."Line No." + 10000;

            PurchLineInit.Insert(true);
            PurchLineInit.Type := PurchLineInit.Type::"G/L Account";
            PurchLineInit.Validate("No.", VendInvBookFilter."Ledger Code");
            PurchLineInit.Validate(Quantity, 1);

            PurchLineInit.Validate("Direct Unit Cost", VendInvBookFilter."Amount Before GST");
            PurchLineInit.Validate("GST Group Code", VendInvBookFilter."GST Group");
            PurchLineInit.Validate("HSN/SAC Code", VendInvBookFilter.SAC);
            PurchLineInit.Validate("GST Credit", PurchLineInit."GST Credit"::Availment);
            PurchLineInit.Modify();
            VendInvBookFilter."Order Created" := true;
            VendInvBookFilter.Modify();
        end else begin
            AmtBeforeGST += PurchLineFilter."Direct Unit Cost" + VendInvBookFilter."Amount Before GST";
            PurchLineFilter.Validate("Direct Unit Cost", AmtBeforeGST);
            PurchLineFilter.Modify();
            VendInvBookFilter."Order Created" := true;
            VendInvBookFilter.Modify();
        end;
    end;

}
