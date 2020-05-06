require 'rails_helper'
require 'capybara/rspec'

describe 'the signin process', type: :feature do
  before :each do
    a = User.new(name: 'SpaYco', email: 'user@example.com', password: 'password')
    a.save
  end

  it 'signs me in' do
    visit '/login'
    within('form') do
      fill_in 'uid', with: 1
    end
    click_button 'enter'
    expect(page).to have_content 'Success'
  end
end
