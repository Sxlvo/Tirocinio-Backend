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
    SourceTableView = where("Document Type" = const(Order));

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId) { Caption = 'Id'; }
                field(numeroOrdine; Rec."No.") { Caption = 'Numero Ordine'; }
                field(numeroCliente; Rec."Sell-to Customer No.") { Caption = 'Numero Cliente'; }
                field(nomeCliente; Rec."Sell-to Customer Name") { Caption = 'Nome Cliente'; }
                field(dataDocumento; Rec."Document Date") { Caption = 'Data Documento'; }
                field(dataRegistrazione; Rec."Posting Date") { Caption = 'Data Registrazione'; }
                field(stato; Rec.Status) { Caption = 'Stato'; }
                field(codiceAttivita; Rec."Activity Code") { Caption = 'Codice Attività'; }
                field(totaleOrdine; Rec.Amount) { Caption = 'Totale Ordine'; }
                field(totaleConIva; Rec."Amount Including VAT") { Caption = 'Totale con IVA'; }
                field(salespersonCode; Rec."Salesperson Code") { Caption = 'SalesPerson Code'; }

                field(shipToCode; Rec."Ship-to Code") { Caption = 'Ship-to Code'; }
                field(shipToName; Rec."Ship-to Name") { Caption = 'Ship-to Name'; }
                field(shipToAddress; Rec."Ship-to Address") { Caption = 'Ship-to Address'; }
                field(shipToCity; Rec."Ship-to City") { Caption = 'Ship-to City'; }
                field(shipToPostCode; Rec."Ship-to Post Code") { Caption = 'Ship-to Post Code'; }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Order;
    end;
}