require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development)
require 'rake'
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
end
desc "Run tests"
task :default => :test

require 'mg'
MG.new('basecampeverest.gemspec')
