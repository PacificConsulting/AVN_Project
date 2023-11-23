pageextension 50009 posted_sales_invoice_ext extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Due Date")
        {
            field("PI No."; Rec."PI No.")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}