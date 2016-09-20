class Api::V1::CategorizationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_categorization, only: [:show, :destroy]

  # GET /v1/companies/:company_id/categorizations
  def index
    per_page = params[:per_page] || 50
    order = params[:sort] || 'id'
    direction = params[:direction] || 'ASC'

    @categorizations = current_company.categorizations.order("#{order} #{direction}")
    if @categorizations.nil?
      render_json({ http_status: :not_found })
    else
      total = @categorizations.count
      @categorizations = @categorizations.paginate(page: params[:page], per_page: per_page)
      render_json(object: @categorizations, each_serializer: CategorizationSerializer, meta: { count: total, params: params } )
    end
  end

  # GET /companies/:company_id/categorizations/1
  def show
    render_json(object: @categorization, serializer: CategorizationSerializer)
  end

  # POST /companies/:company_id/categorizations
  def create
    render_status 401 and return unless has_company_access
    @categorization = current_company.categorizations.new(categorization_params)
    if @categorization.save
      render_json(object: @categorization)
    else
      render_json({ http_status: :unprocessable_entity, object: @categorization.errors.full_messages })
    end
  end

  # DELETE /companies/:company_id/categorizations/1
  def destroy
    render_status 401 and return unless has_company_access
    @categorization.destroy
    render_json({ http_status: :ok })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorization
      @categorization = current_company.categorizations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categorization_params
      params[:categorization]
        .permit(:category_id)
    end
end
