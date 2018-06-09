class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    vars = request.query_parameters
    @id = vars['id']
    if(!defined? @id)
      @id = current_user.id
    end
    @contagem = 0
    @user = User.find_by(:id => @id)
    @posts = Post.where(:user => @user).order("created_at DESC")
  end
end
