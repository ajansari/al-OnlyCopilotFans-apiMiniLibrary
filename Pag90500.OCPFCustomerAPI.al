page 90500 "OCPF Customer API"
{
    APIGroup = 'OCPFMini';
    APIPublisher = 'OnlyCopilotFans';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'ocpfCustomerAPI';
    DelayedInsert = true;
    EntityName = 'OCPFCustomer';
    EntitySetName = 'OCPFCustomers';
    PageType = API;
    SourceTable = Customer;
    ODataKeyFields = systemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'Customer No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Customer Name';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field(balanceLCY; Rec."Balance (LCY)")
                {
                    Caption = 'Total Balance';
                }
                field(balanceDueLCY; Rec."Balance Due (LCY)")
                {
                    Caption = 'Overdue Balance';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country Code';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(county; Rec.County)
                {
                    Caption = 'State';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'ZIP Code';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'General Business Posting Group';
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field(salesLCY; Rec."Sales (LCY)")
                {
                    Caption = 'Total Sales';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(creditLimitLCY; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Website';
                }
                field(noOfQuotes; Rec."No. of Quotes")
                {
                    Caption = 'No. of Quotes';
                }
                field(noOfPstdInvoices; Rec."No. of Pstd. Invoices")
                {
                    Caption = 'No. of Posted Invoices';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(paymentsLCY; Rec."Payments (LCY)")
                {
                    Caption = 'Total Payments';
                }
                field(profitLCY; Rec."Profit (LCY)")
                {
                    Caption = 'Profit';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                }
            }
        }
    }
    [ServiceEnabled]
    [Scope('Cloud')]
    procedure EmailSalesInvoicesByCustomer(CustomerNo: Code[20]; SendToEmailOnCustomerRecord: Boolean; EmailAddress: Text; CCEmailAddress: Text; FilterBlankExtDocNo: Boolean)
    begin
        EmailSalesInvoice('', CustomerNo, SendToEmailOnCustomerRecord, EmailAddress, CCEmailAddress, FilterBlankExtDocNo);
    end;
    local procedure EmailSalesInvoice(PostedSalesInvoiceNo: Code[20]; CustomerNo: Code[20]; SendToEmailOnCustomerRecord: Boolean; EmailAddress: Text; CCEmailAddress: Text; FilterBlankExtDocNo: Boolean)
    var
        Customer: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        CompanyInformation: Record "Company Information";
        TempBlob: Codeunit "Temp Blob";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Ins: InStream;
        Outs: OutStream;
        RecRef: RecordRef;
        ReportID: Integer;
        Parameters: Text;
        Subject: Text;
        Body: Text;
        Filename: Text;
        CustomerEmail: Text;
    begin
        CompanyInformation.Get();
        CompanyInformation.TestField(Name);
        CustomerEmail:='';
        if PostedSalesInvoiceNo <> '' then begin
            Filename:='Sales Invoice ' + PostedSalesInvoiceNo + '.pdf';
            Subject:=CompanyInformation.Name + ' - Sales Invoice ' + PostedSalesInvoiceNo;
            if SendToEmailOnCustomerRecord = true then begin
                if SalesInvoiceHeader.Get(PostedSalesInvoiceNo)then if Customer.Get(SalesInvoiceHeader."Sell-to Customer No.")then CustomerEmail:=Customer."E-Mail";
            end;
        end;
        if CustomerNo <> '' then begin
            Customer.Get(CustomerNo);
            Filename:='Sales Invoices - ' + Customer.Name + '.pdf';
            Subject:=CompanyInformation.Name + ' - Sales Invoices for ' + Customer.Name;
            if SendToEmailOnCustomerRecord = true then CustomerEmail:=Customer."E-Mail";
        end;
        Body:='See attached for invoice(s) due to ' + CompanyInformation.Name;
        SalesInvoiceHeader.Reset();
        if PostedSalesInvoiceNo <> '' then SalesInvoiceHeader.SetRange("No.", PostedSalesInvoiceNo);
        if CustomerNo <> '' then begin
            SalesInvoiceHeader.SetRange("Sell-to Customer No.", CustomerNo);
            SalesInvoiceHeader.SetRange(Closed, false);
        end;
        if FilterBlankExtDocNo then SalesInvoiceHeader.SetRange("External Document No.", '');
        RecRef.GetTable(SalesInvoiceHeader);
        Tempblob.CreateOutStream(Outs);
        Tempblob.CreateInStream(Ins);
        Parameters:='';
        SalesInvoiceHeader.FindFirst();
        ReportID:=GetSalesInvoiceReportID(SalesInvoiceHeader."Sell-to Customer No.");
        Report.SaveAs(ReportID, Parameters, ReportFormat::Pdf, Outs, RecRef);
        EmailMessage.Create(EmailAddress, Subject, Body);
        if CustomerEmail <> '' then EmailMessage.AddRecipient(Enum::"Email Recipient Type"::"To", CustomerEmail);
        if CCEmailAddress <> '' then EmailMessage.AddRecipient(Enum::"Email Recipient Type"::"Cc", CCEmailAddress);
        EmailMessage.AddAttachment(Filename, 'application/pdf', Ins);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;
    local procedure GetSalesInvoiceReportID(CustomerNo: Code[20])ReportID: Integer var
        ReportSelections: Record "Report Selections";
        CustomReportSelections: Record "Custom Report Selection";
    begin
        CustomReportSelections.Reset();
        CustomReportSelections.SetRange("Source Type", Database::Customer);
        CustomReportSelections.SetRange("Source No.", CustomerNo);
        CustomReportSelections.SetRange(Usage, CustomReportSelections.Usage::"S.Invoice");
        if CustomReportSelections.FindFirst()then ReportID:=CustomReportSelections."Report ID"
        else
        begin
            ReportSelections.Reset();
            ReportSelections.SetRange(Usage, ReportSelections.Usage::"S.Invoice");
            if ReportSelections.FindFirst()then ReportID:=ReportSelections."Report ID" end;
    end;
}
