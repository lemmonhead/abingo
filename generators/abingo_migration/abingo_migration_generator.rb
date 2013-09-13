require 'rails/generators'
require 'rails/generators/active_record'

class AbingoMigrationGenerator < Rails::Generators::Base
  
  def manifest
    record do |m|
      m.migration_template 'abingo_migration.rb', 'db/migrate', 
        :assigns => {:version => Abingo.MAJOR_VERSION.gsub(".", "")}
    end
  end

  def file_name
    "abingo_migration_#{Abingo.MAJOR_VERSION.gsub(".", "_")}"
  end
end
