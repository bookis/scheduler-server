require 'spec_helper'

describe Scheduler do
  let(:scheduler) { Scheduler.new(email) }
  let(:email)     { {times: 10, send_first_at: Time.now, every_n_minutes: 24 * 60 } }
  describe "initialize" do
    it "assigns attrs" do
      expect(scheduler.times).to eq 10
      expect(scheduler.every_n_minutes).to eq 1440
      expect(scheduler.send_first_at).to be_within(1).of Time.now
    end
  end

  describe "#schedules" do
    let(:schedules) { scheduler.schedules }
    it "returns an array " do
      expect(schedules.size).to eq 10
    end

    it "returns a hash with :send_at" do
      expect(schedules.first[:send_at]).to be_within(2).of Time.now
    end
  end
end
