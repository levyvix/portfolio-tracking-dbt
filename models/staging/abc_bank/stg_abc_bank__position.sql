with source as (

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
        currency as currency_code,

        'source_data.abc_bank_position' as record_source

    from source

),

hashed as (
    select
        concat(account_code, security_code) as position_hkey,
        concat(
            account_code,
            security_code,
            security_name,
            exchange_code,
            report_date,
            quantity,
            cost_base,
            position_value,
            currency_code
        ) as position_hdiff,
        *,
        '{{ run_started_at }}' as load_ts_utc
    from renamed
)

select * from hashed
