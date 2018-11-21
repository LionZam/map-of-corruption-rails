class Deputy < ApplicationRecord
  has_many :deeds, dependent: :delete_all
  has_many :regions, through: :deeds
  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def full_name
    "#{name} #{surname} #{patronymic}"
  end

end
