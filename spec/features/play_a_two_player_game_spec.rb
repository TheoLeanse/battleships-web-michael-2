require 'spec_helper'

feature 'Two players should be able to play the game' do

  before(:each) do
    visit '/'
    click_on 'Start 2 player game'
    expect(page).to have_content 'Player 1, please position your ships!'
    fill_in('sub_coords', with: 'A1')
    fill_in('sub_dir', with: 'horizontal')
    click_on 'Submit'
    expect(page).to have_content 'Player 2, please position your ships!'
    fill_in('sub_coords', with: 'A1')
    fill_in('sub_dir', with: 'horizontal')
    click_on 'Submit'
  end

  scenario 'As player 1, I want to be able to fire at my opponents board' do
    fill_in('hit_coord', with: 'A1')
    click_on 'Submit'
    expect(page).to have_content 'Well done! That was a hit!'
    click_on 'ready'
  end

  scenario 'As player 1, I want to be able to fire at my opponents board' do
    fill_in('hit_coord', with: 'B1')
    click_on 'Submit'
    expect(page).to have_content 'Sorry, that was a miss!'
  end


end
