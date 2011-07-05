module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Rails 3 Tutorial"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end

  # Return the logo displayed on the home page of the app
  def logo
      image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

end
