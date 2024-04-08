class PagesController < ApplicationController
  def home
    @missing_animals = MissingAnimal.all
    @found_animals = FoundAnimal.all
  end
end
