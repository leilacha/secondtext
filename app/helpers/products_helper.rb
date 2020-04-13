# frozen_string_literal: true

# Helper for products
module ProductsHelper
  def build_section_path(section, category)
  	link = section + '_path'
  	send(link.to_sym, {category: category})
  end

  def user_like?(user, product)
  	Like.where(user_id: user.id, product_id: product.id).any?
  end

  def sort_options(section)
  	section = Section.find_by(code: section)
    sorting_elems = Product::SORTING_ELEMS.map { |sorting_method, label| [label, sorting_method] }
  	[["Trier les #{section.french_code}", nil]] + sorting_elems
  end

  def sections_to_select
    [["Sélectionner une catégorie", nil]] + Section.all.pluck(:name, :id)
  end

  def authors_to_select(code)
    section = Section.find_by(code: code)
    section = [["Sélectionner une #{section.creator.downcase}", nil]] + section.authors.pluck(:name, :id).uniq!
  end

  def categories_to_select(code)
    section = Section.find_by(code: code)
    section = [["Sélectionner une catégorie", nil]] + section.categories.map { |cat| [cat, cat] }
  end

  def list(categories)
    ['Tout'] + categories
  end
end
