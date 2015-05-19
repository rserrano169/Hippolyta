json.(@cart, :id, :buyer_id, :session_token)

json.cart_products @cart.cart_products do |cart_product|
  json.extract!(
    cart_product,
    :id,
    :cart_id,
    :product_id,
    :quantity,
  )
end

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

  json.seller_name(product.seller.name)

  json.thumb_picture_url image_url(product.picture.url(:thumb))
  json.small_picture_url image_url(product.picture.url(:small))
  json.medium_picture_url image_url(product.picture.url(:medium))
  json.large_picture_url image_url(product.picture.url(:large))
end
