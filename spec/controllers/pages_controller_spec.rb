require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the correct title" do
      get 'home'
      response.should have_selector("title",
          :content => "Rails 3 Tutorial - Home")
    end

  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the correct title" do
      get 'contact'
      response.should have_selector("title",
          :content => "Rails 3 Tutorial - Contact")
    end
  end

  describe "GET 'about'" do
  it "should be successful" do
    get 'about'
    response.should be_success
  end

    it "should have the correct title" do
      get 'about'
      response.should have_selector("title",
          :content => "Rails 3 Tutorial - About")
    end
  end
end
