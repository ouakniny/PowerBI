use Sandbox;

with misrad as (
	select distinct [Year],[Misrad] from [Plan]
)
select [Year],[Misrad],[Compare]=[Misrad] from misrad
union all
select [Year],[Misrad],[Compare]='Total' from misrad
union all
select [Year],[Misrad],[Compare]='System_1' from misrad where right(Misrad,len(Misrad)-CHARINDEX('_',Misrad)) <= 40
union all
select [Year],[Misrad],[Compare]='System_2' from misrad where right(Misrad,len(Misrad)-CHARINDEX('_',Misrad)) > 40
order by 1,2