###### Greeting
greeting <- function(){
  print("Welcome to Alex pizza!")
  print("What's your name?")
  cus_name <- readLines("stdin",n=1)
  print(paste("Hello",cus_name))
  return(cus_name)
}
###### Way to recieve pizza
rec_pizza <- function(){
  print("Would you like your order for self pick-up or delivery?")
  print("Press 1.Self pick-up 2.Delivery")
  while(TRUE){
    r_cus <- readLines("stdin",n=1)
    if (r_cus == "1"){
      print("You choose : Self pick-up")
      return(list(0,"Self pick-up"))
      break
    }else if (r_cus == "2") {
      print("You choose : Delivery")
      return(list(50,"Delivery"))
      break
    }else{
      print("Please try again")
    }
  }
}
##### Choose pizza
type_pizza <- function(){
  print("What pizza do you want?")
  print("Press 1.Seafood 2.Hawaiian 3.Meat duluxe")
  while(TRUE){
    choice <- readLines("stdin",n=1)
    if (choice == "1"){
      print("You choose : Seafood")
      return(list(300,"Sea food"))
      break
    }else if(choice == "2"){
      print("You choose : Hawaiian")
      return(list(200,"Hawaiian"))
      break
    }else if(choice == "3"){
      print("You choose : Meat duluxe")
      return(list(250,"Meat duluxe"))
      break
    }else{
      print("Please try again")
    }
  }
}
#####Size Pizza
size_pizza <- function(){
  print("What size do you want to order?")
  print("Press 1.Small 2.Medium 3.Large")
  while(TRUE){
    choice <- readLines("stdin",n=1)
    if (choice == "1"){
      print("You choose : Small size")
      return(list(50,"Snall size"))
      break
    }else if(choice == "2"){
      print("You choose : Medium size")
      return(list(150,"Medium size"))
      break
    }else if(choice == "3"){
      print("You choose : Large size")
      return(list(250,"Large size"))
      break
    }else{
      print("Please try again")
    }
  }
}
#####Crust
crust_pizza <- function(){
  print("What type of crust do you want?")
  print("Press 1.Pan 2.Crispy thin 3.Cheese")
  while(TRUE){
    choice <- readLines("stdin",n=1)
    if (choice == "1"){
      print("You choose : Pan")
      return(list(50,"Pan"))
      break
    }else if(choice == "2"){
      print("You choose : Crispy")
      return(list(100,"Crispy"))
      break
    }else if(choice == "3"){
      print("You choose : Cheese")
      return(list(200,"Cheese"))
      break
    }else{
      print("Please try again")
    }
  }
}

  ###appetizers
appe_dish <- function(){
  print("Would you like to order appetizers?")
  print("Press 1.Yes 2. No")
  while(TRUE){
    choice <- readLines("stdin",n=1)
    if (choice == "1"){
      print("Choose your side dish?")
      print("Press 1.Spaghetti 2. Fried chicken 3.Fish fingers")
      while(TRUE){
        choice <- readLines("stdin",n=1)
        if (choice == "1"){
          print("You choose : Spaghetti")
          return(list(70,"Spaghetti"))
          break
        }else if(choice == "2"){
          print("You choose : Fried chicken")
          return(list(120,"Fried chicken"))
          break
        }else if(choice == "3"){
          print("You choose : Fish fingers")
          return(list(80,"Fish fingers"))
          break
        }else{
          print("Please try again")
        }
      }
    }else if(choice == "2"){
      print("You choose : No")
      return(list(0,"No"))
      break
    }else{
      print("Please try again")
    }
  }
}
#####drinks
drinks <- function(){
  print("What would you like to drink?")
  print("Press 1.Drinking water 2.Cola")
  while(TRUE){
    choice <- readLines("stdin",n=1)
    if (choice == "1"){
      print("You choose : Drinking water")
      return(list(10,"Drinking water"))
      break
    }else if(choice == "2"){
      print("You choose : Cola")
      return(list(15,"Cola"))
      break
    }else{
      print("Please try again")
    }
  }
}
####calculation
cal <- function(name,rec,t,s,c,ap,d){
  print("Please confirm your order")
  print("Press 1.Confirm order 2.Cancel")
  while(TRUE){
    choice <- readLines("stdin",n=1)
    if (choice == "1"){
      print("--------------------")
      print("Order summary")
      print(paste("Customer name :",name))
      print(rec[[2]])
      print(paste("Pizza :",t[[2]]))
      print(paste("Size :",s[[2]]))
      print(paste("Crust :",c[[2]]))
      print(paste("Appetizers :",ap[[2]]))
      print(paste("Drinks :",d[[2]]))
      print(paste("Total price (baht)",rec[[1]]+t[[1]]+s[[1]]+c[[1]]+ap[[1]]+d[[1]]))
      break
    }else if(choice == "2"){
      print("See you again")
      break
    }else{
      print("Please try again")
    }
  }
}

#####Main######
name <- greeting()
receivepiz <- rec_pizza()
t_pizza <- type_pizza()
s_pizza <- size_pizza()
cr <- crust_pizza()
app <- appe_dish()
dri <- drinks()
done_order <- cal(name,receivepiz,t_pizza,s_pizza,cr,app,dri)
