class Api::QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @question.anonymous_user_id= params[:question][:user_id].to_i
    if @question.save
      firebase = Firebase.new(ENV['FIREBASE_URI'])
      firebase.push("questions", {body: @question.body, user_id: @question.anonymous_user_id})
      render json: @question, success: true
    else
      render json: errors, status: 422
    end

  end

  private
  def question_params
    params.require('question').permit(:body, :anoymous_user)
  end
end
