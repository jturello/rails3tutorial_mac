require 'spec_helper'

describe "Users" do

  describe "signup" do

    describe "failure" do

      it "should not make a new user" do
        expect {
          visit signup_path
          fill_in "Name",                   :with => ""
          fill_in "Email",                  :with => ""
          fill_in "Password",               :with => ""
          fill_in "Confirmation",           :with => ""
          click_button
          response.should render_template 'users/new'
          response.should have_selector "div#error_explanation"
        }.not_to change(User, :count)
      end
    end

    describe "success" do

      it "should make a new user" do
        expect {
          visit signup_path
          fill_in "Name",                   :with => "Sample User"
          fill_in "Email",                  :with => "User@example.com"
          fill_in "Password",               :with => "secret_password"
          fill_in "Confirmation",           :with => "secret_password"
          click_button
          response.should have_selector "div.flash.success",
                                         :content => "Welcome"
          response.should render_template 'users/show'
        }.to change(User, :count).by(1)
      end

    end

  end

end
