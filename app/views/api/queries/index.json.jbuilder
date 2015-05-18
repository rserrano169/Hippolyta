json.results @search_results.each do |result|
  json.extract!(
    result,
    :name,
    :sale_price,
    :original_price,
    :quantity,
    :description,
    :seller_id,
    :id
  )

  json.seller_name(result.seller.name)

  json.thumb_picture_url image_url(result.picture.url(:thumb))
  json.small_picture_url image_url(result.picture.url(:small))
  json.medium_picture_url image_url(result.picture.url(:medium))
  json.large_picture_url image_url(result.picture.url(:large))
end

json.keywords(@query.keywords)
