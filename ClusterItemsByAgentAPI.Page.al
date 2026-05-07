page 50123 "API Cluster Items By Agent"
{
    PageType = API;
    Caption = 'apiClusterItemsByAgent';
    APIPublisher = 'bs';
    APIGroup = 'tirocinio';
    APIVersion = 'v1.0';
    EntityName = 'clusterItemByAgent';
    EntitySetName = 'clusterItemsByAgent';

    SourceTable = "Cluster Item By Agent Buffer";
    SourceTableTemporary = true;
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
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

                field(agentCode; Rec."Agent Code")
                {
                    Caption = 'Agent Code';
                }

                field(clusterCode; Rec."Cluster Code")
                {
                    Caption = 'Cluster Code';
                }

                field(codiceArticolo; Rec."Item No.")
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

                field(unitaMisura; Rec."Unit of Measure")
                {
                    Caption = 'Unita Misura Vendita';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        AgentCode: Code[20];
    begin
        if Rec.GetFilter("Agent Code") = '' then
            exit;

        AgentCode := CopyStr(Rec.GetRangeMin("Agent Code"), 1, MaxStrLen(AgentCode));
        BuildItemsForAgent(AgentCode);
    end;

    local procedure BuildItemsForAgent(AgentCode: Code[20])
    var
        Salesperson: Record "Salesperson/Purchaser";
    begin
        if not Salesperson.Get(AgentCode) then
            exit;

        if Salesperson."Item Cluster Code" <> '' then
            AddClusterItems(AgentCode, Salesperson."Item Cluster Code");

        AddClustersByScope(AgentCode, "Item Cluster Scope Type"::All, '');
        AddClustersByScope(AgentCode, "Item Cluster Scope Type"::Agent, AgentCode);

        if Salesperson."Item Cluster Group Code" <> '' then
            AddClustersByScope(AgentCode, "Item Cluster Scope Type"::Group, Salesperson."Item Cluster Group Code");
    end;

    local procedure AddClustersByScope(AgentCode: Code[20]; AssignmentScope: Enum "Item Cluster Scope Type"; ScopeCode: Code[20])
    var
        Assignment: Record "Item Cluster Assignment";
    begin
        Assignment.SetRange("Scope Type", AssignmentScope);

        if AssignmentScope <> "Item Cluster Scope Type"::All then
            Assignment.SetRange("Scope Code", ScopeCode);

        if Assignment.FindSet() then
            repeat
                AddClusterItems(AgentCode, Assignment."Cluster Code");
            until Assignment.Next() = 0;
    end;

    local procedure AddClusterItems(AgentCode: Code[20]; ClusterCode: Code[20])
    var
        ClusterLine: Record "Item Cluster Line";
        Item: Record Item;
    begin
        ClusterLine.SetRange("Cluster Code", ClusterCode);

        if ClusterLine.FindSet() then
            repeat
                if not Rec.Get(AgentCode, ClusterLine."Item No.") then begin
                    Rec.Init();
                    Rec."Agent Code" := AgentCode;
                    Rec."Cluster Code" := ClusterCode;
                    Rec."Item No." := ClusterLine."Item No.";
                    Rec.Description := ClusterLine.Description;

                    if Item.Get(ClusterLine."Item No.") then begin
                        Rec.Description := Item.Description;
                        Rec."Unit Price" := Item."Unit Price";
                        Rec."Unit of Measure" := Item."Sales Unit of Measure";
                    end;

                    Rec.Insert();
                end;
            until ClusterLine.Next() = 0;
    end;
}
