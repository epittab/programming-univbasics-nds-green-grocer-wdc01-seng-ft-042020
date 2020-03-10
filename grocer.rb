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
  
  while (cart.length) do 
    
    
    i += 1
  end
  
  return new_cart
  
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  
  
  
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  updated_cart = []
  
  i = 0 
  while (i < cart.length) do
    
    if (!cart[i][:clearance])
      updated_cart << cart[i]
    else
      price = cart[i][:clearance] * 0.2
      price = cart[i][:clearance] - price
      price.round(2)
      cart[i][:clearance] = price
      updated_cart << cart[i]
    end
    
    i += 1
  end
  
  return updated_cart
  
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
end
