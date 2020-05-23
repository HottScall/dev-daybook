require 'dailylog'

describe DailyLog do
  describe ".all" do
    it "should return all of the logs" do

      logs = DailyLog.all

      expect(logs).to include ("daily log 1")
      expect(logs).to include ("daily log 2")
      expect(logs).to include ("daily log 3")

    end
  end
end
