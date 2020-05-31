require 'dailylog'
require 'database_helpers'

describe DailyLog do
  describe ".all" do
    it "should return all of the logs" do
      connection = PG.connect(dbname: 'dev_daybook_test')

      log = DailyLog.create(title: 'Day 1', log: 'Today I did...')
      DailyLog.create(title: 'Day 2', log: 'Today I...')
      DailyLog.create(title: 'Day 3', log: 'Today...')

      logs = DailyLog.all

      expect(logs.length).to eq 3
      expect(logs.first).to be_a DailyLog
      expect(logs.first.id).to eq log.id
      expect(logs.first.title).to eq 'Day 1'
      expect(logs.first.log).to eq 'Today I did...'
    end
  end

  describe ".create" do
    it "should allow a user to create a new log" do
      log = DailyLog.create(title: 'Day 1', log: 'Today I did...').first

      persisted_data = persisted_data(id: log.id)

      expect(log).to be_a DailyLog
      expect(log.id).to eq persisted_data.first['id']
      expect(log.title).to eq "Day 1"
      expect(log.log).to eq "Today I did..."
    end
  end
end
