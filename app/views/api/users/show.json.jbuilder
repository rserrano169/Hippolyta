json.(@user, :id, :name, :email, :phone_number, :created_at)

json.original_picture_url image_url(@user.picture.url)
json.thumb_picture_url image_url(@user.picture.url(:thumb))
json.small_picture_url image_url(@user.picture.url(:small))
json.medium_picture_url image_url(@user.picture.url(:medium))
json.large_picture_url image_url(@user.picture.url(:large))

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
