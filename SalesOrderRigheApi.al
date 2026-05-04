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

                    trigger OnValidate()
                    begin
                        Rec.Type := Rec.Type::Item;
                        Rec.Validate("No.", Rec."No.");
                    end;
                }

                field(unitaMisura; Rec."Unit of Measure Code")
                {
                    Caption = 'Unità Misura';

                    trigger OnValidate()
                    begin
                        Rec.Validate("Unit of Measure Code", Rec."Unit of Measure Code");
                    end;
                }

                field(quantita; Rec.Quantity)
                {
                    Caption = 'Quantità';

                    trigger OnValidate()
                    begin
                        Rec.Validate(Quantity, Rec.Quantity);
                    end;
                }

                field(prezzoUnitario; Rec."Unit Price")
                {
                    Caption = 'Prezzo Unitario';

                    trigger OnValidate()
                    begin
                        Rec.Validate("Unit Price", Rec."Unit Price");
                    end;
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Order;
        Rec.Type := Rec.Type::Item;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SalesLine: Record "Sales Line";
        ItemNo: Code[20];
        Qty: Decimal;
        UnitPrice: Decimal;
        UnitOfMeasureCode: Code[10];
    begin
        ItemNo := Rec."No.";
        Qty := Rec.Quantity;
        UnitPrice := Rec."Unit Price";
        UnitOfMeasureCode := Rec."Unit of Measure Code";

        Rec."Document Type" := Rec."Document Type"::Order;
        Rec.Type := Rec.Type::Item;

        if Rec."Line No." = 0 then begin
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."Document No.");

            if SalesLine.FindLast() then
                Rec."Line No." := SalesLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;

        if ItemNo <> '' then
            Rec.Validate("No.", ItemNo);

        if UnitOfMeasureCode <> '' then
            Rec.Validate("Unit of Measure Code", UnitOfMeasureCode);

        if Qty <> 0 then
            Rec.Validate(Quantity, Qty);

        if UnitPrice <> 0 then
            Rec.Validate("Unit Price", UnitPrice);

        exit(true);
    end;
}