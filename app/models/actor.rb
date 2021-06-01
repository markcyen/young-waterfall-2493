class Actor < ApplicationRecord
  has_many :casting_tables
  has_many :movies, through: :casting_tables
  has_many :studios, through: :movies
end
