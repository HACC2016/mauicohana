class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /v1/categories
  def index
    @categories = Category.where(parent_id:nil).order('name ASC').map{|cat| { id: cat.id, name: cat.name, children: Category.where(parent_id:cat.id).order('name ASC')}}
    if @categories.nil?
      render_json({ http_status: :not_found })
    else
      total = @categories.count
      render_json(object: @categories, meta: { count: total, params: params } )
    end
  end

  # GET /categories/1
  def show
    render_json(object: @category, serializer: CategorySerializer)
  end

  # POST /categories
  def create
    render_status 401 and return unless is_admin
    @category = Category.new(category_params)
    if @category.save
      render_json(object: @category)
    else
      render_json({ http_status: :unprocessable_entity, object: @category.errors.full_messages })
    end
  end

  # PATCH/PUT /categories/1
  def update
    render_status 401 and return unless is_admin
    if @category.update(category_params)
      render_json(object: @category)
    else
      render_json({ http_status: :unprocessable_entity, object: @category.errors.full_messages })
    end
  end

  # DELETE /categories/1
  def destroy
    render_status 401 and return unless is_admin
    @category.destroy
    render_json({ http_status: :ok })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params[:category]
        .permit(:name, :parent_id)
    end
end
