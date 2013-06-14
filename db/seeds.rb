# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Threshold::TITLES.each do |title|
  Threshold.find_or_create_by_title!(title)
end

# initial administrators
AdminUser.create(email: 'admin@ballistiq.com', password: 'theLife', password_confirmation: 'theLife')
AdminUser.create(email: 'admin@p2c.com', password: 'theLife', password_confirmation: 'theLife')

# initial activities
Activity.create(
    thresholds: Threshold.all,
    has_threshold: true,
    special: "change_threshold",
    translations: [
        Activity::Translation.new(locale: "en", title:"Change Threshold", summary: "$u has moved $f to $t", full_description: "Use this activity to move your friend to a new threshold."),
        Activity::Translation.new(locale: "fr", title:"Change Threshold", summary: "$u has moved $f to $t", full_description: "Use this activity to move your friend to a new threshold."),
    ])
Activity.create(
    thresholds: Threshold.all,
    special: "add_friend",
    translations: [
        Activity::Translation.new(locale: "en", title:"Added Friend", summary: "$u added friend $f", full_description: "This activity is automatically sent when a friend has been added."),
        Activity::Translation.new(locale: "fr", title:"Added Friend", summary: "$u added friend $f", full_description: "This activity is automatically sent when a friend has been added."),
                  ])

# initial settings
Setting.create(key: 'max_users_in_group', value: 15)

