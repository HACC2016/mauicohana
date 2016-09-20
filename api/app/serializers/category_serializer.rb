class CategorySerializer < ActiveModel::Serializer
  attributes(:id, :name, :parent_id, :children)

  def children
    object.subcategories.order('name ASC')
  end
end
