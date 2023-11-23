tableextension 50005 sales_header_Ext extends "Sales Header"
{
    fields
    {
        field(50000; "PI No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
}