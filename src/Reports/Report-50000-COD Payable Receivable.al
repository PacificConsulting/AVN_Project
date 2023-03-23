report 50000 "COD Payable Receivable"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Reports Layout\COD Payable Recievable -1.rdl';
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("COD Payable/Receivable"; "COD Payable/Receivable")
        {
            DataItemTableView = sorting("AVN Voucher No.");
            RequestFilterFields = "Tracking No";
            column(Tracking_No; "Tracking No")
            {

            }
            column(COD_Customer_Code; "COD Customer Code")
            {

            }
            column(COD_Vendor_Code; "COD Vendor Code")
            {

            }
            column(Shipment_Status; "Shipment Status")
            {

            }
            column(Delivery_Date; "Delivery Date")
            {

            }
            column(COD_Amount_; "COD Amount ")
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