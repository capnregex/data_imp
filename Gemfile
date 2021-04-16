source "https://rubygems.org"
gemspec name: 'data_imp'

Dir['data_imp-*.gemspec'].each do |gemspec|
  plugin = gemspec.scan(/data_imp-(.*)\.gemspec/).flatten.first
  gemspec(:name => "data_imp-#{plugin}", :development_group => plugin)
end

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem "rake"
  gem "rspec"
  gem "roo"
  gem "roo-xls"
  gem 'activesupport', :require => false
  gem 'pry'
  gem 'pry-byebug'
end
