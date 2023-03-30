page 50001 "Customer/Vendor Inv. Booking"
{
    ApplicationArea = All;
    Caption = 'Customer Invoice Booking';
    PageType = List;
    SourceTable = "Customer/Vendor Inv. Booking";
    UsageCategory = Lists;
    SourceTableView = where("Customer Code" = filter(<> ''));

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
                field("Client Code"; Rec."Customer Code")
                {
                    ToolTip = 'Specifies the value of the Client Code field.';
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
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create Sales Invoice")
            {
                Caption = 'Create Sales Invoice';
                Image = SalesInvoice;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    CreateSalesInvoice();
                end;
            }
        }
    }
    local procedure CreateSalesInvoice()
    var
        GenJourLine: record 81;
        NoSeriesMgt: Codeunit 396;
        BankAcc: Record 270;
    begin
        IF Rec."Customer Code" <> '' then begin
            GenJourLine.Reset();
            GenJourLine.SetRange("Journal Template Name", 'SALES');
            GenJourLine.SetRange("Journal Batch Name", 'DEFAULT');
            GenJourLine.Init();
            GenJourLine."Document No." := Rec."AVN Document No.";//NoSeriesMgt.GetNextNo('JOURNALV', Rec."Posting Date", false);
            GenJourLine."Posting Date" := Rec."Posting Date";
            IF GenJourLine.FindLast() then
                GenJourLine."Line No." := GenJourLine."Line No." + 10000
            else
                GenJourLine."Line No." := 10000;

            GenJourLine."Journal Template Name" := 'SALES';
            GenJourLine."Journal Batch Name" := 'DEFAULT';
            GenJourLine."Document Type" := GenJourLine."Document Type"::Invoice;
            GenJourLine."Account Type" := GenJourLine."Account Type"::Customer;
            GenJourLine.validate("Account No.", rec."Customer Code");
            GenJourLine."Bal. Account Type" := GenJourLine."Bal. Account Type"::"G/L Account";
            GenJourLine.Validate("Bal. Account No.", rec."Ledger Code");
            GenJourLine."Sales Invoice Type" := GenJourLine."Sales Invoice Type"::Taxable;
            GenJourLine.Validate("GST Group Code", rec."GST Group");
            GenJourLine.Validate("HSN/SAC Code", rec.SAC);
            //GenJourLine."GST Group Code" := 'Goods';
            GenJourLine.validate(Amount, Rec."Amount Before GST");
            GenJourLine.validate("Location Code", rec."Branch for GST (Location)");
            GenJourLine.validate("Shortcut Dimension 1 Code", rec."Branch (G1)");
            GenJourLine.validate("Shortcut Dimension 2 Code", rec."Business Vertical (G2)");
            GenJourLine.Comment := 'Auto Post';
            GenJourLine.Insert(true);
            Message('Journal Voucher created with Document No. %1', GenJourLine."Document No.");
        end else
            IF Rec."Vendor Code" <> '' then begin
                GenJourLine.Reset();
                GenJourLine.SetRange("Journal Template Name", 'PURCHJNL');
                GenJourLine.SetRange("Journal Batch Name", 'DEFAULT');
                GenJourLine.Init();
                GenJourLine."Document No." := Rec."AVN Document No.";//NoSeriesMgt.GetNextNo('JOURNALV', Rec."Posting Date", false);
                GenJourLine."Posting Date" := Rec."Posting Date";
                IF GenJourLine.FindLast() then
                    GenJourLine."Line No." := GenJourLine."Line No." + 10000
                else
                    GenJourLine."Line No." := 10000;

                GenJourLine."Journal Template Name" := 'PURCHJNL';
                GenJourLine."Journal Batch Name" := 'DEFAULT';
                GenJourLine."Document Type" := GenJourLine."Document Type"::Invoice;
                GenJourLine."Account Type" := GenJourLine."Account Type"::Vendor;
                GenJourLine.validate("Account No.", rec."Vendor Code");
                GenJourLine."Bal. Account Type" := GenJourLine."Bal. Account Type"::"G/L Account";
                GenJourLine.Validate("Bal. Account No.", rec."Ledger Code");
                GenJourLine."Sales Invoice Type" := GenJourLine."Sales Invoice Type"::Taxable;
                GenJourLine.Validate("GST Group Code", rec."GST Group");
                GenJourLine.Validate("HSN/SAC Code", rec.SAC);
                GenJourLine.Validate("GST Vendor Type", GenJourLine."GST Vendor Type"::Registered);
                GenJourLine.Validate("GST Credit", GenJourLine."GST Credit"::Availment);
                //GenJourLine."GST Group Code" := 'Goods';
                GenJourLine.validate(Amount, Rec."Amount Before GST");
                GenJourLine.validate("Location Code", rec."Branch for GST (Location)");
                GenJourLine.validate("Shortcut Dimension 1 Code", rec."Branch (G1)");
                GenJourLine.validate("Shortcut Dimension 2 Code", rec."Business Vertical (G2)");
                GenJourLine.Comment := 'Auto Post';
                GenJourLine.Insert(true);
                Message('Journal Voucher created with Document No. %1', GenJourLine."Document No.");
            end
    end;
}
