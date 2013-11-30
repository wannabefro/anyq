class Api::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]  

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id

    if user
      user.token = SecureRandom.hex
      user.save!
      @success = true
      @token = user.token
      @user = UserSerializer.new(user).to_json
    end
    
    render 'create'
  end

  def destroy
    request.authorization[/token=\"(.+)\"/]
    token = $1

    unless token.blank?
      user = User.find_by(:token => token)
      if user
        user.token = nil
        user.save!
      end
    end

    session.delete(:user_id)
    render :nothing => true
  end
end
