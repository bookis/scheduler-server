require "rails_helper"

describe SchedulesController do
  fixtures :emails
  describe "POST create_all" do
    let(:request!) { post :create, email_id: 1 }
    it "returns a 201" do
      request!
      expect(response.status).to eq 201
    end

    it "finds the email" do
      expect(Email).to receive(:find).with("1").and_call_original
      request!
    end

    it "creates a list of schedules" do
      expect { request! }.to change { Schedule.count }.by(10)
    end

    it "assigns the email to the schedules" do
      email = Email.find(1)
      expect(Email).to receive(:find).and_return email
      expect { request! }.to change { email.schedules.count }.by(10)
    end
  end
end
