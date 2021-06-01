class Movie < ApplicationRecord
  belongs_to :studio

  has_many :casting_tables
  has_many :actors, through: :casting_tables
end
