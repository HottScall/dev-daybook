feature 'creating daily logs' do
  scenario 'user can create new daily logs' do
    visit('/dailylogs/create')

    fill_in('title', :with => 'Day 1')
    fill_in('log', :with => 'Today I did...')
    click_button('Submit')

    expect(page).to have_content('Day 1', 'Today I did....')
  end
end
