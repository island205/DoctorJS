class ProjectController < ApplicationController


  def index
    @project = Project.all
  end

end
