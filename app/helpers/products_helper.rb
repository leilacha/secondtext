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
  	section_name = fetch_section_name(section)
    sorting_elems = Product::SORTING_ELEMS.map { |sorting_method, label| [label, sorting_method] }
  	[["Trier les #{section_name}", nil]] + sorting_elems
  end

  def fetch_section_name(section)
  	return 'livres' if section == 'books'
  	return 'films' if section == 'movies'
  	'oeuvres'
  end
end
