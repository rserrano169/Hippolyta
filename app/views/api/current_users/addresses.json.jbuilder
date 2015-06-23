json.array! @addresses.each do |address|
  json.extract!(
    address,
    :id,
    :name,
    :street,
    :apt,
    :city,
    :state,
    :zip
  )
end
