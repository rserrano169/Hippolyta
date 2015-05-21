json.(
  @product,
  :id,
  :name,
  :sale_price,
  :original_price,
  :quantity,
  :description
)


json.seller_name(@product.seller.name)

if last_query
  json.last_query(last_query.keywords)
end

json.thumb_picture_url image_url(@product.picture.url(:thumb))
json.small_picture_url image_url(@product.picture.url(:small))
json.medium_picture_url image_url(@product.picture.url(:medium))
json.large_picture_url image_url(@product.picture.url(:large))
