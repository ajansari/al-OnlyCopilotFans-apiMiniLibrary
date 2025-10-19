page 90504 "OCPF Vendor API"
{
    APIGroup = 'OCPFMini';
    APIPublisher = 'OnlyCopilotFans';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    DelayedInsert = true;
    EntityName = 'OCPFVendor';
    EntitySetName = 'OCPFVendors';
    Caption = 'ocpfVendorAPI';
    PageType = API;
    SourceTable = Vendor;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(balanceLCY; Rec."Balance (LCY)")
                {
                    Caption = 'Balance (LCY)';
                }
                field(balanceDueLCY; Rec."Balance Due (LCY)")
                {
                    Caption = 'Balance Due (LCY)';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field(creditAmountLCY; Rec."Credit Amount (LCY)")
                {
                    Caption = 'Credit Amount (LCY)';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(vendorPostingGroup; Rec."Vendor Posting Group")
                {
                    Caption = 'Vendor Posting Group';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(noOfOrders; Rec."No. of Orders")
                {
                    Caption = 'No. of Orders';
                }
                field(noOfPstdInvoices; Rec."No. of Pstd. Invoices")
                {
                    Caption = 'No. of Pstd. Invoices';
                }
                field(noOfInvoices; Rec."No. of Invoices")
                {
                    Caption = 'No. of Invoices';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(leadTimeCalculation; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';
                }
                field(irs1099Code; Rec."IRS 1099 Code")
                {
                    Caption = 'IRS 1099 Code';
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(currencyFilter; Rec."Currency Filter")
                {
                    Caption = 'Currency Filter';
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

    //procedure BlockVendor(VendorNo: Code[20]; var ResultMessage: Text)
    procedure BlockVendor(VendorNo: Code[20])
    var
        Vendor: Record Vendor;
    begin
        Vendor.Get(VendorNo);
        Vendor.Blocked := Vendor.Blocked::All;
        Vendor.Modify(true);
        //ResultMessage := StrSubstNo('Vendor %1 is now blocked', VendorNo);
    end;

}

/*
procedure SetVendorToBlocked(var ActionContext: WebServiceActionContext)
begin
    Rec.Blocked := Rec.Blocked::All;
    Rec.Modify(true);
    SetActionResponse(ActionContext, Rec.SystemId);
end;

[ServiceEnabled]
[Scope('Cloud')]
procedure UnblockVendor(var ActionContext: WebServiceActionContext)
begin
    Rec.Blocked := Rec.Blocked::" ";
    Rec.Modify(true);
    SetActionResponse(ActionContext, Rec.SystemId);
end;

local procedure SetActionResponse(var ActionContext: WebServiceActionContext; VendorSystemId: Guid)
begin
    ActionContext.SetObjectType(ObjectType::Page);
    ActionContext.SetObjectId(Page::"OCPF Vendor API");
    ActionContext.AddEntityKey(Rec.FieldNo(SystemId), VendorSystemId);
    ActionContext.SetResultCode(WebServiceActionResultCode::Updated);
end;
*/


