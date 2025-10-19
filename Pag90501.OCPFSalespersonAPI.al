page 90501 "OCPF Salesperson API"
{
    APIGroup = 'OCPFMini';
    APIPublisher = 'OnlyCopilotFans';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'ocpfSalespersonAPI';
    DelayedInsert = true;
    EntityName = 'OCPFSalesperson';
    EntitySetName = 'OCPFSalespeople';
    PageType = API;
    SourceTable = "Salesperson/Purchaser";
    ODataKeyFields = systemId;

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
                field("code"; Rec."Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Salesperson Name';
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(noOfOpportunities; Rec."No. of Opportunities")
                {
                    Caption = 'No. of Opportunities';
                }
                field(estimatedValueLCY; Rec."Estimated Value (LCY)")
                {
                    Caption = 'Estimated Value of Opportunities';
                }
                field(commission; Rec."Commission %")
                {
                    Caption = 'Commission %';
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                }
            }
        }
    }
}
