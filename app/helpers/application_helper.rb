module ApplicationHelper
  def photo_attached?(animal)
    animal.photo.attached?
  end
end
