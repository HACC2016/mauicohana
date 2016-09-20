class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def render_status(status_code)
    render nothing: true, status: status_code
  end

  def record_not_found
    render_status 404
  end

  def current_company
    @current_company = Company.find(params[:company_id])
  end

  def has_company_access
    is_admin || UserCompany.where(company_id: params[:company_id],user_id: current_user.id).present?
  end

  def is_admin
    current_user && current_user.admin
  end

  def render_json(args={})
    opts = BuildOptsForRenderJSON.call(args)
    return render(opts)
  end
end
