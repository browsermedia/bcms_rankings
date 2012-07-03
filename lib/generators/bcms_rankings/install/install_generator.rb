require 'cms/module_installation'

class BcmsRankings::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__
  
  def copy_migrations
    rake 'bcms_rankings:install:migrations'
  end

  def add_seed_data_to_project
    copy_file "../bcms_rankings.seeds.rb", "db/bcms_rankings.seeds.rb"
    append_to_file "db/seeds.rb", "load File.expand_path('../bcms_rankings.seeds.rb', __FILE__)\n"
  end
  
  def add_routes
    route 'mount_bcms_rankings'
  end
    
end