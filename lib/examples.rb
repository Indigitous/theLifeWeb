module Examples
  extend self

  def user
    User.find_by_email('api@example.com')
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
      FactoryGirl.create_list(:category, 3)
      FactoryGirl.create_list(:activity, 2)

      api_user = FactoryGirl.create :user,
        email: 'api@example.com',
        password: password

      FactoryGirl.create(:friend, user: api_user)
    end
  end
end
