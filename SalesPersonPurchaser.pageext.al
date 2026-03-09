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
        }
    }
}