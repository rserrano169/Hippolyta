json.results @search_results.each do |result_product|
  json.extract!(
    result_product,
    :name,
    :sale_price,
    :original_price,
    :quantity,
    :description,
    :seller_id,
    :id,
    :review_rating_percentage
  )

  json.seller_name(result_product.seller.name)
  json.number_of_reviews(result_product.reviews.count)

  json.thumb_picture_url image_url(result_product.picture.url(:thumb))
  json.small_picture_url image_url(result_product.picture.url(:small))
  json.medium_picture_url image_url(result_product.picture.url(:medium))
  json.large_picture_url image_url(result_product.picture.url(:large))
end

json.keywords(@query.keywords)
