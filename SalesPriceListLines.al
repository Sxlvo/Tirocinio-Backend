page 50112 "API Sales Price List Lines"
{
    PageType = API;
    Caption = 'apiSalesPriceListLines';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'rigaListinoVendita';
    EntitySetName = 'righeListinoVendita';

    SourceTable = "Price List Line";
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

                field(priceListCode; Rec."Price List Code")
                {
                    Caption = 'Price List Code';
                }

                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                }

                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                }

                field(assetType; Rec."Asset Type")
                {
                    Caption = 'Asset Type';
                }

                field(itemNo; Rec."Asset No.")
                {
                    Caption = 'Item No.';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }

                field(minimumQuantity; Rec."Minimum Quantity")
                {
                    Caption = 'Minimum Quantity';
                }

                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }

                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }

                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                }
            }
        }
    }
}