begin
  task :ci => [ 'spec:rcov', 'cucumber:all']
end