class WelcomeController < ApplicationController
  def index
    render layout: 'welcome_index'
  end

  def contact
  end

  def show
    @download = Download.find(params[:id])
    if params[:from_link]
      Download.increment_counter(:views, @download.id)
    end
  end

end
