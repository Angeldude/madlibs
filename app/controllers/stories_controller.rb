class StoriesController < ApplicationController
  before_action :find_template, only: [:show, :storied]

  def index
    @stories = Template.all
  end

  def show
    if @story.nil?
      redirect_to root_path
    end
  end

  def storied
    unless legal_params.nil?
      new_list = []
      legal_params.each { |_x, val| new_list << val }
      original = @story.replace_words[:original]
      zipped = new_list.zip(@story.replace_words[:replace])
      @result = Template.new(story: @story.final_story(zipped, original))
      render :result
    else
      @result = @story
      render :result
    end
  end

  def result
  end

  private

  def find_template
    @story = Template.find_by_slugged(params[:slug])
  end

  def legal_params
    params[:madlib]
  end
end
