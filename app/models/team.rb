class Team < ApplicationRecord
  has_attached_file :image
  validates_uniqueness_of :name
  # validates_uniqueness_of :short_name
end
