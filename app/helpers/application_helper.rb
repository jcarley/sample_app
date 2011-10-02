module ApplicationHelper
  
  # Return a title on a per-page basis
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    
    # an instance variable could be nil, and if its a string
    #  could be empty.  i like to check for both here
    if @title.nil? || @title.to_s.empty?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag('logo.png', :alt => "Sample App", :style => "width:200px; height:55px;")
  end

end
