page 50000 "COD Payable List"
{
    ApplicationArea = All;
    Caption = 'COD Payable List';
    PageType = List;
    SourceTable = "COD Payable/Receivable";
    UsageCategory = Lists;
    SourceTableView = where("COD Vendor Code" = filter(<> ''), "Entry Posted" = filter(false));

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
                field("Lines Created"; Rec."Lines Created")
                {
                    ToolTip = 'It is Indicate Lines already Created for journal Voucher';
                }
                field("Entry Posted"; Rec."Entry Posted")
                {
                    ToolTip = 'It is Indicate Lines are posted from journal Voucher';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create Journal Voucher")
            {
                Caption = 'Create Journal Voucher';
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    CODPay: Record "COD Payable/Receivable";
                    CODPayNew: Record "COD Payable/Receivable";
                begin
                    CurrPage.SetSelectionFilter(CODPay);
                    CODPay.SetRange(Select, true);
                    CODPay.SetFilter("COD Vendor Code", '<>%1', '');
                    CODPay.SetRange("Lines Created", false);
                    IF CODPay.FindSet() then
                        repeat
                            GenerateJournalVoucher(CODPay);
                        until CODPay.Next() = 0;
                    Message('Journal Voucher created ');
                end;
            }
            action("Select All Lines")
            {
                Caption = 'Select All Lines';
                Image = Line;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    //vendBookLine: Record "Customer/Vendor Inv. Booking";
                    codpaybleline: record "COD Payable/Receivable";

                begin
                    //CurrPage.SetSelectionFilter(vendBookLine);
                    codpaybleline.Reset();
                    codpaybleline.SetRange(Select, false);
                    codpaybleline.SetRange("Lines Created", false);
                    codpaybleline.SetRange("Entry Posted", false);
                    codpaybleline.SetFilter("COD Vendor Code", '<>%1', '');
                    IF codpaybleline.FindSet() then
                        repeat
                            codpaybleline.Select := true;
                            codpaybleline.Modify();
                        until codpaybleline.Next() = 0;
                    Message('All Lines has been selected');
                end;
            }
            action("De-select All Lines")
            {
                Caption = 'De-select All Lines';
                Image = Line;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    // vendBookLine: Record "Customer/Vendor Inv. Booking";
                    codpaybleline: record "COD Payable/Receivable";
                begin

                    codpaybleline.Reset();
                    codpaybleline.SetRange(Select, true);
                    codpaybleline.SetRange("Lines Created", false);
                    codpaybleline.SetRange("Entry Posted", false);
                    codpaybleline.SetFilter("COD Vendor Code", '<>%1', '');
                    IF codpaybleline.FindSet() then
                        repeat
                            codpaybleline.Select := false;
                            codpaybleline.Modify();
                        until codpaybleline.Next() = 0;
                    Message('All Lines has been De-selected');
                end;
            }

        }
    }
    local procedure GenerateJournalVoucher(CODPayFilter: Record "COD Payable/Receivable")
    var
        GenJourLine: record 81;
        GenJourLineFilter: record 81;
        NoSeriesMgt: Codeunit 396;
        BankAcc: Record 270;
        CODPay: Record "COD Payable/Receivable";
    begin
        // GenJourLineFilter.Reset();
        //GenJourLineFilter.SetRange("Document No.", CODPayFilter."AVN Voucher No.");
        //IF not GenJourLineFilter.FindFirst() then begin
        IF CODPayFilter."COD Vendor Code" <> '' then begin
            GenJourLine.Reset();
            GenJourLine.SetRange("Journal Template Name", 'JOURNAL V');
            GenJourLine.SetRange("Journal Batch Name", 'DEFAULT');
            GenJourLine.Init();
            GenJourLine."Posting Date" := CODPayFilter."Posting Date";
            IF GenJourLine.FindLast() then
                GenJourLine."Line No." := GenJourLine."Line No." + 10000
            else
                GenJourLine."Line No." := 10000;

            GenJourLine."Journal Template Name" := 'JOURNAL V';
            GenJourLine."Journal Batch Name" := 'DEFAULT';
            GenJourLine.Insert(true);
            GenJourLine."Document No." := CODPayFilter."AVN Voucher No.";//NoSeriesMgt.GetNextNo('JOURNALV', Rec."Posting Date", false);
            GenJourLine."Account Type" := GenJourLine."Account Type"::Vendor;
            GenJourLine."External Document No." := CODPayFilter."Tracking No";
            GenJourLine.validate("Account No.", CODPayFilter."COD Vendor Code");
            GenJourLine."Bal. Account Type" := GenJourLine."Bal. Account Type"::"G/L Account";
            GenJourLine.Validate("Bal. Account No.", CODPayFilter."Ledger Code");
            GenJourLine.validate("Credit Amount", CODPayFilter."COD Amount ");
            GenJourLine.validate("Shortcut Dimension 1 Code", CODPayFilter."Branch (G1)");
            GenJourLine.validate("Shortcut Dimension 2 Code", CODPayFilter."Business Vertical (G2)");
            GenJourLine.Comment := 'Auto Post';
            GenJourLine.Modify();

            CODPay.Reset();
            CODPay.SetRange("AVN Voucher No.", GenJourLine."Document No.");
            CODPay.SetRange("COD Vendor Code", GenJourLine."Account No.");
            IF CODPay.FindFirst() then begin
                CODPay."Lines Created" := true;
                CODPay.Modify();
            end;
        end;
        //Message('Journal Voucher created with Document No. %1', GenJourLine."Document No.");

        // IF Not CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJourLine) then begin


    end;
}
