page 90505 OCPF_Items
{
    APIGroup = 'OCPFMini';
    APIPublisher = 'OnlyCopilotFans';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'ocpfItemAPI';
    DelayedInsert = true;
    EntityName = 'ocpfItem';
    EntitySetName = 'ocpfItems';
    PageType = API;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                }
            }
        }
    }
    [ServiceEnabled]
    [Scope('Cloud')]
    procedure MyItemReplish(ItemNo: Code[20])
    var
        Item: Record Item;
    begin
        Item.Get(ItemNo);
        Item."Replenishment System" := Item."Replenishment System"::Assembly;
        Item.Modify();
    end;
}
