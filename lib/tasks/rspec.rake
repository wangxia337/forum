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
  end
end