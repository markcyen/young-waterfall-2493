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
end
