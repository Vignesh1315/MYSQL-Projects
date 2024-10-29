# World Live Expectancy ( Exploratory Data Analysis)

select * from world_life_expectancy ;

select country , min(`life expectancy`) , max(`Life expectancy`),
round(max(`Life expectancy`) - min(`life expectancy`),1) as life_increased_over_15years
from world_life_expectancy
group by country
having min(`life expectancy`) != 0 
and max(`Life expectancy`) != 0
order by life_increased_over_15years desc ;

select year , round(avg(`life expectancy`),2)
from world_life_expectancy
where `life expectancy`!= 0
group by Year
order by Year;

select country , round(avg(`Life expectancy`),1) as life_exp , round(avg(gdp),1) as GDP
from world_life_expectancy
group by country
having life_exp >0 and GDP >0
order by GDP desc;

select 
sum(case when gdp >= 1500 then 1 else 0 end) as high_gdp_count,
round(avg (case when gdp>= 1500 then `life expectancy` else null end) ,2)as high_gdp_life_expectancy,
sum(case when gdp <= 1500 then 1 else 0 end) as low_gdp_count,
round(avg (case when gdp<= 1500 then `life expectancy` else null end) ,2)as low_gdp_life_expectancy
from world_life_expectancy;

select status , round(avg(`life expectancy`),2)
from world_life_expectancy
group by status;

select status , count(distinct country),round(avg(`life expectancy`),2)
from world_life_expectancy
group by status;

select country , round(avg(`Life expectancy`),1) as life_exp , round(avg(bmi),1) as BMI
from world_life_expectancy
group by country
having life_exp >0 and BMI >0
order by BMI desc;

select country , year,
`Life expectancy`, `Adult Mortality`,
sum(`Adult Mortality`) over(partition by country order by year) as rolling_total
from world_life_expectancy
where country like "%united%" ;
