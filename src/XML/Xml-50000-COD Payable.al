xmlport 50000 "COD Payable"
{
    Caption = 'COD Payable';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
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
                fieldelement(CODClientPayableCode; CODPayableReceivable."COD Client Payable Code")
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
        if firstline then begin
            firstline := false;
            currXMLport.Skip();
        end;
    end;

    var
        firstline: Boolean;
}
