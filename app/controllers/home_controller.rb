class HomeController < ApplicationController
  
  def index
    StartScrap.new.save
  end

  def show
    
  end
end
