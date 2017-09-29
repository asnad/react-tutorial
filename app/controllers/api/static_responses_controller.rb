class Api::StaticResponsesController < Api::BaseController
	def home
		render json: {message: "Hello World"}
	end
end
