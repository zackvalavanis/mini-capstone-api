json.id order.id
json.user_id order.user_id
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.products order.products
json.created_at order.created_at
json.updated_at order.updated_at
json.carted_products order.carted_products do |cp|
  json.id cp.id
  json.product cp.id
  json.quantity cp.quantity 
end 