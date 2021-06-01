class Studio < ApplicationRecord
  has_many :movies
  has_many :casting_tables, through: :movies
  has_many :actors, through: :casting_tables

  def self.actors_list
    select('actors.*')
      .distinct
      .joins(actors: :movies)
      .where('currently_working = ?', true)
      .order(age: :desc)
  end
end
