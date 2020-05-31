require 'dailylog'

describe DailyLog do
  describe ".all" do
    it "should return all of the logs" do
      connection = PG.connect(dbname: 'dev_daybook_test')

      connection.exec("INSERT INTO daily_logs (title) VALUES ('The First Log');")
      connection.exec("INSERT INTO daily_logs (title) VALUES ('Second Log');")

      logs = DailyLog.all

      expect(logs).to include ("The First Log")
      expect(logs).to include ("Second Log")
    end
  end

  describe ".create" do
    it "should allow a user to create a new log" do
      DailyLog.create(title: 'Day 1', log: 'Today I did...')

      expect(DailyLog.all).to include "Day 1"

    end
  end
end
