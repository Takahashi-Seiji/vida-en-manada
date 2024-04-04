class MissingAnimalsController < ApplicationController
  def new
    @missing_animal = MissingAnimal.new
  end

  def create
    @missing_animal = MissingAnimal.new(missing_animal_params)
    @missing_animal.user = current_user

    if @missing_animal.save
      redirect_to missing_animal_path(@missing_animal)
    end
  end

  def show
    @missing_animal = MissingAnimal.find(params[:id])
    @user = @missing_animal.user
  end

  private

  def missing_animal_params
    params.require(:missing_animal).permit(:species, :age, :name, :breed, :lost_location, :date_lost, :sterilized, :size, :color, :description)
  end
end
