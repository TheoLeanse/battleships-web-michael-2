feature 'Starting a two player game' do
  scenario 'I am able to select a two player game' do
    visit '/'
    click_on 'Start 2 player game'
    expect(page).to have_content 'Player 1, please position your ships!'
  end

  scenario 'Players should be able to position their ships' do
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
    expect(page).to have_content 'Player 1, choose coordinate to fire!'
  end
end
