require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have the correct title" do
      get :new
      response.should have_selector("title", :content => "Sign up")
    end

    it "should have a name field" do
      get :new
      response.should have_selector("input[name='user[name]'][type='text']")
    end

  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory :user
#      puts "User.count: #{User.count}"
#      puts "#{@user.id}, #{@user.name}, #{@user.email}"
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

        it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end

  describe "POST 'create'" do

    describe "failure" do

      before :each do
        @attr = { :name => "", :email => "", :password => "",
                  :password_confirmation => ""}
      end

      it "should not create a user" do
#        lambda do
#          post :create, :user => @attr
#        end.should_not change(User, :count)
         expect {
           post :create, :user => @attr
         }.not_to change(User, :count)
      end

      it "should have the correct title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end
    end

    describe "success" do

      before :each do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "password", :password_confirmation => "password" }
      end

      it "should create a user" do
        expect {
          post :create, :user => @attr
        }.to change(User, :count).by(1)
      end

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end

      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome to the sample app/i
      end

    end

  end

end
