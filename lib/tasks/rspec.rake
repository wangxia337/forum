begin
  
  task "spec" => ['spec:spec']
  require 'rspec/core'
  require 'rspec/core/rake_task'
  
  spec_opts = ['--colour', '--format documentation']

  namespace :spec do
    desc "Run all rspec tests"
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.pattern = "./spec/**/*_spec.rb"
      t.spec_opts = spec_opts
    end
    
    desc "Run all rspec tests with coverage"
    RSpec::Core::RakeTask.new(:rcov) do |t|
      t.pattern = "./spec/**/*_spec.rb"
      t.spec_opts = spec_opts
      t.rcov = true
      t.rcov_opts = ['--exclude spec/,/gems/,/Library/,/usr/,lib/tasks,.bundle,config,/lib/rspec/,/lib/rspec-', '--rails', '--failure-threshold=100']
    end
  end
end