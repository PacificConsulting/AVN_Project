pageextension 50003 BankPaymentVoucher_Ext extends "Bank Payment Voucher"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()

            begin
                rec.TestField("Document Type");
                if (rec."Document Type" = rec."Document Type"::Payment) then begin
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