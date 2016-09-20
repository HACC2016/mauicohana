class Api::V1::CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /v1/companies
  def index
    per_page = params[:per_page] || 50
    order = params[:sort] || 'id'
    direction = params[:direction] || 'ASC'
    scope = Company.active

    if (params[:name])
      scope = scope.where([ 'name ILIKE ?', "%#{params[:name]}%" ])
    end

    if (params[:exporter])
      scope = scope.where([ 'exporter = ?', params[:exporter] ])
    end

    if (params[:business_type])
      business_type = 'tob_' + params[:business_type]
      if ['tob_grower', 'tob_distributor', 'tob_wholesaler', 'tob_processor', 'tob_manufacturer', 'tob_retailer', 'tob_other'].include?(business_type)
        scope = scope.where(["#{business_type} is true" ])
      end
    end

    if (params[:service])
      service = 'serv_' + params[:service]
      if ['serv_mailorder', 'serv_delivery', 'serv_packing', 'serv_growing', 'serv_labeling', 'serv_bulk', 'serv_retail', 'serv_other'].include?(service)
        scope = scope.where(["#{service} is true" ])
      end
    end

    if (params[:island])
      scope = scope.where([ 'island = ?', params[:island] ])
    end

    if (params[:category_id])
      scope = scope.joins(:categorizations).where([ 'category_id IN (?)', params[:category_id].split(',') ])
    end

    @companies = scope.all.order("#{order} #{direction}")
    if @companies.nil?
      render_json({ http_status: :not_found })
    else
      total = @companies.count
      @companies = @companies.paginate(page: params[:page], per_page: per_page)
      render_json(object: @companies, each_serializer: CompanySerializer, meta: { count: total, params: params } )
    end
  end

  # GET /companies/1
  def show
    render_json(object: @company, serializer: CompanyFullSerializer)
  end

  # POST /companies
  def create
    render_status 401 unless has_company_access
    @company = current_user.companies.new(company_params)
    if @company.save
      render_json(object: @company)
    else
      render_json({ http_status: :unprocessable_entity, object: @company.errors.full_messages })
    end
  end

  # PATCH/PUT /companies/1
  def update
    render_status 401 unless has_company_access
    if @company.update(company_params)
      render_json(object: @company)
    else
      render_json({ http_status: :unprocessable_entity, object: @company.errors.full_messages })
    end
  end

  # DELETE /companies/1
  def destroy
    render_status 401 unless has_company_access
    @company.destroy
    render_json({ http_status: :ok })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params[:company]
        .permit(:external_id, :name, :active, :omit, :needs_update, :needs_update_sent, :last_updated, :address, :city, :state, :zip, :island, :phone_1, :phone_2, :fax_pre, :fax, :website, :email, :certified, :country, :established_year, :products, :products_info, :notes_1, :notes_2, :employ, :annual_volume, :exporter, :export_sales, :title_1, :salutation_1, :salutation_2, :tob_grower, :tob_distributor, :tob_wholesaler, :tob_processor, :tob_manufacturer, :tob_retailer, :tob_other, :tob_otherdesc, :serv_mailorder, :serv_delivery, :serv_packing, :serv_growing, :serv_labeling, :serv_bulk, :serv_retail, :serv_other, :serv_otherdesc)
    end
end
