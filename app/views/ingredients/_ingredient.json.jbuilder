json.extract! ingredient, :id, :name, :description, :price, :amount, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
