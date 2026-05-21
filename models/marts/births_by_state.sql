with natality as (
    select * from {{ ref('stg_natality') }}
)

select
    state,
    count(*)                        as total_naissances,
    round(avg(weight_pounds), 2)    as poids_moyen_livres,
    round(avg(mother_age), 1)       as age_moyen_mere,
    round(avg(gestation_weeks), 1)  as semaines_gestation_moyennes
from natality
where state is not null
group by state
order by total_naissances desc