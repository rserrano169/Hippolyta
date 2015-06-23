json.array! @addresses.each do |address|
  json.extract!(
    address,
    :name,
    :street,
    :apt,
    :city,
    :state,
    :zip
  )
end
