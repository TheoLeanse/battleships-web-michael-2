require 'spec_helper'

feature 'I want to be able to play the game' do

  scenario 'I want to be able to fire at a coordinate' do
    visit '/'
    visit '/setup_game'
    fill_in('coord', with: 'A1')
    click_on 'Submit'
    expect(page).to have_content 'hit'
  end

  scenario 'I want to be able to sink a ship' do
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
    expect(page).to have_content 'sunk'
  end

  scenario 'The page will return miss! if I have missed a target' do
    visit '/'
    visit '/setup_game'
    fill_in('coord', with: 'B4')
    click_on 'Submit'
    expect(page).to have_content 'miss'
  end

end