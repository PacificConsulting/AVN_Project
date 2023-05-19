pageextension 50006 CashReceiptVoucher_Ext extends "Cash Receipt Voucher"
{
    layout
    {
        modify("External Document No.")
        {
            Visible = true;
        }

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

}