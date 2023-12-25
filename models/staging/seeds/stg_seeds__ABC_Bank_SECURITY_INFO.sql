with

source as (

    select * from {{ source('seeds', 'ABC_Bank_SECURITY_INFO') }}

),

renamed as (

    select
        security_code as security_code, -- STRING
        security_name as security_name, -- STRING
        sector as sector_name, -- STRING
        industry as industry_name, -- STRING
        country as country_code, -- STRING
        exchange as exchange_code, -- STRING
        'SEED.ABC_Bank_SECURITY_INFO' as record_source


    from source

),

hashed as (
    select
        concat(security_code) as security_hkey,
        concat(
            security_code,
            security_name,
            sector_name,
            industry_name,
            country_code,
            exchange_code
        ) as security_hdiff,
        *
    from renamed
)

select * from hashed
