class PagesController < ApplicationController
  def home
    @missing_animals = MissingAnimal.all
    @found_animals = FoundAnimal.all
    if params[:query].present?
      @missing_animals = MissingAnimal.search_by_name_and_species(params[:query])
      @found_animals = FoundAnimal.search_by_name_and_species(params[:query])
    end
  end
end
