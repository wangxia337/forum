begin
  
  task "spec" => ['spec:spec']
  require 'rspec/core'
  require 'rspec/core/rake_task'

  namespace :spec do
    desc "Run all rspec tests"
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.pattern = "./spec/**/*_spec.rb"
      t.spec_opts = ['--profile', '-r']
    end
    
    desc "Run all rspec tests with coverage"
    RSpec::Core::RakeTask.new(:rcov) do |t|
      t.pattern = "./spec/**/*_spec.rb"
      t.spec_opts = ['--colour', '--format documentation']
      t.rcov = true
      t.rcov_opts = ['--exclude spec/,/gems/,/Library/,/usr/,lib/tasks,.bundle,config,/lib/rspec/,/lib/rspec-', '--rails', '--failure-threshold=100']
    end
  end
end