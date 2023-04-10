table 50003 "Posted Cust\vend Inv Booking"
{
    DataClassification = ToBeClassified;
    Caption = 'Posted Customer\Vendor Inv Booking';



    fields
    {
        field(1; "AVN Document No."; Code[20])
        {
            Caption = 'AVN Document No.';
            DataClassification = ToBeClassified;
        }

        field(2; "Vendor Invoice No."; Code[20])
        {
            Caption = 'Vendor Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Tracking No"; Code[20])
        {
            Caption = 'Tracking No';
            DataClassification = ToBeClassified;
        }
        field(5; "Customer Code"; Code[20])
        {
            Caption = 'Customer Code';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(6; "Vendor Code"; Code[20])
        {
            Caption = 'Vendor Code';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(7; "Shipyaari ID No."; Code[20])
        {
            Caption = 'Shipyaari ID No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Tracking No for RTO If Diff."; Code[20])
        {
            Caption = 'Tracking No for RTO If Different';
            DataClassification = ToBeClassified;
        }
        field(9; "Branch for GST (Location)"; Code[10])
        {
            Caption = 'Branch for GST (Location)';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(10; "Order From Address"; Text[100])
        {
            Caption = 'Order From Address';
            DataClassification = ToBeClassified;
        }
        field(11; "Vendor Invoice Date"; Date)
        {
            Caption = 'Vendor Invoice Date';
            DataClassification = ToBeClassified;
        }
        field(12; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = ToBeClassified;
        }
        field(13; "Ledger Code"; Code[20])
        {
            Caption = 'Ledger Code';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(14; "Amount Before GST"; Decimal)
        {
            Caption = 'Amount Before GST';
            DataClassification = ToBeClassified;
        }
        field(15; "GST Group"; Code[20])
        {
            Caption = 'GST Group';
            DataClassification = ToBeClassified;
            TableRelation = "GST Group".Code;
        }
        field(16; SAC; Code[10])
        {
            Caption = 'SAC';
            DataClassification = ToBeClassified;
            TableRelation = "HSN/SAC".Code;
        }
        field(17; "Shipment Status"; Enum "Shipment Status")
        {
            Caption = 'Shipment Status';
            DataClassification = ToBeClassified;
        }
        field(18; "Branch (G1)"; Code[20])
        {
            Caption = 'Branch (G1)';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(19; "Business Vertical (G2)"; Code[20])
        {
            Caption = 'Business Vertical (G2)';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(20; "Sales Person"; Code[20])
        {
            Caption = 'Sales Person';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(21; "Shipped to address"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ship-to Address".Code;
        }
        field(22; Select; Boolean)
        {
            Caption = 'Select';
            DataClassification = ToBeClassified;
        }
        field(23; "Order Created"; Boolean)
        {
            Caption = 'Order Created';
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(24; "Entry Posted"; Boolean)
        {
            Caption = 'Entry Posted';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "AVN Document No.", "Tracking No", "Customer Code", "Vendor Code")
        {
            Clustered = true;
        }
    }
}
