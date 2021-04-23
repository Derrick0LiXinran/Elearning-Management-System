module CartsHelper

  def total_price(cart)
    sum = 0.0
    cart.course_packages.each do |package|
      sum += package.course.price.to_f
    end
    number_to_currency(sum)
  end

end
