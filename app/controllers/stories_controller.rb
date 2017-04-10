class StoriesController < ApplicationController
  def index
    @stories = Template.all
  end
end
