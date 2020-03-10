def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs

  i = 0 
  
  while ( i < collection.length) do
    
    if collection[i][:item] == name
      return collection[i]
    end
    
    i += 1
    
  end
  
  return nil
  
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  new_cart = []
  
  i = 0 
  
  if new_cart.length == 0 
    new_cart << cart[0]
    new_cart[0][:count] = 1
    i += 1
  end
  
  while (i < cart.length) do 
    found = false
    j = 0
      while (j < new_cart.length) do
        if (new_cart[j][:item] == cart[i][:item])
          new_cart[j][:count] += 1
          found = true
        end
        j += 1
      end 
      if (!found)
        new_cart << cart[i]
        new_cart[-1][:count] = 1
      end
      i += 1
    end
  
  return new_cart
  
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  i = 0 
  
  while ( i < cart.length) do
    
    j = 0 
    while ( j < coupons.length) do 
      
      if (cart[i][:item] == coupons[j][:item] && cart[i][:count] >= coupons[j][:num])
        
        coupon_item = {
          :item => "#{cart[i][:item]} W/COUPON",
          :price => coupons[j][:cost]/coupons[j][:num],
          :clearance => cart[i][:clearance],
          :count => coupons[j][:num]
        }
        
        cart[i][:count] -=  coupon_item[:count]
        
        cart << coupon_item
      end
    
      j += 1
    end
    
    i += 1
  end
  
  return cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  i = 0 
  while (i < cart.length) do
    
    if (cart[i][:clearance])
      price = cart[i][:price] * 0.2
      price = cart[i][:price] - price
      price.round(2)
      cart[i][:price] = price
    end
    
    i += 1
  end
  
  return cart
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  updated_cart = consolidate_cart(cart)
  puts updated_cart
  updated_cart_w_coupons = apply_coupons(updated_cart)
  puts updated_cart_w_coupons
  updated_cart_w_coupons_clearance = apply_clearance(updated_cart_w_coupons)
  puts updated_cart_w_coupons_clearance
  
  i = 0
  grand_total = 0
  while (i < updated_cart_w_coupons_clearance.length) do
    grand_total += updated_cart_w_coupons_clearance[i][:price] * updated_cart_w_coupons_clearance[i][:count]
    
    i += 1
  end
  
  if (grand_total > 100) 
    grand_total = grand_total * (1 - 0.100)
    grand_total.round(2)
  end
  
end
