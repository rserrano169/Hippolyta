json.(@user, :id, :name, :email, :phone_number, :image_url, :created_at)

json.products @user.products do |product|
  json.extract!(
    product,
    :name,
    :id,
    :seller_id,
    :sale_price,
    :original_price,
    :quantity,
    :description,
    :image_url
  )
end
