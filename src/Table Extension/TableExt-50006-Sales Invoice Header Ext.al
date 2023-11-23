tableextension 50006 sales_Invoice_header_Ext extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "PI No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "E-Invoice IRN No."; Code[100])
        {
            FieldClass = FlowField;
            // CalcFormula = sum();
        }
        // Add changes to table fields here
    }

    var
    //EInvoiceDetail: Record "E-Invoice Detail";

}