module Examples
  extend self

  def user
    User.first
  end

  def password
    '123456'
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create_list :user, 5
      FactoryGirl.create_list :category, 3
      FactoryGirl.create_list :activity, 15
    end
  end
end
