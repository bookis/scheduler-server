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

    context "when it fails" do
      before do
        allow_any_instance_of(Scheduler).to receive(:schedules) { [{}] }
      end

      it "creates 0 schedules" do
        expect { request! }.to change { Schedule.count }.by(0)
      end

      it "returns a 400" do
        request!
        expect(response.status).to eq 400
      end
    end
  end
end
