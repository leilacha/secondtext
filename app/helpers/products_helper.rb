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
end
