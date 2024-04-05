class PagesController < ApplicationController
  def home
    @missing_animals = MissingAnimal.all
  end
end
