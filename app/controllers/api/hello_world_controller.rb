class Api::HelloWorldController < ApplicationController
  def show
    render json: { message: 'Hello, World!' }
  end
end
