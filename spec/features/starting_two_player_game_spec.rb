feature 'Starting a two player game' do 
  scenario 'I am able to select a two player game' do
    visit '/'
    click_on 'Start 2 player game'
    expect(page).to have_content 'Player 1, please position your ships!'
  end

end