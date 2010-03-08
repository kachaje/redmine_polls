class PollsController < ApplicationController
  unloadable
 
  before_filter :find_project, :authorize, :only => :index
 
  def index
  	@project = Project.find(params[:project_id])
    @polls = Poll.find(:all)
  end

  def vote
     poll = Poll.find(params[:id])
     poll.vote(params[:answer])
     if poll.save
       flash[:notice] = 'Vote saved.'
       redirect_to :action => 'index'
     end
  end
  
  private
 
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
