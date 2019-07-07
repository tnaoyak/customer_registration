class Event < ApplicationRecord
  belongs_to :school, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  accepts_attachments_for :images, attachment: :images

  validates :name, presence: true
  validates :school_id, presence: true
end
