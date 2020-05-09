require 'rails_helper'
require 'capybara/rspec'

describe 'dataase operations', type: :feature do
  before :each do
    a = User.new(name: 'SpaYco', email: 'user@example.com', password: 'password')
    a.save
  end

  it 'Create event without userid' do
    b = Event.new(title: 'conference', description: 'morning meeting')
    b.save
    expect(b.save).to eq(false)
  end
  it 'created before events' do
    b = Event.new(user_id: 1, title: 'abc', description: 'kdaj', event_date: '2029-09-06')
    b.save
    # a=Event.created_before(Date.today).first.select('title')
    expect(Event.created_before(Date.today).first.title).to eq('abc')
  end
  it 'attendee scope method' do
    b = Event.new(user_id: 1, title: 'abc', description: 'kdaj', event_date: '2021-09-06')
    b.save
    c = Attendee.new(user_id: 1, event_id: 1)
    c.save
    expect(Attendee.isjoined?(1, 1)).to eq(true)
  end
end
