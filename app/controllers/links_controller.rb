class LinksController < ApplicationController

  def index
    @links = Link.all
    @link = Link.new
  end

  def new
    @link = Link.new
  end

  def create
    link = Link.new(link_params)
    if link.save
      flash[:success] = "#{link.title} saved!"
      redirect_to root_path
    else
      flash[:notice] = "#{link.title} not save, please make sure URL is valid"
      redirect_to root_path
    end
  end


  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
