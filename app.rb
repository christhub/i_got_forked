# ENV['RACK_ENV'] = 'development'
require 'active_record'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

#######################     ADMIN      #####################################

get('/admin/') do
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  @categories = Category.all
  erb(:admin)
end

post('/admin/new-recipe/') do
  recipe_name = params.fetch('recipe_name')
  cooking_time = params.fetch('cooking_time').to_i
  preparation_time = params.fetch('preparation_time').to_i
  serving_size = params.fetch('serving_size').to_i
  total_time = preparation_time + cooking_time
  if params.fetch('rating') == ''
    rating = nil
  else
    rating = params.fetch('rating')
  end
  recipe_instructions = params.fetch('instructions')
  Recipe.create({name: recipe_name, cooking_time: cooking_time, preparation_time: preparation_time, serving_size: serving_size, rating: rating, instructions: recipe_instructions, total_time: total_time})
  redirect('/admin/')
end

post('/admin/new-ingredient/') do
  name = params.fetch('ingredient_name')
  Ingredient.create({name: name})
  redirect('/admin/')
end

post('/admin/new-category/') do
  name = params.fetch('category_name')
  Category.create({:name => name})
  redirect('/admin/')
end

post('/admin/recipe-ingredient/') do
  recipe = Recipe.find(params.fetch('recipe_select').to_i)
  ingredient = Ingredient.find(params.fetch('ingredient_select').to_i)
  recipe.ingredients.push(ingredient)
  redirect('/admin/')
end

post('/admin/recipe-category/') do
  recipe = Recipe.find(params.fetch('recipe_select').to_i)
  category = Category.find(params.fetch('category_select').to_i)
  recipe.categories.push(category)
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

delete('/admin/category-delete/') do
  category = Category.find(params.fetch('category_delete').to_i)
  category.destroy()
  redirect('/admin/')
end

############################    RECIPES    ##################################

get('/recipes/') do
  @recipes = Recipe.all
  erb(:recipes)
end

get('/recipes/:id/') do
  @recipes = Recipe.all
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb(:recipe)
end


############################    CATEGORIES    ###############################

get('/categories/') do
  @categories = Category.all
  erb(:categories)
end

get('/categories/:id/') do
  @categories = Category.all
  @category = Category.find(params.fetch('id').to_i)
  @recipes = @category.recipes
  erb(:category)
end

############################    INGREDIENTS    ##############################

get('/ingredients/') do
  @ingredients = Ingredient.all
  erb(:ingredients)
end

get('/ingredients/:id/') do
  @ingredients = Ingredient.all
  @ingredient = Ingredient.find(params.fetch('id').to_i)
  @recipes = @ingredient.recipes
  erb(:ingredient)
end
