page 50121 "API Item Cluster Lines"
{
    PageType = API;
    Caption = 'apiItemClusterLines';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'itemClusterLine';
    EntitySetName = 'itemClusterLines';

    SourceTable = "Item Cluster Line";
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

                field(clusterCode; Rec."Cluster Code")
                {
                    Caption = 'Cluster Code';
                }

                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
