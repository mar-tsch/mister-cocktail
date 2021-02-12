class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new(cocktail_params)
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      flash[:success] = "Cocktail successfully created"
      redirect_to @cocktail
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to cocktails_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to cocktails_url
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient_id, :dose)
  end
end
