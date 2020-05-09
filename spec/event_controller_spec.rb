require 'rails_helper'
require 'capybara/rspec'

describe 'event management', type: :feature do
  before :each do
    a = User.new(name: 'SpaYco', email: 'user@example.com', password: 'password')
    a.save
    b = Event.new(user_id: 1, title: 'abc', description: 'kdaj', event_date: '2020-09-06')

    b.save
    visit '/login'
    within('form') do
      fill_in 'uid', with: 1
    end
    click_button 'enter'
    # request.cookies['userid'] = 1
  end
  it 'see a event' do
    # headers: {"HTTP_COOKIE" => key=:userid; key2=1}end

    visit '/events/Home'

    # click_button 'enter'
    expect(page).to have_content 'Title : abc'
  end
  it 'session and logout test' do
    click_link 'Logout'
    visit '/events/Home'
    expect(page).to have_content 'Welcome Stranger!'
  end
end
