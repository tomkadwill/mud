require 'spec_helper'

describe User do
  
  let(:valid_attrs) {
    {
      :email => "user@example.com",
      :password => "changeme",
      :password_confirmation => "changeme" 
    }  
  }

  it "should create a new instance given a valid attribute" do
    User.create!(valid_attrs)
  end

  it "should require an email address" do
    no_email_user = User.new(valid_attrs.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(valid_attrs.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(valid_attrs.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(valid_attrs)
    user_with_duplicate_email = User.new(valid_attrs)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = valid_attrs[:email].upcase
    User.create!(valid_attrs.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(valid_attrs)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(valid_attrs)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(valid_attrs.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(valid_attrs.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = valid_attrs.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(valid_attrs)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end
  
  describe "level" do
    
    before(:each) do
      @level = Level.create
      @user = User.create!(valid_attrs)
    end
    
    it "A new user should be on level 1" do
      @user.level.should eq(@level)
    end
  end
  
  describe "assign_first_level" do
    
    it "Assigns first level to user" do
      @user = User.create!(valid_attrs)
      @user.should receive(:update_attribute).with(:level, Level.first)
      @user.assign_first_level
    end
    
    it "should be called on create" do
      @user = User.new(valid_attrs)
      @user.should receive(:assign_first_level)
      @user.save
    end
  end

end
