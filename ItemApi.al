page 50100 "API Item List"
{
    PageType = API;
    Caption = 'apiItemList';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'prodotto';
    EntitySetName = 'prodotti';
    SourceTable = Item;
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
                field(codiceArticolo; Rec."No.")
                {
                    Caption = 'CodiceArticolo';
                }
                field(descrizione; Rec.Description)
                {
                    Caption = 'Descrizione';
                }
                field(prezzoUnitario; Rec."Unit Price")
                {
                    Caption = 'PrezzoUnitario';
                }
                field(giacenza; Rec.Inventory)
                {
                    Caption = 'Giacenza';
                }
                field(Picture; Rec.Picture)
                {
                    Caption = 'Foto';
                }
            }
        }
    }
}