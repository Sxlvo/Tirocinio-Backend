page 50100 "API Items"
{
    PageType = API;
    Caption = 'apiItems';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'prodotto';
    EntitySetName = 'prodotti';

    SourceTable = Item;
    ODataKeyFields = SystemId;
    DelayedInsert = true;

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

                field(codiceArticolo; Rec."No.")
                {
                    Caption = 'Codice Articolo';
                }

                field(descrizione; Rec.Description)
                {
                    Caption = 'Descrizione';
                }

                field(prezzoUnitario; Rec."Unit Price")
                {
                    Caption = 'Prezzo Unitario';
                }

                field(unitaMisura; Rec."Sales Unit of Measure")
                {
                    Caption = 'Unità Misura Vendita';
                }
            }
        }
    }
}