gem "factory_girl_rails", ">= 1.0.0", :group => :test
gem "factory_girl_generator", ">= 0.0.1", :group => [:development, :test]
gem "rspec-rails", ">= 2.0.1", :group => [:development, :test]

generators = <<-GENERATORS

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
    end
GENERATORS

application generators
