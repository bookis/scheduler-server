require "rails_helper"

describe EmailsController do
  fixtures :emails, :users
  describe "POST create" do
    let(:attrs) { {subject: "Email", body: "Lorem", to: "b@example.com", times: 10, every_n_minutes: 1440, send_first_at: Time.now } }
    it "adds an email to the database" do
      session[:user_id] = users(:valid).id
      expect { post :create, email: attrs }.to change { Email.count }.by(1)
    end
  end
end
