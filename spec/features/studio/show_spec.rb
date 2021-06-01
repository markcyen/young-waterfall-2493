require 'rails_helper'

RSpec.describe 'Studio Show Page' do
  describe 'displays studios show page with attributes' do
    it 'shows the studios name and location' do
      @studio_1 = Studio.create!(name: 'Paramount', location: 'Los Angeles')

      visit "/studios/#{@studio_1.id}"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
    end
  end
end
