require 'rails_helper'
require 'capybara/rspec'

describe 'dataase operations', type: :feature do
  before :each do
    a = User.new(name: 'SpaYco', email: 'user@example.com', password: 'password')
    a.save
  end

  it 'Create event without userid' do
    b = Event.new(title: 'conference', description: 'morning meeting')

    expect(b.save).eql?(false)
  end
  it 'created before events' do
    b = Event.new(user_id: 1, title: 'abc', description: 'kdaj', event_date: '2029-09-06')
    b.save
    expect(Event.created_before(Date.today).first.title).eql?('abc')
  end
end
