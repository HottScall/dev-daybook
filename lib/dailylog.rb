require 'pg'

class DailyLog

  attr_reader :id, :title, :log

  def initialize(id:, title:, log:)
    @id = id
    @title = title
    @log = log
  end

  def self.all
    if ENV['ENVIRONMENT'] === 'test'
      connection = PG.connect(dbname: 'dev_daybook_test')
    else
      connection = PG.connect(dbname: 'dev_daybook')
    end

    result = connection.exec("SELECT * FROM daily_logs;")
    result.map do |log|
      DailyLog.new(id: log['id'], title: log['title'], log: log['logs'])
    end
  end

  def self.create(title:, log:)
    if ENV['ENVIRONMENT'] === 'test'
      connection = PG.connect(dbname: 'dev_daybook_test')
    else
      connection = PG.connect(dbname: 'dev_daybook')
    end
    result = connection.exec("INSERT INTO daily_logs (title, log) VALUES('#{title}', '#{log}') RETURNING id, title, log;")
    DailyLog.new(id: result[0]['id'], title: result[0]['title'], log: result[0]['logs'])
  end
end
