json.(@user, :id, :name, :email, :phone_number, :image_url, :created_at)

json.products @user.products do |product|
  json.extract!(
    product,
    :name,
    :id,
    :seller_id,
    :original_price,
    :sale_price,
    :quantity,
    :description,
    :image_url
  )
end
