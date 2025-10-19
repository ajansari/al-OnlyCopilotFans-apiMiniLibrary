page 90502 "OCPF Customer Ledger Entry API"
{
    APIGroup = 'OCPFMini';
    APIPublisher = 'OnlyCopilotFans';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'ocpfCustomerLedgerEntryAPI';
    DelayedInsert = true;
    EntityName = 'OCPFCustomerLedgerEntry';
    EntitySetName = 'OCPFCustomerLedgerEntries';
    PageType = API;
    SourceTable = "Cust. Ledger Entry";
    ODataKeyFields = systemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Customer Ledger Entry No.';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(reversed; Rec.Reversed)
                {
                    Caption = 'Reversed';
                }
                field(remainingAmtLCY; Rec."Remaining Amt. (LCY)")
                {
                    Caption = 'Remaining Amount';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(originalAmtLCY; Rec."Original Amt. (LCY)")
                {
                    Caption = 'Original Amount';
                }
                field(open; Rec.Open)
                {
                    Caption = 'Open';
                }
                field(onHold; Rec."On Hold")
                {
                    Caption = 'On Hold';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                }
            }
        }
    }
}
