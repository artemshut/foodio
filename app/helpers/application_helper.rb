module ApplicationHelper
  CHEF_NAME_ERROR = 'Chef is unknown.'.freeze

  def chef_name(recipe)
    return "By: #{recipe.fields[:chef]&.fields[:name]}" if recipe.fields[:chef]

    CHEF_NAME_ERROR
  end

  def page
    [params[:page].to_i - 1, 0].max
  end

  def converted_description(recipe)
    description = convert_italic(recipe.fields[:description])
    convert_bold(description)
    youtube_link(description)
  end

  def youtube_link(description)
    link = description.match(/\[VIDEO]\(http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?\)/)
    return description if link.nil?

    description.gsub(
      link[0],
      %Q{<br></br><iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ link[1] }" frameborder="0" allowfullscreen></iframe>}
    )
  end

  private

  def convert_italic(description)
    description.gsub(/_{1}(\w|\s)+_{1}/) do |italic|
      content = italic.gsub(/_{1}/, '')
      "<em>#{content}</em>"
    end
  end

  def convert_bold(description)
    description.gsub(/\*(\w|\s)+\*/) do |strike|
      content = strike.gsub(/\*/, '')
      "<strong>#{content}</strong>"
    end
  end
end
