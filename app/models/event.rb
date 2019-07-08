class Event < ApplicationRecord
  belongs_to :school, optional: true
  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :image
  accepts_attachments_for :image, attachment: :image

  validates :name, presence: true
  validates :school_id, presence: true
end
