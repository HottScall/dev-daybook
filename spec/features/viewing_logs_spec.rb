feature 'viewing logs' do
  scenario 'a user can see all logs' do
    visit('/dailylogs')

    expect(page).to have_content "daily log 1"
    expect(page).to have_content "daily log 2"
    expect(page).to have_content "daily log 3"
    
  end
end
