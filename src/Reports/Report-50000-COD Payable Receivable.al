report 50000 "COD Payable Receivable"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Reports Layout\COD Payable Recievable -1.rdl';


    dataset
    {
        dataitem("COD Payable/Receivable"; "Posted COD Payeble Receivable")
        {
            DataItemTableView = sorting("AVN Voucher No.");
            RequestFilterFields = "Tracking No", "Posting Date";
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
            column(customername; customername)
            {

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                if customer.GET("COD Customer Code") then
                    customername := customer.Name + ' ' + customer."Name 2";
            end;

            // end;

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
        customer: Record Customer;
        customername: text[60];
}