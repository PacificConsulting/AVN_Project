page 50008 A_Header
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Invoice Header";
    Permissions = tabledata 112 = rimd;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                field("No."; Rec."No.")
                {

                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {

                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {

                }
                field("Nature of Supply";
                Rec."Nature of Supply")
                {
                    ApplicationArea = All;
                    Editable = true;

                }

                field("GST Customer Type"; Rec."GST Customer Type")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Location State Code"; Rec."Location State Code")
                {
                    ApplicationArea = All;
                }
                field("Location GST Reg. No."; Rec."Location GST Reg. No.")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}