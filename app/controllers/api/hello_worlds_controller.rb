class Api::HelloWorldsController < ApplicationController
  def show
    render json: { message: 'Hello, World!' }
  end
end
