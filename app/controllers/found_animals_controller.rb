class FoundAnimalsController < ApplicationController
  def new
    @found_animal = FoundAnimal.new
  end

  def create
    @found_animal = FoundAnimal.new(found_animal_params)
    @found_animal.user = current_user

    if @found_animal.save
      redirect_to found_animal_path(@found_animal)
    end
  end

  def show
    @found_animal = FoundAnimal.find(params[:id])
    @user = @found_animal.user
  end

  def edit
    @found_animal = FoundAnimal.find(params[:id])
  end

  def update
    @found_animal = FoundAnimal.find(params[:id])
    if @found_animal.update(found_animal_params)
      redirect_to found_animal_path(@found_animal)
    end
  end

  def destroy
    @found_animal = FoundAnimal.find(params[:id])
    if @found_animal.destroy
      redirect_to root_path
    end
  end

  private

  def found_animal_params
    params.require(:found_animal).permit(:species, :age, :name, :breed, :found_location, :found_date, :sterilized, :size, :color, :description, :photo)
  end
end
