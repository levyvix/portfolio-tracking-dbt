with current_data as (
    select *
    from {{ ref('stg_seeds__ABC_Bank_SECURITY_INFO') }}
)

select * from current_data