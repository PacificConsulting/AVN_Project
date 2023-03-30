page 50002 "COD Receivable List"
{
    ApplicationArea = All;
    Caption = 'COD Payable List';
    PageType = List;
    SourceTable = "COD Payable/Receivable";
    UsageCategory = Lists;
    SourceTableView = where("COD Customer Code" = filter(<> ''));

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
                field("COD Client Payable Code"; Rec."COD Customer Code")
                {
                    ToolTip = 'Specifies the value of the COD Client Payable Code field.';
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
                begin
                    GenerateJournalVoucher();
                end;
            }
        }
    }
    local procedure GenerateJournalVoucher()
    var
        GenJourLine: record 81;
        NoSeriesMgt: Codeunit 396;
        BankAcc: Record 270;
    begin
        IF Rec."COD Customer Code" <> '' then begin
            GenJourLine.Reset();
            GenJourLine.SetRange("Journal Template Name", 'JOURNALV');
            GenJourLine.SetRange("Journal Batch Name", 'USER-A');
            GenJourLine.Init();
            GenJourLine."Document No." := Rec."AVN Voucher No.";//NoSeriesMgt.GetNextNo('JOURNALV', Rec."Posting Date", false);
            GenJourLine."Posting Date" := Rec."Posting Date";
            IF GenJourLine.FindLast() then
                GenJourLine."Line No." := GenJourLine."Line No." + 10000
            else
                GenJourLine."Line No." := 10000;

            GenJourLine."Journal Template Name" := 'JOURNALV';
            GenJourLine."Journal Batch Name" := 'USER-A';
            GenJourLine."Account Type" := GenJourLine."Account Type"::Customer;
            GenJourLine.validate("Account No.", rec."COD Customer Code");
            GenJourLine."Bal. Account Type" := GenJourLine."Bal. Account Type"::"G/L Account";
            GenJourLine.Validate("Bal. Account No.", Rec."Ledger Code");
            //GenJourLine."GST Group Code" := 'Goods';
            GenJourLine.validate(Amount, Rec."COD Amount ");
            GenJourLine.validate("Shortcut Dimension 1 Code", rec."Branch (G1)");
            GenJourLine.validate("Shortcut Dimension 2 Code", rec."Business Vertical (G2)");
            GenJourLine.Comment := 'Auto Post';
            GenJourLine.Insert(true);
            Message('Journal Voucher created with Document No. %1', GenJourLine."Document No.");
        end;
        // IF Not CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJourLine) then begin

        //end;

    end;
}
