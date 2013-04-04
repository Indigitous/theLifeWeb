module Examples
  extend self

  def user
    User.find_by_email(user_email)
  end

  def user_email
    'user@example.com'
  end

  def user_friend
    user.friends.first
  end

  def activity
    Activity.first
  end

  def password
    '123456'
  end

  def threshold
    Threshold.first
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create_list(:user, 5)
      FactoryGirl.create_list(:group, 3)
      FactoryGirl.create_list(:category, 3)
      FactoryGirl.create_list(:activity, 2)

      user = FactoryGirl.create :user,
        email: user_email,
        password: password,
        groups: [Group.first]

      FactoryGirl.create(:friend, user: user)
    end
  end
end
