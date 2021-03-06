require_relative 'text'
class Takeaway
  MENU = {:Borscht => 6.95,
  :Yakitori => 9.50,
  :Vareniki => 8.35,
  :Sushi => 12.00,
  :Ramen => 11.95,
  :Udon => 11.95,
  :Shabu_shabu => 19.50,
  :Sarada => 4.50,
  :Edamame => 3.30}
attr_accessor :time
  def initialize
 @order = []
 @price = 0
  end

  def show_menu
    MENU.each do |key, value|
      puts "#{key}:#{value}"
 end
  end

  def select_dish(dish, quantity)
   raise 'Not on menu. Please pick dish from the list' unless on_menu? dish
   @order << [dish, quantity]
  end

   def on_menu? dish
    MENU.has_key?(dish)
   end

   def make_order
    show_menu
    puts "Choose dish and quantity or type 'finish' to end order"
    puts "Pick the dish"
    dish = gets.chomp
    if dish != 'finish'
      puts "Set the quantity"
      quantity = gets.chomp
      select_dish dish.to_sym, quantity.to_i
      puts "Total price: £#{count_price}"
      make_order
    else
      make_payment
    end
  end

  def count_price

    price = 0
    @order.each do |dish|
    price += MENU[dish[0]]*dish[1]
    end
    price
  end

  def check_payment amount
   unless correct? amount
    raise 'Payment was unsuccesful. Incorrect amount'
   else

      text = Text.new
     text.send
  'Payment was succesful'
    end
  end

  def make_payment
    puts 'To check amount to pay, input payment amount'
    amount = gets.chomp
    check_payment amount
  end

  def correct? amount
    p "AMOUNT = #{amount}"
    p "PRICE = #{count_price}"
    amount.to_f == count_price
   end

  #  def delivery_time
  #    @time = Time.now + 60 * 60
  #  end
end
