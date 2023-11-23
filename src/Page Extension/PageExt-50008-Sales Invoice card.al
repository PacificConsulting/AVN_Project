pageextension 50008 sales_invoice_card_ext extends "Sales Invoice"
{
    layout
    {
        addafter("Posting Date")
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