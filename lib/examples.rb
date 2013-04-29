module Examples
  extend self

  def user
    User.find(user_id)
  end

  def user_id
    2147483647
  end

  def invited_user
    User.find_by_email(invited_user_email)
  end

  def invited_user_email
    'invited-user@example.com'
  end

  def invite_request
    InviteRequest.find_by_email(invited_user_email)
  end

  def user_friend
    user.friends.first
  end

  def user_owned_group
    user.owned_groups.first
  end

  def activity
    Activity.first
  end

  def group
    Group.first
  end

  def password
    '123456'
  end

  def event
    Event.first
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

      FactoryGirl.create :admin_user,
        :email => 'admin@example.com',
        :password => 'password',
        :password_confirmation => 'password'

      user = FactoryGirl.create :user,
        id: user_id,
        password: password,
        groups: [Group.first]

      invited_user = FactoryGirl.create :user,
        email: invited_user_email,
        password: password

      FactoryGirl.create(:friend, user: user)

      FactoryGirl.create_list :group_event, 6,
        prayer_requested: true,
        group_users: [user],
        activity: activity

      group = FactoryGirl.create(:group, owner: user)
      FactoryGirl.create(:invite_request, user: user, group: group, email: invited_user.email)
    end
  end
end
