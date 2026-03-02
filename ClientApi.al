page 50101 "API Client List"
{
    PageType = API;
    Caption = 'apiClientList';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'cliente';
    EntitySetName = 'clienti';
    SourceTable = Customer;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field(codiceCliente; Rec."No.")
                {
                    Caption = 'Codice Cliente';
                }
                field(nome; Rec.Name)
                {
                    Caption = 'Nome';
                }
                field(indirizzo; Rec.Address)
                {
                    Caption = 'Indirizzo';
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
            }
        }
    }
}