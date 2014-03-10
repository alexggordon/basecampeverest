Gem::Specification.new do |everest|
  everest.name        = 'basecampeverest'
  everest.version     = '0.1.1'
  everest.date        = Time.now
  everest.summary     = "Ruby Gem to commmunicate with Basecamp's API"
  everest.authors     = ["Alex Gordon"]
  everest.email       = 'alex.gordon90@gmail.com'
  everest.files = Dir.glob("{lib}/**/*")
  everest.homepage    = 'https://github.com/alexggordon/basecampeverest'
  everest.license     = 'MIT'
  
  everest.add_runtime_dependency 'httparty', '0.13.0'
  everest.add_runtime_dependency 'json', '~>  1.8.1'
  everest.add_dependency  'oauth2'
  everest.add_dependency  'activeresource', '>= 2.3.0'
  everest.add_development_dependency 'rake'
  everest.add_development_dependency 'mg',        '>= 0.0.8'
  everest.add_development_dependency 'rspec',     '>= 1.3.0'


end
