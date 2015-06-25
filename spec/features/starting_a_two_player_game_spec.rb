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
    fill_in('sub_coord', with: 'A1')
    choose('sub_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('bat_coord', with: 'B1')
    choose('bat_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('des_coord', with: 'C1')
    choose('des_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('cru_coord', with: 'D1')
    choose('cru_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('car_coord', with: 'E1')
    choose('car_ver')
    click_on 'place_ship'
    expect(page).to have_content 'Player 2, please position your ships!'
     select "submarine", :from => "ship_select"
    fill_in('sub_coord', with: 'A1')
    choose('sub_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('bat_coord', with: 'B1')
    choose('bat_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('des_coord', with: 'C1')
    choose('des_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('cru_coord', with: 'D1')
    choose('cru_ver')
    click_on 'place_ship'
    select "submarine", :from => "ship_select"
    fill_in('car_coord', with: 'E1')
    choose('car_ver')
    click_on 'place_ship'
    expect(page).to have_content 'Player 1, choose coordinate to fire!'
  end
end
