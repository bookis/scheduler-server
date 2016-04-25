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

    it "is unique on email_id and send at" do
      schedule_dup = Schedule.new(send_at: schedule.send_at, email_id: schedule.email_id)
      schedule_dup.valid?
      expect(schedule_dup.errors[:send_at]).to include "has already been scheduled"
    end
  end

end
