class Api::SamplesController < ApplicationController
  def index
    render json: [{id: 1}, { id: 2}]
  end
end
