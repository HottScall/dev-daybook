require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'dev_daybook_test')
  result = connection.query("SELECT * FROM daily_logs WHERE id = #{id};")
  result.first
end
