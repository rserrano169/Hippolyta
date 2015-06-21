json.all_cards do
  json.array!(
    @cards,
    :id,
    :brand,
    :last4,
    :exp_month,
    :exp_year,
    :name,
    :metadata
  )
end

if @default_card
  json.default_card do
      json.(
        @default_card,
        :id,
        :brand,
        :last4,
        :exp_month,
        :exp_year,
        :name,
        :metadata
      )
  end
end

if @current_card
  json.current_card do
    json.(
      @current_card,
      :id,
      :brand,
      :last4,
      :exp_month,
      :exp_year,
      :name,
      :metadata
    )
  end
end
