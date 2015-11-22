require "rails_helper"

describe Schedule do
  fixtures :schedules
  let(:schedule) { schedules(:valid) }

  describe ".validates" do
    it "requires send_at" do
      schedule.update(send_at: nil)
      expect(schedule.errors[:send_at]).to include "must be a valid date"
    end

    it "requires email" do
      schedule.update(email_id: nil)
      expect(schedule.errors[:email_id]).to include "can't be blank"
    end
  end

end
