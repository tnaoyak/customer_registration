class Event < ApplicationRecord
  belongs_to :school, optional: true
end
