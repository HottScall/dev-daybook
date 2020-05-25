require 'pg'

p "setting up test database...."

def setup_test_database
connection = PG.connect(dbname: 'dev_daybook_test')

#Clear daily_logs table

connection.exec("TRUNCATE daily_logs;")
end
