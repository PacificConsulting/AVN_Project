pageextension 50000 "Role Center for Page" extends "Order Processor Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(sections)
        {
            group("XML Ports")
            {
                action("COD Payable")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'COD Payable';
                    Image = EditList;
                    RunObject = xmlport 50000;
                    ToolTip = 'Import the data of COD Payable';
                }
                action("COD Receivable")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'COD Receivable';
                    Image = EditList;
                    RunObject = xmlport 50001;
                    ToolTip = 'Import the data of COD Receivable';
                }
                action("Vendor Invoice Booking")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor Invoice Booking';
                    Image = EditList;
                    RunObject = xmlport 50002;
                    ToolTip = 'Import the data of Vendor Invoice Booking';
                }
                action("Client Invoice Booking")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Client Invoice Booking';
                    Image = EditList;
                    RunObject = xmlport 50003;
                    ToolTip = 'Import the data of Client Invoice Booking';
                }


            }

        }
    }

    // var
    //       myInt: Integer;
}