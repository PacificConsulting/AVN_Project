tableextension 50003 "Sales Line Cust Inv Update" extends "Sales Line"
{
    fields
    {
        field(50000; "Customer Inv Amount"; Decimal)
        {
            Caption = 'Customer Inv Amount';
            DataClassification = ToBeClassified;
        }
    }
}
