with stg_abc_bank__position as (
    select * from {{ ref('stg_abc_bank__position') }}
),

final as (
    select
        *,
        position_value - cost_base as unrealized_profit,
        round((position_value - cost_base) / cost_base, 5)
            as unrealized_profit_pct
    from stg_abc_bank__position
)

select * from final
