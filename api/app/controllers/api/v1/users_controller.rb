class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /v1/users
  def index
    render_status 401 and return unless is_admin
    per_page = params[:per_page] || 50
    order = params[:sort] || 'id'
    direction = params[:direction] || 'ASC'
    @users = User.all.order("#{order} #{direction}")
    if @users.nil?
      render_json({ http_status: :not_found })
    else
      total = @users.count
      @users = @users.paginate(page: params[:page], per_page: per_page)
      render_json(object: @users, each_serializer: UserSerializer, meta: { count: total, params: params } )
    end
  end

  # GET /users/1
  def show
    render_status 401 and return unless is_admin
    render_json(object: @user, serializer: UserSerializer)
  end

  # GET /users/me
  def me
    render_json(object: current_user, serializer: UserSerializer)
  end

  # PATCH/PUT /users/1
  def update
    render_status 401 and return unless is_admin
    if @user.update(user_params)
      render_json(object: @user)
    else
      render_json({ http_status: :unprocessable_entity, object: @user.errors.full_messages })
    end
  end

  # DELETE /users/1
  def destroy
    render_status 401 and return unless is_admin
    @user.destroy
    render_json({ http_status: :ok })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
        .permit(:name, :email, :admin)
    end

end
