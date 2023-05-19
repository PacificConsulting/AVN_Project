permissionset 50000 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "COD Payable/Receivable"=RIMD,
        tabledata "Customer/Vendor Inv. Booking"=RIMD,
        tabledata "Posted COD Payeble Receivable"=RIMD,
        tabledata "Posted Cust\vend Inv Booking"=RIMD,
        table "COD Payable/Receivable"=X,
        table "Customer/Vendor Inv. Booking"=X,
        table "Posted COD Payeble Receivable"=X,
        table "Posted Cust\vend Inv Booking"=X,
        codeunit "Event & Subscriber CU"=X,
        xmlport "Client invoice Booking"=X,
        xmlport "COD Payable"=X,
        xmlport "COD Receivalble"=X,
        xmlport "Vendor Invoice Booking"=X,
        page "COD Payable List"=X,
        page "COD Receivable List"=X,
        page "Customer/Vendor Inv. Booking"=X,
        page "Posted COD Payable"=X,
        page "Posted COD Receivable List"=X,
        page "Posted Customer Inv. Booking"=X,
        page "Posted Vendor Inv. Booking"=X,
        page "Vendor Inv. Booking"=X;
}