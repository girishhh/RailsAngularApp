class ArticlesController < ApplicationController
	require 'readability'	
	include ActionView::Helpers::TextHelper
	
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

	def get_readability_score		
		striped_text = strip_tags(params[:text]).squish
		readability_score = Readabilty.readabilty_score(striped_text)		
		render json: {status: 200,data: readability_score}
	end


	private
	 def permit_params
	 	params.require(:article).permit! if params[:article].present?
 	 end

end
