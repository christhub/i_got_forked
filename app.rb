require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/admin/') do
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb(:admin)
end

get('/recipes/') do
  @recipes = Recipe.all
  erb(:recipes)
end

get('/categories/') do
  @categories = Category.all
  erb(:categories)
end

get('/ingredients/') do
  @ingredients = Ingredient.all
  erb(:ingredients)
end

post('/admin/new-recipe/') do
  recipe_name = params.fetch('recipe_name')
  cooking_time = params.fetch('cooking_time').to_i
  preparation_time = params.fetch('preparation_time').to_i
  serving_size = params.fetch('serving_size').to_i
  if params.fetch('rating') == ''
    rating = nil
  else
    rating = params.fetch('rating')
  end
  recipe_instructions = params.fetch('instructions')
  Recipe.create({name: recipe_name, cooking_time: cooking_time, preparation_time: preparation_time, serving_size: serving_size, rating: rating, instructions: recipe_instructions})
  redirect('/admin/')
end

post('/admin/new-ingredient/') do
  name = params.fetch('ingredient_name')
  Ingredient.create({name: name})
  redirect('/admin/')
end

post('/admin/recipe-ingredient/') do
  recipe = Recipe.find(params.fetch('recipe_select').to_i)
  ingredient = Ingredient.find(params.fetch('ingredient_select').to_i)
  recipe.ingredients.push(ingredient)
  redirect('/admin/')
end

delete('/admin/recipe-delete/') do
  recipe = Recipe.find(params.fetch('recipe_delete').to_i)
  recipe.destroy()
  redirect('/admin/')
end

delete('/admin/ingredient-delete/') do
  ingredient = Ingredient.find(params.fetch('ingredient_delete').to_i)
  ingredient.destroy()
  redirect('/admin/')
end

get('/recipes/:id/') do
  @recipes = Recipe.all
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb(:recipe)
end
