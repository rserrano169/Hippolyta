class Query < ActiveRecord::Base

  belongs_to(
    :querier,
    class_name: "User",
    foreign_key: :querier_id,
    primary_key: :id,
  )

end
