require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development)
require 'rake'

require 'mg'
MG.new('basecampeverest.gemspec')

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << '../oa-core/lib' << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

task :default => :spec
