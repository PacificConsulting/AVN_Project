report 50002 "Purchase Order"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Reports Layout\Purchase Order.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Buy-from Vendor No.", "Posting Date";
            column(No_; "No.")
            {

            }
            column(Order_Date; "Order Date")
            {

            }
            column(cominfo_Picture; cominfo.Picture)
            {

            }
            column(cominfo_name; cominfo.Name)
            {

            }
            column(cominfo_name2; cominfo.Name + '' + cominfo."Name 2")
            {

            }
            column(cominfo_address; cominfo.Address + '' + cominfo."Address 2" + ',' + cominfo.City + ',' + cominfo."Post Code")
            {

            }
            column(cominfo_mail; cominfo."E-Mail")
            {

            }
            column(Pay_to_Name; "Pay-to Name")
            {

            }
            column(Pay_to_Name2; "Pay-to Name" + '' + "Pay-to Name 2")
            {

            }
            column(Pay_to_Address; "Pay-to Address" + '' + "Pay-to Address 2" + ',' + "Pay-to City" + ',' + "Pay-to Post Code")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Buy_from_Vendor_Name2; "Buy-from Vendor Name" + '' + "Buy-from Vendor Name 2")
            {

            }
            column(Buy_from_Address; "Buy-from Address" + '' + "Buy-from Address 2" + ',' + "Buy-from City" + ',' + "Buy-from Post Code")
            {

            }
            column(BuyGSTIN; BuyGSTIN)
            {

            }
            column(payGSTIN; payGSTIN)
            {

            }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Purchase Header";
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }
                column(Amount; Amount)
                {

                }
                trigger OnAfterGetRecord()  //PL
                begin

                end;
            }
            trigger OnAfterGetRecord()  //PH
            begin
                IF RVend.GET("Purchase Header"."Buy-from Vendor No.") THEN
                    BuyGSTIN := RVend."GST Registration No.";

                IF RVend.GET("Purchase Header"."Pay-to Vendor No.") THEN
                    payGSTIN := RVend."GST Registration No.";

            end;


            trigger OnPreDataItem()  //PH
            begin
                cominfo.get();
                cominfo.CalcFields(Picture);
            end;


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
        cominfo: Record "Company Information";
        RVend: Record Vendor;
        BuyGSTIN: Code[20];
        payGSTIN: Code[20];
}