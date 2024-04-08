class FoundAnimal < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  enum status: { missing: 0, found: 1 }

  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= :missing
  end
end
