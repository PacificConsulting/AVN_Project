xmlport 50003 "Client invoice Booking"
{
    Caption = 'Client invoice Booking';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(ClientVendorInvoiceBooking; "Client/Vendor Invoice Booking")
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
                fieldelement(ClientCode; ClientVendorInvoiceBooking."Client Code")
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
