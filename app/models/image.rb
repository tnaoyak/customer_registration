class Image < ApplicationRecord
  attachment :image
  belongs_to :event
end
