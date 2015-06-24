if @current_address
  json.(
    @current_address,
    :id,
    :name,
    :street,
    :apt,
    :city,
    :state,
    :zip
  )
end
