pageextension 50100 "SalespersonPurchaserList" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addlast(General)
        {
            field(Password; Rec.Password)
            {
                ToolTip = 'Password';
                ApplicationArea = All;
            }

            field("Item Cluster Code"; Rec."Item Cluster Code")
            {
                ToolTip = 'Specifies the item cluster assigned to this salesperson.';
                ApplicationArea = All;
            }
        }
    }
}
