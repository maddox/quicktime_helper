PLUGIN_ROOT = File.dirname(__FILE__) + '/../'

desc 'Updates the necessary javascript for the quicktime_tag helper.'
task :update_quicktime_script do
  FileUtils.cp File.join(File.dirname(__FILE__), '../public/javascripts/qtobject.js'),  File.join(RAILS_ROOT, 'public', 'javascripts')
end
