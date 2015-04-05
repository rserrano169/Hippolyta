json.array! @search_results do |result|
  json.extract!(
  result,
  :name,
  :sale_price,
  :original_price,
  :quantity,
  :description
  )

  json.thumb_picture_url image_url(result.picture.url(:thumb))
  json.small_picture_url image_url(result.picture.url(:small))
  json.medium_picture_url image_url(result.picture.url(:medium))
  json.large_picture_url image_url(result.picture.url(:large))
end
