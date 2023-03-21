xmlport 50001 "COD Receivalble"
{
    Caption = 'COD Payable';
    DefaultFieldsValidation = true;
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(CODPayableReceivable; "COD Payable/Receivable")
            {
                XmlName = 'Import';
                fieldelement(AVNVoucherNo; CODPayableReceivable."AVN Voucher No.")
                {
                }
                fieldelement(Postingdate; CODPayableReceivable."Posting Date")
                {
                }
                fieldelement(TrackingNo; CODPayableReceivable."Tracking No")
                {
                }
                fieldelement(CODClientPayableCode; CODPayableReceivable."COD Vendor Code")
                {
                }
                fieldelement(PortalReportNumber; CODPayableReceivable."Portal Report Number ")
                {
                }
                fieldelement(LedgerCode; CODPayableReceivable."Ledger Code")
                {
                }
                fieldelement(CODAmount; CODPayableReceivable."COD Amount ")
                {
                }
                fieldelement(DeliveryDate; CODPayableReceivable."Delivery Date")
                {
                }
                fieldelement(ShipmentStatus; CODPayableReceivable."Shipment Status")
                {
                }
                fieldelement(SalesPerson; CODPayableReceivable."Sales Person")
                {
                }
                fieldelement(BranchG1; CODPayableReceivable."Branch (G1)")
                {
                }
                fieldelement(BusinessVerticalG2; CODPayableReceivable."Business Vertical (G2)")
                {
                }
                trigger OnAfterInitRecord()
                begin
                    I += 1;
                    IF I = 1 THEN
                        currXMLport.SKIP;
                end;
            }
        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    // Initialize the flag on pre-xmlport event
    trigger OnPreXmlPort()
    begin
        firstline := true;
    end;

    trigger OnInitXmlPort()
    begin
        // if firstline then begin
        //     firstline := false;
        //     currXMLport.Skip();
        // end;
    end;

    trigger OnPostXmlPort()
    begin
        Message('Done');
    end;

    var
        firstline: Boolean;
        I: Integer;
}
