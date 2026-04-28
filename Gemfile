source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gemspec name: 'data_imp', path: 'data_imp'
gemspec name: 'data_imp-roo', path: 'data_imp-roo'
gemspec name: 'data_imp-tds', path: 'data_imp-tds'

group :development, :test do
  gem "rspec"
  gem "rake", ">= 13.0"
  gem "ostruct"
  gem "simplecov", require: false
end
