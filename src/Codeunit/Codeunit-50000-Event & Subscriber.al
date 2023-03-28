codeunit 50000 "Event & Subscriber CU"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterPostGenJnlLine', '', true, true)]
    local procedure OnAfterPostGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; Balancing: Boolean)
    var
        POSTEDCOD: Record "Posted COD Payeble Receivable";
        CODPayable: Record "COD Payable/Receivable";
        CustVend: record "Customer/Vendor Inv. Booking";
        Postedcustvend: Record "Posted Cust\vend Inv Booking";
    begin
        /*
        with GenJournalLine do
            case "Account Type" of
                "Account Type"::Customer:
                    begin
                        CODPayable.Reset();
                        CODPayable.SetRange("AVN Voucher No.", GenJournalLine."Document No.");
                        CODPayable.SetFilter("COD Customer Code", '<>%1', '');
                        if CODPayable.FindFirst() then begin
                            POSTEDCOD.Init();
                            POSTEDCOD.TransferFields(CODPayable);
                            POSTEDCOD.Insert();
                        end;
                        CustVend.Reset();
                        CustVend.SetRange("AVN Document No.", GenJournalLine."Document No.");
                        CustVend.SetFilter("Customer Code", '<>%1', '');
                        if CustVend.FindFirst() then begin
                            Postedcustvend.Init();
                            Postedcustvend.TransferFields(CustVend);
                            Postedcustvend.Insert();
                        end;
                    end;
                "Account Type"::Vendor:
                    begin
                        CODPayable.Reset();
                        CODPayable.SetRange("AVN Voucher No.", GenJournalLine."Document No.");
                        CODPayable.SetFilter("COD Vendor Code", '<>%1', '');
                        if CODPayable.FindFirst() then begin
                            POSTEDCOD.Init();
                            POSTEDCOD.TransferFields(CODPayable);
                            POSTEDCOD.Insert();
                        end;
                        CustVend.Reset();
                        CustVend.SetRange("AVN Document No.", GenJournalLine."Document No.");
                        CustVend.SetFilter("Vendor Code", '<>%1', '');
                        if CustVend.FindFirst() then begin
                            Postedcustvend.Init();
                            Postedcustvend.TransferFields(CustVend);
                            Postedcustvend.Insert();
                        end;
                    end;
            end;
            */
        CODPayable.Reset();
        CODPayable.SetRange("AVN Voucher No.", GenJournalLine."Document No.");
        CODPayable.SetFilter("COD Customer Code", '<>%1', '');
        if CODPayable.FindFirst() then begin
            POSTEDCOD.Init();
            POSTEDCOD.TransferFields(CODPayable);
            POSTEDCOD.Insert();
        end;
        CODPayable.Reset();
        CODPayable.SetRange("AVN Voucher No.", GenJournalLine."Document No.");
        CODPayable.SetFilter("COD Vendor Code", '<>%1', '');
        if CODPayable.FindFirst() then begin
            POSTEDCOD.Init();
            POSTEDCOD.TransferFields(CODPayable);
            POSTEDCOD.Insert();
        end;

        CustVend.Reset();
        CustVend.SetRange("AVN Document No.", GenJournalLine."Document No.");
        CustVend.SetFilter("Customer Code", '<>%1', '');
        if CustVend.FindFirst() then begin
            Postedcustvend.Init();
            Postedcustvend.TransferFields(CustVend);
            Postedcustvend.Insert();
        end;
        CustVend.Reset();
        CustVend.SetRange("AVN Document No.", GenJournalLine."Document No.");
        CustVend.SetFilter("Vendor Code", '<>%1', '');
        if CustVend.FindFirst() then begin
            Postedcustvend.Init();
            Postedcustvend.TransferFields(CustVend);
            Postedcustvend.Insert();
        end;
    end;


    var
        myInt: Integer;
}