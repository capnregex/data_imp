# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "data_imp/version"

require "rake/clean"
CLOBBER.include "pkg"

require "bundler/gem_helper"
Bundler::GemHelper.install_tasks name: 'data_imp'
Bundler::GemHelper.install_tasks name: 'data_imp-roo'
Bundler::GemHelper.install_tasks name: 'data_imp-tds'

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

