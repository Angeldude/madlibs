class StoriesController < ApplicationController
  before_action :find_template, only: [:show, :storied]

  def index
    @stories = Template.all
  end

  def show
  end

  def storied
    new_list = []
    legal_params.each{|x,val|  new_list << val }
    original = @story.replace_words[:original]
    zipped = new_list.zip(@story.replace_words[:replace])
    @result = Template.new(story: @story.final_story(zipped, original))
    render :result
  end

  def result

  end


  private

  def find_template
    @story = Template.find_by_slugged(params[:slug])
  end

  def legal_params
    params.require(:madlib)
  end

end
