--This model materializes a view for the products as per line Invoice Item
--The price is converted th USD using the Table Brian.Currency_Converter
--Invoice Item total calculated by multipying Quantity* Price_USD

Drop view if Exists PRODUCT_INVOICE_ITEM;

Create View if Not Exists PRODUCT_INVOICE_ITEM as (
Select ii.Country_code, ii.Id,ii.created_by, ii.date_created, ii.date_modified,ii.quantity, 
  Round(p.Price_amount/cc.Local_Amount,4) as PRICE_USD, (ii.quantity*PRICE_USD) as Item_Total, p.Product_Name,p.Type,p.Product_code 
   from raw_data.invoice_item as ii 
inner join raw_data.invoice as i on ii.invoice_id=i.id
inner join raw_data.product as p on ii.Product_Ref_Id=p.id
inner join brian.currency_converter as cc on p.price_currency=cc.currency);