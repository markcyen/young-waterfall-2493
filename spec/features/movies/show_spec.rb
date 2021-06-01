require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  describe 'displays movie show page' do
    it 'shows movie attributes and actors names' do
      @paramount = Studio.create!(name: 'Paramount', location: 'Los Angeles')
      @terminator = @paramount.movies.create!(title: 'Terminator', creation_year: 1986, genre: 'Action')

      @arnold_schwarznegger = Actor.create!(name: 'Arnold Schwarznegger', age: 73, currently_working: true)
      @linda_hamilton = Actor.create!(name: 'Linda Hamilton', age: 57, currently_working: false)
      @michael_biehn = Actor.create!(name: 'Michael Biehn', age: 63, currently_working: true)
      @paul_winfield = Actor.create!(name: 'Paul Winfield', age: 58, currently_working: true)

      CastingTable.create!(actor: @arnold_schwarznegger, movie: @terminator)
      CastingTable.create!(actor: @linda_hamilton, movie: @terminator)
      CastingTable.create!(actor: @michael_biehn, movie: @terminator)
      CastingTable.create!(actor: @paul_winfield, movie: @terminator)

      visit "/movies/#{@terminator.id}"
      expect(page).to have_content('Terminator')
      expect(page).to have_content(1986)
      expect(page).to have_content('Action')

      expect(page).to have_content('Arnold Schwarznegger')
      expect(page).to have_content('Linda Hamilton')
      expect(page).to have_content('Michael Biehn')
      expect(page).to have_content('Paul Winfield')
    end
  end
end
