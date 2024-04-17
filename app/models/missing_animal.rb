class MissingAnimal < ApplicationRecord
  belongs_to :user
  has_many :chatrooms, dependent: :destroy
  has_one_attached :photo
  geocoded_by :lost_location
  after_validation :geocode, if: :will_save_change_to_lost_location?

  enum status: { missing: 0, found: 1 }

  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= :missing
  end

  include PgSearch::Model
  pg_search_scope :search_by_multiple_attributes,
  against: [ :name, :species, :breed, :color, :description, :sex, :lost_location, :size ],
  using: {
    tsearch: { prefix: true, normalization: 2 }
  }
end
