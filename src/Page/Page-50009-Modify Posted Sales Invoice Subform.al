page 50009 A_line
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Invoice Line";
    Permissions = tabledata 113 = rimd;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;

                }
                field("GST Group Type"; Rec."GST Group Type")
                {
                    ApplicationArea = all;
                }
                field("GST Place of Supply"; Rec."GST Place of Supply")
                { }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
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