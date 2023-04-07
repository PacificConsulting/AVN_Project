xmlport 50003 "Client invoice Booking"
{
    Caption = 'Client invoice Booking';
    DefaultFieldsValidation = true;
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(ClientVendorInvoiceBooking; "Customer/Vendor Inv. Booking")
            {
                XmlName = 'Import';
                fieldelement(AVNDocumentNo; ClientVendorInvoiceBooking."AVN Document No.")
                {
                }
                fieldelement(PostingDate; ClientVendorInvoiceBooking."Posting Date")
                {
                }
                fieldelement(TrackingNo; ClientVendorInvoiceBooking."Tracking No")
                {
                }
                fieldelement(ShipyaariIDNo; ClientVendorInvoiceBooking."Shipyaari ID No.")
                {
                }
                fieldelement(ClientCode; ClientVendorInvoiceBooking."Customer Code")
                {
                }
                fieldelement(BranchforGSTLocation; ClientVendorInvoiceBooking."Branch for GST (Location)")
                {
                }
                fieldelement(Shippedtoaddress; ClientVendorInvoiceBooking."Shipped to address")
                {
                }
                fieldelement(LedgerCode; ClientVendorInvoiceBooking."Ledger Code")
                {
                }
                fieldelement(AmountBeforeGST; ClientVendorInvoiceBooking."Amount Before GST")
                {
                }
                fieldelement(GSTGroup; ClientVendorInvoiceBooking."GST Group")
                {
                }
                fieldelement(SAC; ClientVendorInvoiceBooking.SAC)
                {
                }
                fieldelement(ShipmentStatus; ClientVendorInvoiceBooking."Shipment Status")
                {
                }
                fieldelement(BranchG1; ClientVendorInvoiceBooking."Branch (G1)")
                {
                }
                fieldelement(BusinessVerticalG2; ClientVendorInvoiceBooking."Business Vertical (G2)")
                {
                }
                fieldelement(SalesPerson; ClientVendorInvoiceBooking."Sales Person")
                {
                }
                fieldelement(SalesPerson; ClientVendorInvoiceBooking."Sales Person")
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

    trigger OnPostXmlPort()
    begin
        Message('Done');
    end;

    var
        firstline: Boolean;
        I: Integer;
}
