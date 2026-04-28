require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :spec do
  desc "Run specs for data_imp"
  task :core do
    Dir.chdir("data_imp") { sh "bundle exec rspec" }
  end

  desc "Run specs for data_imp-roo"
  task :roo do
    Dir.chdir("data_imp-roo") { sh "bundle exec rspec" }
  end

  desc "Run specs for data_imp-tds"
  task :tds do
    Dir.chdir("data_imp-tds") { sh "bundle exec rspec" }
  end

  desc "Run all specs for all gems"
  task :all => [:core, :roo, :tds]
end

namespace :build do
  desc "Build data_imp gem"
  task :core do
    Dir.chdir("data_imp") { sh "gem build data_imp.gemspec" }
    mv Dir["data_imp/*.gem"], "."
  end

  desc "Build data_imp-roo gem"
  task :roo do
    Dir.chdir("data_imp-roo") { sh "gem build data_imp-roo.gemspec" }
    mv Dir["data_imp-roo/*.gem"], "."
  end

  desc "Build data_imp-tds gem"
  task :tds do
    Dir.chdir("data_imp-tds") { sh "gem build data_imp-tds.gemspec" }
    mv Dir["data_imp-tds/*.gem"], "."
  end

  desc "Build all gems"
  task :all => [:core, :roo, :tds]
end

namespace :publish do
  desc "Publish data_imp gem to RubyGems"
  task :core => "build:core" do
    sh "gem push data_imp-*.gem"
  end

  desc "Publish data_imp-roo gem to RubyGems"
  task :roo => "build:roo" do
    sh "gem push data_imp-roo-*.gem"
  end

  desc "Publish data_imp-tds gem to RubyGems"
  task :tds => "build:tds" do
    sh "gem push data_imp-tds-*.gem"
  end

  desc "Publish all gems to RubyGems"
  task :all => "build:all" do
    sh "gem push data_imp-*.gem"
    sh "gem push data_imp-roo-*.gem"
    sh "gem push data_imp-tds-*.gem"
  end
end
