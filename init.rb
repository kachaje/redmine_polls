require 'redmine'

Redmine::Plugin.register :redmine_polls do
  name 'Redmine Polls plugin'
  author 'Chimwemwe Kachaje'
  description 'A plugin for managing polls'
  version '0.0.1'
  project_module :polls do
     permission :view_polls, :polls => :index
     permission :vote_polls, :polls => :vote
  end		
  menu :project_menu, :polls, { :controller => 'polls', :action => 'index' }, :caption => 'Polls', :after => :activity, :param => :project_id
end
