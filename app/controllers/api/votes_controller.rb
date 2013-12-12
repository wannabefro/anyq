class Api::VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    question= Question.find(params[:vote][:question][:question][:id])
    @vote.question = question
    @vote.anonymous_user = AnonymousUser.find(params[:vote][:user_id])
    firebase = Firebase.new(ENV['FIREBASE_URI'])
    if @vote.save
      firebase.update("questions/#{question.name}", {votes: question.votes})
      render json: @vote, success: true
    else
      render json: errors, status: 422
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:anonymous_user_id, :question_id)
  end
end
