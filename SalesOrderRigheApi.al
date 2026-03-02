page 50103 "API Sales Order Line"
{
    PageType = API;
    Caption = 'apiSalesOrderLine';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'rigaOrdine';
    EntitySetName = 'righeOrdine';

    SourceTable = "Sales Line";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    // Filtro solo per gli Ordini
    SourceTableView = where("Document Type" = const(Order));

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

                field(tipoDocumento; Rec."Document Type")
                {
                    Caption = 'Tipo Documento';
                }
                field(numeroOrdine; Rec."Document No.")
                {
                    Caption = 'Numero Ordine';
                }
                field(numeroRiga; Rec."Line No.")
                {
                    Caption = 'Numero Riga';
                }

                field(tipoRiga; Rec.Type)
                {
                    Caption = 'Tipo Riga';
                }
                field(codiceArticolo; Rec."No.")
                {
                    Caption = 'Codice Articolo';
                }
                field(quantita; Rec.Quantity)
                {
                    Caption = 'Quantità';
                }
                field(prezzoUnitario; Rec."Unit Price")
                {
                    Caption = 'Prezzo Unitario';
                }
                field(totaleRiga; Rec.Amount)
                {
                    Caption = 'Totale Riga';
                }
                field(totaleRigaConIva; Rec."Amount Including VAT")
                {
                    Caption = 'Totale Riga con IVA';
                }
            }
        }
    }
}