table 50002 "Posted COD Payeble Receivable"
{
    Caption = 'Posted COD Payeble Receivable';
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
        field(4; "COD Customer Code"; Code[20])
        {
            Caption = 'COD Client Payable Code';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
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
        field(14; Select; Boolean)
        {
            Caption = 'Select';
            DataClassification = ToBeClassified;
        }
        field(15; "Client Name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;

        }
        field(16; "Lines Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Lines Created';
        }
        field(17; "Entry Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "AVN Voucher No.", "COD Customer Code", "COD Vendor Code", "Tracking No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {

    }
    var
        reccustomer: Record Customer;
}
