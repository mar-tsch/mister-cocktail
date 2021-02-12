class DosesController < ApplicationController
  def new
    @dose = Dose.new(dose_params)
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      flash[:success] = "Dose successfully created"
      redirect_to @dose
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(dose_params)
    if @dose.destroy
      flash[:success] = 'Dose was successfully deleted.'
      redirect_to doses_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to doses_url
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient_id)
  end
end
