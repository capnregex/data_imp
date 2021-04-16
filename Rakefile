# require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "./lib/data_imp/version.rb"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Build gem into the pkg directory'
task :build do
  FileUtils.rm_rf('pkg')
  Dir['*.gemspec'].each do |gemspec|
    system "gem build #{gemspec}"
  end
  FileUtils.mkdir_p('pkg')
  FileUtils.mv(Dir['*.gem'], 'pkg')
end

desc 'Tags version, pushes to remote, and pushes gem'
task :release => :build do
  sh 'git', 'tag', '-m', "v#{DataImp::VERSION}", "v#{DataImp::VERSION}"
  sh "git push origin master"
  sh "git push origin v#{DataImp::VERSION}"
  sh "ls pkg/*.gem | xargs -n 1 gem push"
end
