require 'pg'

class DailyLog
  def self.all
    connection = PG.connect(dbname: 'dev_daybook')
    result = connection.exec("SELECT * FROM daily_logs;")
    result.map { |log| log['title']}
  end
end
