class PagesController < ApplicationController
  def home
    @missing_animals = MissingAnimal.order(created_at: :desc)
    @found_animals = FoundAnimal.order(created_at: :desc)
    @chatrooms = current_user.chatrooms
    if params[:query].present?
      @missing_animals = MissingAnimal.search_by_multiple_attributes(params[:query].split).order(created_at: :desc)
      @found_animals = FoundAnimal.search_by_name_and_species(params[:query]).order(created_at: :desc)
    end
  end
end
