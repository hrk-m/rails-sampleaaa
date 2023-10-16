class Api::SamplesController < ApplicationController
  def index
    render json: User.all
  end
end
