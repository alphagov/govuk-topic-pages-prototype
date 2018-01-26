require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "#index" do
    it "should return an OK status" do
      get :index

      expect(response).to have_http_status(:success)
    end

    it "should render the correct template" do
      get :index

      expect(subject).to render_template("welcome/index")
    end
  end

end
