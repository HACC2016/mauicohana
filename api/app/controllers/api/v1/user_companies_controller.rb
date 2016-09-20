class Api::V1::UserCompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_company, only: [:show, :edit, :update, :destroy]

  # GET /v1/companies/:company_id/user_companies
  def index
    per_page = params[:per_page] || 50
    order = params[:sort] || 'id'
    direction = params[:direction] || 'ASC'

    @user_companies = current_company.user_companies.order("#{order} #{direction}")
    if @user_companies.nil?
      render_json({ http_status: :not_found })
    else
      total = @user_companies.count
      @user_companies = @user_companies.paginate(page: params[:page], per_page: per_page)
      render_json(object: @user_companies, each_serializer: UserCompanySerializer, meta: { count: total, params: params } )
    end
  end

  # GET /companies/:company_id/user_companies/1
  def show
    render_json(object: @user_company, serializer: UserCompanySerializer)
  end

  # POST /companies/:company_id/user_companies
  def create
    render_status 401 and return unless has_company_access
    @user_company = current_company.user_companies.new(user_id: current_user.id)
    if @user_company.save
      render_json(object: @user_company)
    else
      render_json({ http_status: :unprocessable_entity, object: @user_company.errors.full_messages })
    end
  end

  # DELETE /companies/:company_id/user_companies/1
  def destroy
    render_status 401 and return unless has_company_access
    @user_company.destroy
    render_json({ http_status: :ok })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_company
      @user_company = current_company.user_companies.find(params[:id])
    end

end
