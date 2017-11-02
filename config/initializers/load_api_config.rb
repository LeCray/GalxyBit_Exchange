CONFIG_PATH = Rails.root.join('config', 'api_config.yml').to_s
#{}"#{Rails.root}/config/api_config.yml"

			
APP_CONFIG = YAML.load_file(CONFIG_PATH)[Rails.env]