if defined?(Rollbar)
  Rollbar.configure do |config|
    config.access_token = '6f8aac193a0a4af38335ddc108f667fd'

    # Rollbar is enabled by default in all environments. To disable in specific
    # environments (e.g. 'test'):
    # if Rails.env.test?
    #   config.enabled = false
    # end

    # By default, Rollbar will try to call the `current_user` controller method
    # to fetch the logged-in user object, and then call that object's `id`,
    # `username`, and `email` methods to fetch those properties. To customize:
    # config.person_method = "my_current_user"
    # config.person_id_method = "my_id"
    # config.person_username_method = "my_username"
    # config.person_email_method = "my_email"

    # Add exception class names to the exception_level_filters hash to
    # change the level that exception is reported at. Note that if an exception
    # has already been reported and logged the level will need to be changed
    # via the rollbar interface.
    # Valid levels: 'critical', 'error', 'warning', 'info', 'debug', 'ignore'
    # 'ignore' will cause the exception to not be reported at all.
    # config.exception_level_filters.merge!('MyCriticalException' => 'critical')

    # Enable asynchronous reporting (uses girl_friday or Threading if girl_friday
    # is not installed)
    # config.use_async = true
    # Supply your own async handler:
    # config.async_handler = Proc.new { |payload|
    #  Thread.new { Rollbar.process_payload(payload) }
    # }
  end
end
