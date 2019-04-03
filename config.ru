
require './config/environment'

begin
  fi_check_migration

  ## to be able to use patch, put, and delete as fake posts
  use Rack::MethodOverride

  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
