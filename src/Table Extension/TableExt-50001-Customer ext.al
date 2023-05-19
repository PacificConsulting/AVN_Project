tableextension 50001 Customer_ext extends Customer
{
    fields
    {
        field(50000; "Shipment Status"; Option)
        {
            Caption = 'Shipment Status';
            DataClassification = ToBeClassified;
            OptionMembers = Open,Delivered,"In Transit",RTO,"RTO In Transit",Others;
            // OptionCaption = 'Open','Delivered','In Transit','RTO','RTO In Transit';
        }
    }
}
