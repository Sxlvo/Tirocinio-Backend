page 50102 "API Sales Order"
{
    PageType = API;
    Caption = 'apiSalesOrder';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'ordine';
    EntitySetName = 'ordini';

    SourceTable = "Sales Header";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    // Filtro solo gli ordini
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
                field(numeroOrdine; Rec."No.")
                {
                    Caption = 'Numero Ordine';
                }
                field(numeroCliente; Rec."Sell-to Customer No.")
                {
                    Caption = 'Numero Cliente';
                }
                field(nomeCliente; Rec."Sell-to Customer Name")
                {
                    Caption = 'Nome Cliente';
                }
                field(dataDocumento; Rec."Document Date")
                {
                    Caption = 'Data Documento';
                }
                field(dataRegistrazione; Rec."Posting Date")
                {
                    Caption = 'Data Registrazione';
                }
                field(stato; Rec.Status)
                {
                    Caption = 'Stato';
                }
                field(codiceAttivita; Rec."Activity Code")
                {
                    Caption = 'Codice Attività';
                }
                // Totale dell'intero ordine (ricalcolato in automatico dal sistema)
                field(totaleOrdine; Rec.Amount)
                {
                    Caption = 'Totale Ordine';
                }
                field(totaleConIva; Rec."Amount Including VAT")
                {
                    Caption = 'Totale con IVA';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'SalesPerson Code';
                }
            }
        }
    }
}