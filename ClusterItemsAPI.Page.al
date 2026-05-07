page 50120 "API Item Clusters"
{
    PageType = API;
    Caption = 'apiItemClusters';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'itemCluster';
    EntitySetName = 'itemClusters';

    SourceTable = "Item Cluster";
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

                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
