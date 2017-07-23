update breaches set organization_type='Retail' where upper(organization_type) like '%RETAIL%'

update breaches set organization_type='Others'
 where organization_type not in ('Tech','Healthcare','Telecoms','Web','Gaming','Financial','Military','Retail','Government','Academic','Energy');


select organization_type, case cast (total as int) when 0 then 1 else cast (total as int) end total from
(select organization_type, sum(records)/1000000 total, row_number() over (order by sum(records) desc) rnk
from breaches where year = '2013' group by organization_type) aa
where rnk < 11

select * from breaches

update breaches set organization_type=initcap(organization_type)

update breaches set organization_type='Web' where organization_type='Tech. Web'

with totcount as
(
select count(*) totalcount from breaches where year='2013'
),
org_tot as
(select organization_type, count(*) orgcount  from breaches where year='2013'
group by 1
)
select organization_type, round((orgcount*100.00)/totalcount,1) total from org_tot,totcount
order by 2 desc


select count(*) from breaches where year='2013' 

select method,round(count(*)*100/104.0,1) total from breaches where year='2013'  group by method

-- 2013 Breach type
select method, count(*) total from breaches where year='2013' group by method

select * from breaches where  year ='2013' and organization_type='Web' order by records desc

select entity,records from breaches where year ='2013' and organization_type='Telecoms' group by 1,2 order by records desc


--update breaches set organization_type='Tech. Web' where organization_type in('tech web','web tech')