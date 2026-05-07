page 50122 "API Item Cluster Assignments"
{
    PageType = API;
    Caption = 'apiItemClusterAssignments';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'itemClusterAssignment';
    EntitySetName = 'itemClusterAssignments';

    SourceTable = "Item Cluster Assignment";
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

                field(scopeType; Rec."Scope Type")
                {
                    Caption = 'Scope Type';
                }

                field(scopeCode; Rec."Scope Code")
                {
                    Caption = 'Scope Code';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
