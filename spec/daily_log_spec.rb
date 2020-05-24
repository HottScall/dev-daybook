require 'dailylog'

describe DailyLog do
  describe ".all" do
    it "should return all of the logs" do

      logs = DailyLog.all

      expect(logs).to include ("The First Log")
      expect(logs).to include ("Second Log")
    end
  end
end
