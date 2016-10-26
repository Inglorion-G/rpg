require 'rake/testtask'

task default: %w[test]

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*test.rb', 'test/modules/*test.rb']
  t.warning = false
end

task :game do
  ruby "app.rb"
end
