# frozen_string_literal: true

# Helper for products
module ProductsHelper
  def build_section_path(section, category)
  	link = section + '_path'
  	send(link.to_sym, {category: category})
  end
end
