require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc "Open an pry session preloaded with this gem"
task :console do
  begin
    require 'pry'
    require 'kempelen'
    

    def reload!
      files = $LOADED_FEATURES.select { |feat| feat =~ /\/kempelen\// }
      files.each { |file| load file }
    end
    
    ARGV.clear
    Pry.start
  end
end
