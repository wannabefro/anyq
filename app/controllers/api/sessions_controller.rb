class Api::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]  

  def create
    user = User.from_omniauth(env['omniauth.auth'])

    if user
      user.token = SecureRandom.hex
      user.save!
      @success = true
      @token = user.token
      @anonymous_user = AnonymousUser.where(token: @token).take || anonymous_user
      session[:user_id] = @anonymous_user.id
      @user = AnonymousUserSerializer.new(@anonymous_user, {current_user: true}).to_json
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

  private
  
  def anonymous_user
    @anonymous_user = AnonymousUser.new
    @anonymous_user.ip_address = request.remote_ip
    @anonymous_user.username = @anonymous_user.set_username
    @anonymous_user.token = @token
    @anonymous_user.save!
    @anonymous_user
  end
end
