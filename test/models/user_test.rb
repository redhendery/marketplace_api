require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'user with valid email should be valid' do
    user = User.new(email: 'test@test.com', password_digest: 'test')
    assert user.valid?
  end

  test 'user with invalid email should be invalid' do
    user = User.new(email: 'notanemail', password_digest: 'test')
    assert_not user.valid?
  end

  test 'user email address should be unique' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test')
    assert_not user.valid?
  end

  test 'should destroy dependent product on delete' do
    assert_difference('Product.count', -1) do
      users(:one).destroy
    end
  end

end
