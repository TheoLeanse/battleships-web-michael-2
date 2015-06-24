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
    fill_in('sub_coords', with: 'A1')
    fill_in('sub_dir', with: 'horizontal')
    click_on 'Submit'
    expect(page).to have_content 'Player 2, please position your ships!'
    fill_in('sub_coords', with: 'A1')
    fill_in('sub_dir', with: 'horizontal')
    click_on 'Submit'
    expect(page).to have_content 'Player 1, choose coordinate to fire!'
  end
end
