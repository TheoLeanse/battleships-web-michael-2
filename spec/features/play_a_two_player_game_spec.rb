require 'spec_helper'

feature 'Two players should be able to play the game' do

  before(:each) do
    visit '/'
    click_on 'Start 2 player game'
    expect(page).to have_content 'Player 1, please position your ships!'
    select "submarine", :from => "ship_select"
    fill_in('coord', with: 'A1')
    choose('ver')
    click_on 'place_ship'
    select "battleship", :from => "ship_select"
    fill_in('coord', with: 'B1')
    choose('ver')
    click_on 'place_ship'
    select "cruiser", :from => "ship_select"
    fill_in('coord', with: 'C1')
    choose('ver')
    click_on 'place_ship'
    select "destroyer", :from => "ship_select"
    fill_in('coord', with: 'D1')
    choose('ver')
    click_on 'place_ship'
    select "aircraft_carrier", :from => "ship_select"
    fill_in('coord', with: 'E1')
    choose('ver')
    click_on 'place_ship'
    expect(page).to have_content 'Player 2, please position your ships!'
    select "submarine", :from => "ship_select"
    fill_in('coord', with: 'A1')
    choose('ver')
    click_on 'place_ship'
    select "battleship", :from => "ship_select"
    fill_in('coord', with: 'B1')
    choose('ver')
    click_on 'place_ship'
    select "cruiser", :from => "ship_select"
    fill_in('coord', with: 'C1')
    choose('ver')
    click_on 'place_ship'
    select "destroyer", :from => "ship_select"
    fill_in('coord', with: 'D1')
    choose('ver')
    click_on 'place_ship'
    select "aircraft_carrier", :from => "ship_select"
    fill_in('coord', with: 'E1')
    choose('ver')
    click_on 'place_ship'
  end

  scenario 'As player 1, I want to be able to fire at my opponents board' do
    fill_in('hit_coord', with: 'A1')
    click_on 'Submit'
    expect(page).to have_content 'Well done! That was a hit!'
    click_on 'ready'
  end

  scenario 'As player 1, I want to be able to miss my opponents board' do
    fill_in('hit_coord', with: 'A10')
    click_on 'Submit'
    expect(page).to have_content 'Sorry, that was a miss!'
  end

  scenario 'As player 2, I want to be able to fire at my opponent\'s board' do
    fill_in('hit_coord', with: 'A1')
    click_on 'Submit'
    expect(page).to have_content 'Well done! That was a hit!'
    click_on 'ready'
  end

  scenario 'As player 2, I want to be able to miss my opponent\'s board' do
    fill_in('hit_coord', with: 'A10')
    click_on 'Submit'
    expect(page).to have_content 'Sorry, that was a miss!'
  end

  xscenario 'As player 1, I want to be able to win the game' do
    fill_in('hit_coord', with: 'A1')
    click_on 'Submit'
    click_on 'ready'
    fill_in('hit_coord', with: 'A1')
    click_on 'Submit'
    click_on 'ready'
    fill_in('hit_coord', with: 'A2')
    click_on 'Submit'
    click_on 'ready'
    fill_in('hit_coord', with: 'A2')
    click_on 'Submit'
    click_on 'ready'
    fill_in('hit_coord', with: 'A3')
    click_on 'Submit'
    click_on 'ready'
    fill_in('hit_coord', with: 'A3')
    click_on 'Submit'
    click_on 'ready'
    fill_in('hit_coord', with: 'A4')
    click_on 'Submit'
    expect(page).to have_content "Congratulations Player 1, you have won!"
    click_on 'Play again'
    expect(page).to have_content "Welcome to battleships!!"
  end


end
