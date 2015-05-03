json.(@cart, :id, :buyer_id, :session_token)

json.products @cart.products do |product|
  json.extract!(
    product,
    :name,
    :sale_price,
    :original_price,
    :quantity,
    :description,
    :seller_id,
    :id
  )

  json.thumb_picture_url image_url(product.picture.url(:thumb))
  json.small_picture_url image_url(product.picture.url(:small))
  json.medium_picture_url image_url(product.picture.url(:medium))
  json.large_picture_url image_url(product.picture.url(:large))
end
