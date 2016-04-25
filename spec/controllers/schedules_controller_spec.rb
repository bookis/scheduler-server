require "rails_helper"

describe SchedulesController do
  fixtures :emails

  describe "GET index" do
    let(:request!) { get :index, email_id: 1 }
    it "returns json of all email schedules" do
      post :create, email_id: 1
      request!
      json = JSON.parse(response.body)
      expect(json.size).to eq 10
    end
  end
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

    context "when it has duplicates" do
      it "doesn't re create" do
        email = Email.find(1)
        expect(Email).to receive(:find).twice.and_return email
        request!
        expect { post :create, email_id: 1 }.to_not change { email.schedules.count }
      end

      it "creates new schedules if the times has been updated" do
        email = Email.find(1)
        expect(Email).to receive(:find).twice.and_return email
        request!
        email.increment!(:times)
        expect { post :create, email_id: 1 }.to change { email.schedules.count }.by(1)
      end
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
