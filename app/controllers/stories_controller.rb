class StoriesController < ApplicationController
  before_action :find_template, only: [:show]

  def index
    @stories = Template.all
  end

  def show
  end


  private

  def find_template
    @story = Template.find_by_slugged(params[:slug])
  end
end
