class ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :permit_params

	def create				
		article = Article.new(params[:article])

		if article.save
			render json: {status: 200}
		else
			render json: {status: 500,error_messages: article.errors.full_messages.join("<br>")}
		end
	end


	private
	 def permit_params
	 	params.require(:article).permit!
 	 end

end
