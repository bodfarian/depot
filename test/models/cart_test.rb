require 'test_helper'

class CartTest < ActiveSupport::TestCase
  
  test "cart successfully saves two unique products" do
     # cart is created
    cart = Cart.create 
    # two difference items are saved to cart
    cart.add_product(products(:ruby).id).save! 
    cart.add_product(products(:agile).id).save! 
    # assert line_item quantity is 2
    assert_equal 2, cart.line_items.size
    # assert total price is what it should be
    assert_equal 99.50, cart.total_price
  end

  test "cart successfully saves two identical products" do
    # cart is created
    cart = Cart.create 
    # two of the same item are saved to cart
    cart.add_product(products(:ruby).id).save! 
    cart.add_product(products(:ruby).id).save! 
    # assert line_item quantity is 1
    assert_equal 1, cart.line_items.size
    # assert total price is what it should be
    assert_equal 99, cart.total_price
  end
end
