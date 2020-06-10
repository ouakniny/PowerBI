use Sandbox;

with misrad as (
	select [Year], [Misrad], [Date]=dateadd(DAY,numbers-1,x.StartDate)
	from (
		select distinct [Year],[Misrad]
			,[StartDate]=DATEFROMPARTS([YEAR]+1,1,1)
			,[EndDate]=DATEFROMPARTS([YEAR]+1,5,31) 
		from [Plan]
	) x
	cross join (
		select top(365) numbers=row_number() over (order by a.object_id, a.column_id)
		from sys.all_columns a 
		cross join sys.all_columns b
	) y
	where dateadd(DAY,numbers-1,x.StartDate)<=EndDate
)
select [Year],[Misrad],[Compare]=[Misrad]     ,[Date] from misrad
union all
select [Year],[Misrad],[Compare]='Total'      ,[Date] from misrad
union all
select [Year],[Misrad],[Compare]='Simulation' ,[Date] from misrad
order by 1,2,3,4