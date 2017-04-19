module ApplicationHelper
  def stories
    @stories = Template.all
  end
end
