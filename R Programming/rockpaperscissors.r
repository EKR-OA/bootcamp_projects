count <- 0
win <- 0
lose <- 0
draw <- 0
choices <- c("Scissors","Rock","Paper")
print("Welcome to Pao-Ying-Chub Game")
print("Rule1 : Scissors Win Paper")
print("Rule2 : Paper Win Rock")
print("Rule3 : Rock Win Scissors")
print("Choose 1.Scissors 2.Rock 3.Paper")
print("Or Press Q to quit")
while(TRUE){ 
  inn <- readLines("stdin",n=1)
  if(inn == "Q"){
    total_dis <- paste("Total Turn: ",count)
    win_dis <- paste("Win: ",win)
    lose_dis <- paste("Lose: ",lose)
    draw_dis <- paste("Draw: ",draw)
    print(total_dis)
    print(win_dis)
    print(lose_dis)
    print(draw_dis)
    break
  }else{
    ys <- paste("You choose: ",choices[[as.numeric(inn)]])
    print(ys)
    count <- count+1
    if (inn == "1"){
      enm <- as.character(sample(1:3,1))
      #print(enm)
      enm_dis <- paste("Enemy: ",choices[[as.numeric(enm)]])
      print(enm_dis)
      if(enm == "1"){
        print("Draw!")
        draw <- draw+1
      }else if(enm == "3"){
        print("Win!")
        win <- win+1
      }else{
        print("Lose!")
        lose <- lose+1
      }
    }else if(inn == "2"){
      enm <- as.character(sample(1:3,1))
      #print(enm)
      enm_dis <- paste("Enemy: ",choices[[as.numeric(enm)]])
      print(enm_dis)
      if(enm == "2"){
        print("Draw!")
        draw <- draw+1
      }else if(enm == "1"){
        print("Win!")
        win <- win+1
      }else{
        print("lose!")
        lose <- lose+1
      }
    }else if(inn == "3"){
      enm <- as.character(sample(1:3,1))
      #print(enm)
      enm_dis <- paste("Enemy: ",choices[[as.numeric(enm)]])
      print(enm_dis)
      if(enm == "3"){
        print("Draw!")
        draw <- draw+1
      }else if(enm == "2"){
        print("Win!")
        win <- win+1
      }else{
        print("lose!")
        lose <- lose+1
      }
    }else{
      print("Try again")
    }
  }
 }
