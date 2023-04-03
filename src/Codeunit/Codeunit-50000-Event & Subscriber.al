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
        //<< For COD Payable and Receivalble Data flow to Posted table
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
        //>> For COD Payable and Receivalble Data flow to Posted table

        //<< For Customer/Vendor Invoice Booking Data flow to Posted table
        /*
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
        */
        //>> For Customer/Vendor Invoice Booking Data flow to Posted table
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', true, true)]
    local procedure OnAfterPostSalesLine(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var SalesInvLine: Record "Sales Invoice Line"; var SalesCrMemoLine: Record "Sales Cr.Memo Line"; var xSalesLine: Record "Sales Line")
    var
        CustInvbook: record "Customer/Vendor Inv. Booking";
        PostedCustInvbook: Record "Posted Cust\vend Inv Booking";
    begin
        CustInvbook.Reset();
        CustInvbook.SetRange("AVN Document No.", SalesInvLine."Document No.");
        CustInvbook.SetFilter("Customer Code", '<>%1', '');
        IF CustInvbook.FindFirst() then begin
            PostedCustInvbook.Init();
            PostedCustInvbook.TransferFields(CustInvbook);
            PostedCustInvbook."Entry Posted" := true;
            PostedCustInvbook.Insert();
            CustInvbook."Entry Posted" := true;
            CustInvbook.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchLine', '', true, true)]
    local procedure OnAfterPostPurchLine(var PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; CommitIsSupressed: Boolean; var PurchInvLine: Record "Purch. Inv. Line"; var PurchCrMemoLine: Record "Purch. Cr. Memo Line"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var PurchLineACY: Record "Purchase Line"; GenJnlLineDocType: Enum "Gen. Journal Document Type"; GenJnlLineDocNo: Code[20]; GenJnlLineExtDocNo: Code[35]; SrcCode: Code[10]; xPurchaseLine: Record "Purchase Line")
    var
        VendInvbook: record "Customer/Vendor Inv. Booking";
        PostedVendInvbook: Record "Posted Cust\vend Inv Booking";
    begin
        VendInvbook.Reset();
        VendInvbook.SetRange("AVN Document No.", PurchInvHeader."No.");
        VendInvbook.SetFilter("Customer Code", '<>%1', '');
        IF VendInvbook.FindFirst() then begin
            PostedVendInvbook.Init();
            PostedVendInvbook.TransferFields(VendInvbook);
            PostedVendInvbook."Entry Posted" := true;
            PostedVendInvbook.Insert();
            VendInvbook."Entry Posted" := true;
            VendInvbook.Modify();
        end;
    end;


    var
        myInt: Integer;
}