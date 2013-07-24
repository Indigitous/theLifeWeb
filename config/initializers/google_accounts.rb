class GoogleAccounts
  def self.config
    yaml = YAML.load_file(Rails.root.to_s + "/config/google_accounts.yml")
    yaml[Rails.env]
  end
end