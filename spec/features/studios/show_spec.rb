require 'rails_helper'

RSpec.describe 'Studio Show Page' do
  describe 'displays studios show page with attributes' do
    it 'shows the studios name and location' do
      @studio_1 = Studio.create!(name: 'Paramount', location: 'Los Angeles')

      visit "/studios/#{@studio_1.id}"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
    end

    it 'shows the studios name and location' do
      @paramount = Studio.create!(name: 'Paramount', location: 'Los Angeles')
      @love_actually = @paramount.movies.create!(title: 'Love Actually', creation_year: 1994, genre: 'romance')
      @terminator = @paramount.movies.create!(title: 'Terminator', creation_year: 1986, genre: 'action')

      visit "/studios/#{@paramount.id}"

      expect(page).to have_content(@love_actually.title)
      expect(page).to have_content(@terminator.title)
    end
  end

  describe 'displays actors that have acted in any of the studios movies' do
    it 'list of unique actors' do
      @paramount = Studio.create!(name: 'Paramount', location: 'Los Angeles')
      @love_actually = @paramount.movies.create!(title: 'Love Actually', creation_year: 1994, genre: 'romance')
      @terminator = @paramount.movies.create!(title: 'Terminator', creation_year: 1986, genre: 'action')
      @kindegarten_cop = @paramount.movies.create!(title: 'Kindegarten Cop', creation_year: 1993, genre: 'comedy')

      @arnold_schwarznegger = Actor.create!(name: 'Arnold Schwarznegger', age: 73, currently_working: true)
      @keira_knightley = Actor.create!(name: 'Kiera Knightley', age: 43, currently_working: true)
      @linda_hamilton = Actor.create!(name: 'Linda Hamilton', age: 69, currently_working: false)
      @hugh_grant = Actor.create!(name: 'Hugh Grant', age: 64, currently_working: true)

      CastingTable.create!(actor: @arnold_schwarznegger, movie: @terminator)
      CastingTable.create!(actor: @keira_knightley, movie: @love_actually)
      CastingTable.create!(actor: @linda_hamilton, movie: @terminator)
      CastingTable.create!(actor: @hugh_grant, movie: @love_actually)
      CastingTable.create!(actor: @arnold_schwarznegger, movie: @kindegarten_cop)

      visit "/studios/#{@paramount.id}"

      expect(@arnold_schwarznegger.name).to have_content('Arnold Schwarznegger')
      expect(page).to have_content('Hugh Grant')
      expect(page).to have_content('Kiera Knightley')
      expect(page).to_not have_content('Linda Hamilton')
      expect(@hugh_grant.name).to appear_before(@keira_knightley.name)
    end
  end
end
