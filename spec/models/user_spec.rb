require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')
  end
  
  it "creates a valid user" do
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')
    expect(@user.valid?).to eq(true)
  end

  it "should have a name" do 
    @user = User.new(name: "", email: 'somethign@google.com')
    expect(@user.valid?).to eq(false)
  end

  it "should have an email" do
    @user = User.new(name: "Bruce", email: '')
    expect(@user.valid?).to eq(false)
  end

  it "shouldn't have a name too long" do 
    @user.name = 'a' * 51
    expect(@user.valid?).to eq(false)
  end

  it "should accept valid email addresses" do 
    VALID_EMAILS = %w[user@example.com bruce@google.com A_US-ER@foot.bar.org]
    VALID_EMAILS.each do |email|
      @user.email = email
      expect(@user.valid?).to eq(true)
    end
  end

  it "should reject invalid addresses" do
    INVALID_EMAILS = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    INVALID_EMAILS.each do |invalid|
      @user.email = invalid
      expect(@user.valid?).to eq(false)
    end
  end

  it "should be a unique user" do 
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user.valid?).to eq(false)
  end

  it "password should be present" do 
    @user.password = @user.password_confirmation = '    '
    @user.save
    expect(@user.valid?).to eq(false)
  end

  it "should have password not too small" do 
    @user.password = @user.password_confirmation = 'aaaaa'
    @user.save 
    expect(@user.valid?).to eq(false)
  end
end
