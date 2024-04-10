class MissingAnimal < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  enum status: { missing: 0, found: 1 }

  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= :missing
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_species,
  against: [ :name, :species ],
  using: {
    tsearch: { prefix: true }
  }
end
