class CompanyFullSerializer < CompanySerializer
  attributes(:categories)

  has_many :contacts

  def categories
    object.categories.where(parent_id:nil).order('name ASC').map{|cat| { id: cat.id, name: cat.name, children: Category.where(parent_id:cat.id).order('name ASC')}}
  end
end
