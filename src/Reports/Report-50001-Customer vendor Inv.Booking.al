report 50001 "Customer Vendor Inv. Booking"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Reports Layout\Customer Vendor Invoice Booking -1.rdl';
    // DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Customer/Vendor Inv. Booking"; "Customer/Vendor Inv. Booking")
        {
            column(Tracking_No; "Tracking No")
            {

            }
            column(Shipment_Status; "Shipment Status")
            {

            }
            column(Business_Vertical__G2_; "Business Vertical (G2)")
            {

            }
            column(Amount_Before_GST; "Amount Before GST")
            {

            }

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        myInt: Integer;
}