class Trip < ApplicationRecord
  belongs_to :user
  has_many :events
  attr_accessor :date_range
end
