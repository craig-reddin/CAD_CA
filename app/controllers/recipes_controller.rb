require "recipe_tools/chatgpt_recipe_generator"

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_path, status: :see_other, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

def generate_recipe

  ingredients = params[:ingredients].split(",")
  meal_type = params[:meal_type]
  api_keyer = ENV["OPENAI_API_KEY"]
  recipe_generator = RecipeTools::ChatgptRecipeGenerator.new(api_keyer)

  @generated_recipe = recipe_generator.generate_recipe(ingredients, meal_type)
  Rails.logger.debug "Generated recipe: #{@generated_recipe}"
  if @generated_recipe.present?
    flash[:generated_recipe] = @generated_recipe
    redirect_to new_recipe_path  # This will make the index view reload and show the flash message
  else
    flash[:alert] = "Error generating recipe. Please try again."
    redirect_to new_recipe_new_path
  end
end



  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

   # Only allow a list of trusted parameters through.
   def recipe_params
     params.require(:recipe).permit(:recipe_name, :meal_type, :source, :ingredients, :instructions, :preperation_time, :cooking_time)
   end



def show_generated_recipe
  @generated_recipe = session[:generated_recipe] # Retrieve from session
end


  def show_generated_recipe
    @generated_recipe = params[:generated_recipe]
  end
end
