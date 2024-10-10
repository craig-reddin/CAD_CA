json.extract! recipe, :id, :recipe_name, :meal_type, :source, :ingredients, :instructions, :preperation_time, :cooking_time, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
