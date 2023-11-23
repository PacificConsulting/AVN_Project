page 50001 "Customer/Vendor Inv. Booking"
{
    ApplicationArea = All;
    Caption = 'Customer Invoice Booking';
    PageType = List;
    SourceTable = "Customer/Vendor Inv. Booking";
    UsageCategory = Lists;
    SourceTableView = where("Customer Code" = filter(<> ''), "Entry Posted" = filter(false));
    RefreshOnActivate = true;

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
                field("Shipyaari ID No."; Rec."Shipyaari ID No.")
                {
                    ToolTip = 'Specifies the value of the Shipyaari ID No. field.';
                }
                field("Client Code"; Rec."Customer Code")
                {
                    ToolTip = 'Specifies the value of the Client Code field.';
                }
                field("Branch for GST (Location)"; Rec."Branch for GST (Location)")
                {
                    ToolTip = 'Specifies the value of the Branch for GST (Location) field.';
                }
                field("Shipped to address"; Rec."Shipped to address")
                {
                    ToolTip = 'Specifies the value of the Shipped to address field.';
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

                field(Select; Rec.Select)
                {
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field("Order Created"; Rec."Order Created")
                {

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
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
                    vendBookLine: Record "Customer/Vendor Inv. Booking";
                    Progress: Dialog;
                    Counter: Integer;
                    Text000: Label 'Selecting Lines to ------ #1';

                begin
                    //CurrPage.SetSelectionFilter(vendBookLine);
                    Counter := 0;
                    Progress.OPEN(Text000, Counter);
                    vendBookLine.Reset();
                    vendBookLine.SetRange(Select, false);
                    vendBookLine.SetRange("Order Created", false);
                    vendBookLine.SetRange("Entry Posted", false);
                    vendBookLine.SetFilter("Customer Code", '<>%1', '');
                    IF vendBookLine.FindSet() then
                        repeat
                            vendBookLine.Select := true;
                            vendBookLine.Modify();
                            Counter := Counter + 1;
                            Progress.Update();
                            Sleep(3);
                        until vendBookLine.Next() = 0;
                    Message('All Lines has been selected');
                    Progress.Close();
                end;
            }
            action("Order Create false")
            {
                //Caption = 'Select All Lines';
                Image = Line;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = false;
                trigger OnAction()
                var
                    vendBookLine: Record "Customer/Vendor Inv. Booking";
                begin
                    CurrPage.SetSelectionFilter(vendBookLine);
                    vendBookLine.SetRange("Order Created", true);
                    vendBookLine.SetFilter("Customer Code", '<>%1', '');
                    IF vendBookLine.FindSet() then
                        repeat
                            vendBookLine."Order Created" := false;
                            vendBookLine.Modify();
                        until vendBookLine.Next() = 0;
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
                    vendBookLine: Record "Customer/Vendor Inv. Booking";
                    Progress: Dialog;
                    Counter: Integer;
                    Text000: Label 'De-selecting to ------ #1';
                begin
                    Counter := 0;
                    Progress.OPEN(Text000, Counter);
                    vendBookLine.Reset();
                    vendBookLine.SetRange(Select, true);
                    vendBookLine.SetRange("Order Created", false);
                    vendBookLine.SetRange("Entry Posted", false);
                    vendBookLine.SetFilter("Customer Code", '<>%1', '');
                    IF vendBookLine.FindSet() then
                        repeat
                            vendBookLine.Select := false;
                            vendBookLine.Modify();
                            Counter := Counter + 1;
                            Progress.Update();
                            Sleep(3);
                        until vendBookLine.Next() = 0;
                    Progress.Close();
                    Message('All Lines has been De-selected');
                end;
            }
            action("Create Sales Invoice")
            {
                Caption = 'Create Sales Invoice';
                Image = SalesInvoice;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    CustInv: Record "Customer/Vendor Inv. Booking";
                    CustInvNew: Record "Customer/Vendor Inv. Booking";
                    DocNo: code[20];
                    Progress: Dialog;
                    Counter: Integer;
                    Text000: Label 'Counting to ------ #1';
                    SalesLineFilter: Record 37;
                begin
                    //CustInv.Reset();
                    Counter := 0;
                    Progress.OPEN(Text000, Counter);
                    currpage.SetSelectionFilter(CustInv);
                    CustInv.SetRange(Select, true);
                    CustInv.SetRange("Order Created", false);
                    IF CustInv.FindSet() then
                        repeat
                            CreateSalesInvoice(CustInv);
                            IF DocNo <> CustInv."AVN Document No." then begin
                                Message('Sales Invoice "Order Created" with Document No. %1', CustInv."AVN Document No.");
                            end;
                            DocNo := CustInv."AVN Document No.";
                            Counter := Counter + 1;
                            Progress.Update();
                            Sleep(3);
                        until CustInv.Next() = 0;

                    SalesLineFilter.Reset();
                    SalesLineFilter.SetCurrentKey(Type, "Document No.", "No.", "HSN/SAC Code");
                    SalesLineFilter.SetRange(Type, SalesLineFilter.Type::"G/L Account");
                    SalesLineFilter.SetFilter("Customer Inv Amount", '<>%1', 0);
                    SalesLineFilter.SetRange("Document Type", SalesLineFilter."Document Type"::Invoice);
                    //SalesLineFilter.SetRange("Document No.", CustInv."AVN Document No.");
                    IF SalesLineFilter.FindSet() then
                        repeat
                            SalesLineFilter.Validate("Unit Price", SalesLineFilter."Customer Inv Amount");
                            SalesLineFilter."Customer Inv Amount" := 0;
                            SalesLineFilter.Modify();
                        until SalesLineFilter.Next() = 0;
                    Progress.CLOSE();
                end;
            }
        }
    }
    local procedure CreateSalesInvoice(CustInvBookFilter: Record "Customer/Vendor Inv. Booking") //custDocumentNo: Code[20]; GLcode: Code[20]; SACcode: Code[20]
    var
        SalesHeader: record "Sales Header";
        SalesHFilter: Record "Sales Header";
        SalesLineFilter: Record "Sales Line";
        SalesLineInit: Record "Sales Line";
        SalesL: Record "Sales Line";
        NoSeriesMgt: Codeunit 396;
        CustInvBookSL: Record "Customer/Vendor Inv. Booking";
        AmtBeforeGST: Decimal;
        Cust: Record 18;
    begin

        SalesHFilter.Reset();
        SalesHFilter.SetCurrentKey("No.");
        SalesHFilter.SetRange("No.", CustInvBookFilter."AVN Document No.");
        IF Not SalesHFilter.FindFirst() then begin
            SalesHeader.Init();
            SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
            SalesHeader.Validate("No.", CustInvBookFilter."AVN Document No.");
            SalesHeader.Insert(true);
            SalesHeader.Validate("Sell-to Customer No.", CustInvBookFilter."Customer Code");
            SalesHeader.Validate("Posting Date", CustInvBookFilter."Posting Date");
            SalesHeader.Validate("Location Code", CustInvBookFilter."Branch for GST (Location)");
            SalesHeader.validate("Ship-to Code", CustInvBookFilter."Shipped to address");
            SalesHeader.Validate("Shortcut Dimension 1 Code", CustInvBookFilter."Branch (G1)");
            SalesHeader.Validate("Shortcut Dimension 2 Code", CustInvBookFilter."Business Vertical (G2)");
            SalesHeader.Validate("Salesperson Code", CustInvBookFilter."Sales Person");
            SalesHeader.Validate("Posting No.", CustInvBookFilter."AVN Document No.");
            if Cust.get(CustInvBookFilter."Customer Code") then
                if Cust."GST Customer Type" <> Cust."GST Customer Type"::Unregistered then
                    SalesHeader.Validate("Nature of Supply", SalesHeader."Nature of Supply"::B2B);  //PCPL
            SalesHeader.Modify();
        end;

        SalesLineFilter.Reset();
        SalesLineFilter.SetCurrentKey(Type, "Document No.", "No.", "HSN/SAC Code");
        SetSelectionFilter(CustInvBookFilter);
        SalesLineFilter.SetRange(Type, SalesLineFilter.Type::"G/L Account");
        SalesLineFilter.SetRange("Document No.", CustInvBookFilter."AVN Document No.");
        SalesLineFilter.SetRange("No.", CustInvBookFilter."Ledger Code");
        SalesLineFilter.SetRange("HSN/SAC Code", CustInvBookFilter.SAC);
        IF not SalesLineFilter.FindFirst() then begin
            SaleslineInit.Init();
            SaleslineInit."Document Type" := SaleslineInit."Document Type"::Invoice;
            SaleslineInit."Document No." := CustInvBookFilter."AVN Document No.";

            SalesL.Reset();
            SalesL.SetRange("Document No.", CustInvBookFilter."AVN Document No.");
            IF not SalesL.FindFirst() then
                SaleslineInit."Line No." := 10000
            else
                SalesLineInit."Line No." := SalesL."Line No." + 10000;

            SaleslineInit.Insert(true);
            SaleslineInit.Type := SaleslineInit.Type::"G/L Account";
            SaleslineInit.Validate("No.", CustInvBookFilter."Ledger Code");
            SalesLineInit.Validate(Quantity, 1);

            SalesLineInit."Customer Inv Amount" := CustInvBookFilter."Amount Before GST";
            SaleslineInit.Validate("GST Group Code", CustInvBookFilter."GST Group");
            SaleslineInit.Validate("HSN/SAC Code", CustInvBookFilter.SAC);
            SalesLineInit.SetRange("GST Credit", SalesLineInit."GST Credit"::Availment);
            SaleslineInit.Modify();
            CustInvBookFilter."Order Created" := true;
            CustInvBookFilter.Modify();
        end else begin
            SalesLineFilter."Customer Inv Amount" += CustInvBookFilter."Amount Before GST";
            SalesLineFilter.Modify();
            CustInvBookFilter."Order Created" := true;
            CustInvBookFilter.Modify();
        end;
    end;
}
