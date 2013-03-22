module Examples
  extend self

  def user
    User.find_by_email('api_taster@example.com')
  end

  def password
    'passw0rd'
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create :user,
        email: 'api_taster@example.com',
        password: password,
        password_confirmation: password
    end
  end
end
