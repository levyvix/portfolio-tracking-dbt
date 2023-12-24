with 

source as (

    select * from {{ source('abc_bank', 'abc_bank_position') }}

),

renamed as (

    select
        accountid as account_code,
        symbol as security_code,
        description as security_name,
        exchange as exchange_code,
        report_date,
        quantity,
        cost_base,
        position_value,
        currency as currency_code

    from source

)

select * from renamed
