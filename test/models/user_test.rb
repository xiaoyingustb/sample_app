require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=User.new(name:"syfing", email:"13017916017@qq.com", password:"foobar", password_confirmation:"foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    assert @user.valid?
  end

  test "email should be present" do
    assert @user.valid?
  end

  test "email should not be too long" do
    @user.email="xiaoyingsezhang@163.com"
    assert @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_address=%w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_address.each do |valid_address|
      @user.email=valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minium length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
