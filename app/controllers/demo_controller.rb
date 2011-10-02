class DemoController < ApplicationController
  
  def index
    @items = %w[Hello World Foo Bar]
  end

end
