require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Vite')
    end
  end
end