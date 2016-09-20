class Api::V1::ContactsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /v1/companies/:company_id/contacts
  def index
    per_page = params[:per_page] || 50
    order = params[:sort] || 'id'
    direction = params[:direction] || 'ASC'

    @contacts = current_company.contacts.order("#{order} #{direction}")
    if @contacts.nil?
      render_json({ http_status: :not_found })
    else
      total = @contacts.count
      @contacts = @contacts.paginate(page: params[:page], per_page: per_page)
      render_json(object: @contacts, each_serializer: ContactSerializer, meta: { count: total, params: params } )
    end
  end

  # GET /companies/:company_id/contacts/1
  def show
    render_json(object: @contact, serializer: ContactSerializer)
  end

  # POST /companies/:company_id/contacts
  def create
    render_status 401 and return unless has_company_access
    @contact = current_company.contacts.new(contact_params)
    if @contact.save
      render_json(object: @contact)
    else
      render_json({ http_status: :unprocessable_entity, object: @contact.errors.full_messages })
    end
  end

  # PATCH/PUT /companies/:company_id/contacts/1
  def update
    render_status 401 and return unless has_company_access
    if @contact.update(contact_params)
      render_json(object: @contact)
    else
      render_json({ http_status: :unprocessable_entity, object: @contact.errors.full_messages })
    end
  end

  # DELETE /companies/:company_id/contacts/1
  def destroy
    render_status 401 and return unless has_company_access
    @contact.destroy
    render_json({ http_status: :ok })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = current_company.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params[:contact]
        .permit(:external_id, :company_id, :title, :full_name, :salutation, :first_name, :last_name, :middle_name, :email, :phone_1, :phone_2, :phone_type_1, :phone_type_2, :primary_contact, :last_updated)
    end
end
