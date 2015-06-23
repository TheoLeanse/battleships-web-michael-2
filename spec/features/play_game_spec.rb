require 'spec_helper'

feature 'I want to be able to play the game' do

  scenario 'I want to be able to fire at a coordinate' do
    visit '/new_game'
    fill_in('name', with: 'Michael')
    click_on 'Submit'
    click_link 'Begin your adventure'
    fill_in('coord', with: 'A1')
    expect(page).to have_content 'hit'
  end

  # scenario 'I want to be able to return to play_game and fire at another coordinate' do
  #   visit '/hit_or_miss'
  #   click_link 'Fire again'
  #   expect(page).to have_content 'Enter the coordinate you want to hit!'
  # end

  # scenario 'The page will return miss! if I have missed a target'
  #   visit '/play_game'
  #   fill_in('coord', with: 'B4')
  #   click_on 'Submit'
  #   expect(page).to have_content 'Miss!'
  # end

end