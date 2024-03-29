class AppConfig

  def self.config_yml
    @config_yml ||= YAML.load_file 'config/config.yml'
  end

  def self.access_token
    return self.config_yml['access_token']
  end

  def self.access_token_header
    header = 'Authorization'
    token_config = AppConfig.access_token
    header = token_config['header'] or header if token_config
  end

  def self.access_token_expires_in
    duration = 1.day
    token_config = AppConfig.access_token
    duration = token_config['duration'] or duration if token_config
    duration.seconds
  end
end
