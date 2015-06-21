if @cart_product
  json.(@cart_product, :id, :cart_id, :product_id, :quantity)
end
