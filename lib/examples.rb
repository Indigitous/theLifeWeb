module Examples
  extend self

  def user
    User.find(user_id)
  end

  def user_id
    1
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
      FactoryGirl.create :user,
        id: user_id,
        password: password
      puts 'User for `api_taster` has been created'

      FactoryGirl.create :group,
        owner: user
      puts 'Group for a main user has been created'

      FactoryGirl.create :friend,
        user: user
      puts 'Friend for a main user has been created'

      FactoryGirl.create :user,
        email: invited_user_email,
        password: password
      puts 'Invited user has been created'

      FactoryGirl.create_list(:category, 3)
      puts 'Categories have been created'

      FactoryGirl.create_list(:activity, 2)
      puts 'Activities have been created'

      FactoryGirl.create :admin_user,
        email: 'admin@example.com',
        password: 'password',
        password_confirmation: 'password'
      puts 'Admin user has been created'

      FactoryGirl.create_list :group_event, 6,
        prayer_requested: true,
        group_users: [user],
        activity: activity
      puts 'Group events have been created'

      FactoryGirl.create :invite_request,
        sender: user,
        group: group,
        email: invited_user.email
      puts 'Invite Request has been created'
    end
  end
end
