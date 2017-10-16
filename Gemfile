source "https://rubygems.org"
gemspec name: 'data_imp'

Dir['data_imp-*.gemspec'].each do |gemspec|
  plugin = gemspec.scan(/data_imp-(.*)\.gemspec/).flatten.first
  gemspec(:name => "data_imp-#{plugin}", :development_group => plugin)
end

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem "bundler", "~> 1.15.4"
  gem "rake", "~> 10.0"
  gem "rspec", "~> 3.0"
  gem "roo" #, "~> 3.0"
  gem "roo-xls" #, "~> 3.0"
  gem "tiny_tds"
  gem 'activesupport', :require => false
  gem 'pry'
  gem 'pry-byebug'
end
