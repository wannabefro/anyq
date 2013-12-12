class Api::QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @question.anonymous_user_id= params[:question][:user_id].to_i
    firebase = Firebase.new(ENV['FIREBASE_URI'])
    if @question.save
      @firebase_response = firebase.push("questions", {question: @question})
      render json: @question, success: true
      @question.name = get_firebase_name
      @question.save!
    else
      render json: errors, status: 422
    end
  end

  private
  def question_params
    params.require('question').permit(:body, :anoymous_user)
  end
  
  def get_firebase_name
    JSON.parse(@firebase_response.response.options[:response_body])['name']
  end
end
