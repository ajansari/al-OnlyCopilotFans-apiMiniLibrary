# al-OnlyCopilotFans-apiMiniLibrary
SAMPLE OnlyCopilotFans Mini Library of APIs - For TESTING and TRAINING use ONLY. DO NOT DEPLOY INTO PRODUCTION ENVIRONMENTS

# API Pages in this mini library
Customer*
Vendor*
Item*
Saleperson
Posted Sales Invoice
Customer Ledger Entry

Customer, Vendor and Item API pages have actions (procedures) which can be called by an external application to execute business logic in Business Central

The one for Customer showcases a scenario where invoices for a customer are printed into a single PDF and emailed to the desired people; showcases one global procedure (accessible by an external app) which in turn calls a local procedure (which is inaccessible by an external app)

The one for Vendor showcases a scenario where a Vendor's Blocked field is set to All

The one for Item showcases a scenario where an Item's Replenishment system is set to Assembly

# Important
DO NOT USE these APIs in a production environment!!! The actions (procedures) embedded in these API pages are to demonstrate how API pages work and are used in AL, Power Automate and Copilot Studio training bootcamps and conference sessions and ARE NOT intended for use in real world production environments. I / we cannot be held responsible for any consequences that arise from use of these

# A note about API Actions as it relates to Power Platform / Power Automate
Adding Bound or unbound actions (i.e., Business Central global procedures) that have an output like a var containing a message or data will cause Power Automate to not see this action. This constraint is not universal.
