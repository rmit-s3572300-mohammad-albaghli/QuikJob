class ErrorsController < ApplicationController
  def not_found
    render status: 400
  end
  
  def server_error
    render status: 500
  end
  
  def unaccceptable
    render status: 422
  end
end
