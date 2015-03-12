json.(@user, :id, :name, :email, :phone_number, :logo_image_url, :created_at)

json.products @user.products do |product|
  json.extract!(
    product,
    :name,
    :id,
    :seller_id,
    :original_price,
    :sale_price,
    :quantity,
    :image_url
  )
end
