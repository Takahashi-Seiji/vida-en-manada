class FoundAnimal < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :found_location
  after_validation :geocode, if: :will_save_change_to_found_location?

  enum status: { missing: 0, found: 1 }

  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= :missing
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_species,
  against: [ :species, :breed, :found_location, :color, :description, :sex ],
  using: {
    tsearch: { prefix: true, normalization: 2 }
  }
end
