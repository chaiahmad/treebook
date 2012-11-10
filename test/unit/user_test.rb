require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  user = User.new
  assert !user.save
  assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  user = User.new
  assert !user.save
  assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  user = User.new
  assert !user.save
  assert !user.errors[:nick_name].empty?
  end

  test "a user should have a unique nick name" do
  user = User.new
  assert !user.save
  assert !user.errors[:nick_name].empty?
	end

  test "a user should have a profile name without spaces" do
  user = User.new(first_name: 'Jason', last_name: 'Seifer', email:  'jason2@treehouse.com')
  user.password = user.password_confirmation = 'asdfasdf'
  
  user.nick_name = "Chai Ahmad"
  assert !user.save
  assert !user.errors[:nick_name].empty?
  assert user.errors[:nick_name].include?("Must be formatted coorectly.")
  end

  test "a user can have a correctly formatted nick name" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email:  'jason2@treehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'
    
    user.nick_name = 'jasonseifer_1'
    assert user.valid?
  end

end
