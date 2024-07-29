require 'active_record'

require_relative 'setup_db'

Dir.glob('migrations/*.rb').each { |file| require_relative file }

ActiveRecord::MigrationContext.new('migrations', ActiveRecord::SchemaMigration).migrate
