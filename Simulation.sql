use Sandbox;

with misrad as (
	select distinct [Year], [Misrad] from [Plan]
)
select [Year],[Misrad],[Compare]=[Misrad]     from misrad
union all
select [Year],[Misrad],[Compare]='Total'      from misrad
union all
select [Year],[Misrad],[Compare]='Simulation' from misrad
order by 1,2,3