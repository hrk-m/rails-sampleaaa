class Views::SamplesController < ApplicationController
  include ActionView::Layouts
  include ActionController::Rendering

  def index
    render :index
  end
end
