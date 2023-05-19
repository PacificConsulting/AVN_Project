tableextension 50002 Vendor_ext extends Vendor
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
