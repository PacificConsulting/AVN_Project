xmlport 50002 "Vendor Invoice Booking"
{
    Caption = 'Vendor Invoice Booking';
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
                fieldelement(TrackingNoforRTOIfDiff; ClientVendorInvoiceBooking."Tracking No for RTO If Diff.")
                {
                }
                fieldelement(VendorCode; ClientVendorInvoiceBooking."Vendor Code")
                {
                }
                fieldelement(BranchforGSTLocation; ClientVendorInvoiceBooking."Branch for GST (Location)")
                {
                }
                fieldelement(OrderFromAddress; ClientVendorInvoiceBooking."Order From Address")
                {
                }
                fieldelement(VendorInvoiceNo; ClientVendorInvoiceBooking."Vendor Invoice No.")
                {
                }
                fieldelement(VendorInvoiceDate; ClientVendorInvoiceBooking."Vendor Invoice Date")
                {
                }
                fieldelement(DueDate; ClientVendorInvoiceBooking."Due Date")
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
