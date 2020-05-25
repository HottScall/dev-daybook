require 'pg'

class DailyLog
  def self.all
    if ENV['ENVIRONMENT'] === 'test'
      connection = PG.connect(dbname: 'dev_daybook_test')
    else
      connection = PG.connect(dbname: 'dev_daybook')
    end

    result = connection.exec("SELECT * FROM daily_logs;")
    result.map { |log| log['title']}
  end
end
