pageextension 50007 Purchase_Invoice_List_Ext extends "Purchase Invoices"
{
    layout
    {
        // addafter("Vendor Invoice No.")
        // {
        //     field(SelectInvoice; SelectInvoice)
        //     {
        //         ApplicationArea = all;
        //     }
        // }
        // Add changes to page layout here
    }

    var
        myInt: Integer;
        SelectInvoice: Boolean;
}