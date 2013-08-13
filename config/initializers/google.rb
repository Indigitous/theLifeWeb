class Google
  def self.config
    yaml = YAML.load_file(Rails.root.to_s + "/config/google.yml")
    yaml[Rails.env]
  end
end