pageextension 50004 BankReceiptVoucher_Ext extends "Bank Receipt Voucher"
{
    layout
    {
        modify("External Document No.")
        {
            Visible = true;
        }
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()

            begin
                rec.TestField("Document Type");
                if rec."Document Type" = rec."Document Type"::Payment then begin
                    rec.TestField("External Document No.");
                end;
            end;

        }
        modify(Preview)
        {
            trigger OnBeforeAction()

            begin
                rec.TestField("Document Type");
                if (rec."Document Type" = rec."Document Type"::Payment) then begin
                    rec.TestField("External Document No.");
                end;
            end;
        }
    }

    var
        myInt: Integer;
}