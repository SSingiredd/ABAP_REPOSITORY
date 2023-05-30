@AbapCatalog.sqlViewName: 'ZSQL_BASIC_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS View'
define view ZCDS_BASIC_View as select from sflight as s1
left outer join spfli as s2 on s1.connid = s2.connid
{
  key s1.carrid,
  s1.seatsmax_b,
  s1.seatsocc_b,
  (s1.seatsmax_b - s1.seatsocc_b) as Seats_Avlbl,
  case s2.countryfr
  when 'US' then 'United States'
  when 'IT' then 'Italy'
  when 'JP' then 'Japan'
  when 'DE' then 'Germany'
  else s2.countryfr
  end as Country_from,
  s2.cityfrom,
  s2.airpfrom,
  s2.countryto,
  s2.cityto,
  s2.airpto
}
where s1.fldate <= $session.system_date 

