require 'spec_helper'

feature 'Winning a game' do
  scenario 'I have sunk the last ship' do
    visit '/'
    visit '/setup_game'
    fill_in('coord', with: 'A1')
    click_on 'Submit'
    fill_in('coord', with: 'A2')
    click_on 'Submit'
    fill_in('coord', with: 'A3')
    click_on 'Submit'
    fill_in('coord', with: 'A4')
    click_on 'Submit'
    fill_in('coord', with: 'I1')
    click_on 'Submit'
    expect(page).to have_content "You are the winner!"
    click_on 'Start again'
    expect(page).to have_content "Welcome to battleships!!"
  end  
end