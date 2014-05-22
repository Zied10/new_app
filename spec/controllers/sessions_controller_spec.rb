require 'spec_helper'

describe SessionsController do
  render_views
  describe "POST 'create'" do

    describe "invalid signin" do

      before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end

      it "devrait re-rendre la page new" do
        post :create, :session => @attr
        response.should render_template('new')
      end

      it "devrait avoir le bon titre" do
        post :create, :session => @attr
        response.should have_selector("title", :content => "Sign in")
      end

      it "devait avoir un message flash.now" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
    end
  end
end
