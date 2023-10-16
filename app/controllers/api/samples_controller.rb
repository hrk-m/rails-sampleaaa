class Api::SamplesController < ApplicationController
  def index
    render json: Book.all
  end
end
