table 50000 "COD Payable/Receivable"
{
    Caption = 'COD Payable/Receivable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "AVN Voucher No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Tracking No"; Code[20])
        {
            Caption = 'Tracking No';
            DataClassification = ToBeClassified;
        }
        field(4; "COD Client Payable Code"; Code[20])
        {
            Caption = 'COD Client Payable Code';
            DataClassification = ToBeClassified;
        }
        field(5; "COD Vendor Code"; Code[20])
        {
            Caption = 'COD Vendor Code';
            DataClassification = ToBeClassified;
            TableRelation = vendor."No.";
        }
        field(6; "Portal Report Number "; Code[20])
        {
            Caption = 'Portal Report Number ';
            DataClassification = ToBeClassified;
        }
        field(7; "Ledger Code"; Code[20])
        {
            Caption = 'Ledger Code';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(8; "COD Amount "; Decimal)
        {
            Caption = 'COD Amount ';
            DataClassification = ToBeClassified;
        }
        field(9; "Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = ToBeClassified;
        }
        field(10; "Shipment Status"; Enum "Shipment Status")
        {
            Caption = 'Shipment Status';
            DataClassification = ToBeClassified;
        }
        field(11; "Sales Person"; Code[20])
        {
            Caption = 'Sales Person';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(12; "Branch (G1)"; Code[20])
        {
            Caption = 'Branch (G1)';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(13; "Business Vertical (G2)"; Code[20])
        {
            Caption = 'Business Vertical (G2)';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(14;Select;Boolean)
        {
            Caption='Select';
            DataClassification=ToBeClassified;
        }
    }
    keys
    {
        key(PK; "AVN Voucher No.")
        {
            Clustered = true;
        }
    }
}
