with source as (
    select * from {{ source('samples', 'natality') }}
),

cleaned as (
    select
        year,
        month,
        state,
        is_male,
        weight_pounds,
        mother_age,
        gestation_weeks,
        plurality,
        cigarette_use
    from source
    where
        weight_pounds   is not null
        and year        is not null
        and year between 2000 and 2008  -- limite pour la démo
)

select * from cleaned