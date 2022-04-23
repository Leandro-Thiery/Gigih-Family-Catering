class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found

  def render_not_found
    render json: {
      data: nil,
    }
  end
end
