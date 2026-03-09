page 50107 "Agent Login API"
{
    PageType = API;
    APIPublisher = 'bssrl';
    APIGroup = 'login';
    APIVersion = 'v1.0';
    EntityName = 'agentLogin';
    EntitySetName = 'agentLogins';
    SourceTable = "Salesperson/Purchaser";
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId) { }
                field(email; Rec."E-Mail") { }
                field(password; Rec.Password) { }
                field(name; Rec.Name) { }
            }
        }
    }

    [ServiceEnabled]
    procedure VerifyCredentials(Email: Text; UserPassword: Text): Text
    var
        Salesperson: Record "Salesperson/Purchaser";
    begin
        Salesperson.SetRange("E-Mail", Email);
        Salesperson.SetRange("Password", UserPassword);

        if Salesperson.FindFirst() then
            exit('Success:' + Salesperson.Name)
        else
            Error('Invalid credentials');
    end;
}