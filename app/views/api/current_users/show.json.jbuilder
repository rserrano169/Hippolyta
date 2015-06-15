json.(@current_user, :id, :name, :email, :phone_number, :created_at)

json.thumb_picture_url image_url(@current_user.picture.url(:thumb))
json.small_picture_url image_url(@current_user.picture.url(:small))
json.medium_picture_url image_url(@current_user.picture.url(:medium))
json.large_picture_url image_url(@current_user.picture.url(:large))
