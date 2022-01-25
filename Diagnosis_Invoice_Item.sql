--This model materailizes a view for every diagnosis per invoice line item.
--Every diagnosis is also associated to a treatment and provider.

Drop view if Exists Diagnosis_Invoice_Item;

Create view if not Exists Diagnosis_Invoice_Item as ( 
Select ii.Country_code, ii.Id,ii.created_by, ii.date_created, ii.date_modified, 
  t.status as TREATMENT_STATUS,t.Provider_Ref_Id,t.Account_Holder_Ref_Id,t.Beneficiary_Ref_Id,Insurance_cover_ref_id, 
  d.diagnosis_name, d.Status as DIAGNOSIS_STATUS from raw_data.invoice_item as ii
inner join raw_data.invoice as i on ii.invoice_id=i.id
inner join raw_data.treatment as t on i.treatment_id=t.id
inner join raw_data.treatment_diagnosis as td on t.id=td.treatment_id
inner join raw_data.diagnosis as d on td.diagnosis_ref_id=d.diagnosis_id);