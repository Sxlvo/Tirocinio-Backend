tableextension 50100 "Salesperson/Purchaser" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50000; "Password"; Text[100])
        {
            Caption = 'Password';
            ExtendedDatatype = Masked;
        }
    }
}