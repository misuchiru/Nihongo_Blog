class Trip < ApplicationRecord
  belongs_to :user
  has_many :events
  attr_accessor :date_range
  enum status: %i(draft published)
end
