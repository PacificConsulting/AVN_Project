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
            group("Customer/Vendor Inv. Booking")
            {
                group(XML)
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
                group("COD Customer/vendor")
                {
                    action("COD Payable List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'COD Payable List';
                        Image = EditList;
                        RunObject = Page 50000;
                        ToolTip = 'Import the data of COD Payable';
                    }
                    action("COD Receivable List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'COD Receivable List';
                        Image = EditList;
                        RunObject = Page 50002;
                        ToolTip = 'Import the data of COD Receivable';
                    }
                    action("Vendor Invoice Booking List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Vendor Invoice Booking';
                        Image = EditList;
                        RunObject = Page 50003;
                        ToolTip = 'Import the data of Vendor Invoice Booking';
                    }
                    action("Client Invoice Booking List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Client Invoice Booking';
                        Image = EditList;
                        RunObject = page 50001;
                        ToolTip = 'Import the data of Client Invoice Booking';
                    }
                }
                group("Posted COD Customer/vendor")
                {

                    action("Posted Vendor Invoice Booking List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Vendor Invoice Booking';
                        Image = PostDocument;
                        RunObject = Page 50005;
                        ToolTip = 'Posted data of Vendor Invoice Booking';
                    }
                    action("Posted Client Invoice Booking List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Client Invoice Booking';
                        Image = PostDocument;
                        RunObject = page 50004;
                        ToolTip = 'Posted data of Client Invoice Booking';
                    }
                }
            }
        }
    }

}