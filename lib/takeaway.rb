class Takeaway
  MENU = {:Borsh => 6.95,
  :Yakitori => 9.50,
  :Vareniki => 8.35,
  :Sushi => 12.00,
  :Ramen => 11.95,
  :Udon => 11.95,
  :Shabu_shabu => 19.50,
  :Sarada => 4.50,
  :Edamame => 3.30}

  def initialize
 @order = []
 @price = 0
  end

def show_menu
MENU.dup
end

def select_dish(dish, quantity)
 fail 'Not on menu. Please pick dish from the list' unless on_menu? dish
 @order << [dish, quantity]
end

def on_menu? dish
MENU.has_key?(dish)
end

end
