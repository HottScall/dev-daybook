require 'pg'

feature 'viewing daily logs' do
  scenario 'a user can see all daily logs' do
    connection = PG.connect(dbname: 'dev_daybook_test')

    #Add test data

    connection.exec("INSERT INTO daily_logs VALUES (1, 'The First Log', 'This is my first log');")
    connection.exec("INSERT INTO daily_logs VALUES (2, 'Second Log', 'This is my second log');")
    visit('/dailylogs')

    expect(page).to have_content('The First Log', 'This is my first log')
    expect(page).to have_content('Second Log', 'This is my second log')
  end
end
