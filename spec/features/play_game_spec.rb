require 'spec_helper'

feature 'I want to be able to play the game' do

  scenario 'I want to be able to fire at a coordinate' do
    visit '/play_game'
    fill_in('coord', with: 'A4')
    click_on 'Submit'


  end

end
