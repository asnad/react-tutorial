class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # format :json, :html
	  def render_resource_failure(resource, resource_name)
	    render :json => {
	      status: FAIL_STATUS,
	      resource_name.to_sym => resource,
	      full_messages: resource.errors.full_messages
	    }, status: 422
	  end
end
