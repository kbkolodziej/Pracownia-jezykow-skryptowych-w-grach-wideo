declare -a play
declare -a players
declare -i checker=0
declare -a players=("o" "x")
play=(0 1 2 3 4 5 6 7 8)

tic_tac_toe_draw(){
    echo " TIC TAC TOE"
    echo " ___________"
    echo "| ${play[0]} | ${play[1]} | ${play[2]} |"
    echo "|___|___|___|"
    echo "| ${play[3]} | ${play[4]} | ${play[5]} |"
    echo "|___|___|___|"
    echo "| ${play[6]} | ${play[7]} | ${play[8]} |"
    echo "|___|___|___|"
  }

  is_won(){
    if [ "${play[$1]}" == "o" ]; then
      if [ "${play[$2]}" == "${play[$1]}"] && ["${play[$3]}" == "${play[$2]}"]; then
        clear
        tic_tac_toe_draw
        echo "The winner is o"
        the_end
      fi
    elif [ "${play[$1]}" == "x" ]; then
      if [ "${play[$2]}" == "${play[$1]}"] && ["${play[$3]}" == "${play[$2]}"]; then
        clear
        tic_tac_toe_draw
        echo "The winner is x"
        the_end
      fi
    fi
  }

  check_winner(){
    is_won 0 1 2
    is_won 3 4 5
    is_won 6 7 8
    is_won 0 3 6
    is_won 1 4 7
    is_won 2 5 8
    is_won 0 4 8
    is_won 2 4 6
  }

  the_end(){
    echo "Press [E] to exit"
    read -n 1 input
    if [ $input == "e" ] || [ $input == "E" ]; then
      exit 0
    fi
  }

  move(){
    let "checker=checker+1"
    echo "Player $1: Make move by inserting the number of an unoccupied field"
    read -n 1 insert
    clear
    play[insert]="$1"
    tic_tac_toe_draw play
    check_winner
    if [ $checker -eq 9 ]; then
      echo "Draw"
      the_end
    fi
    players_turns
  }

  players_turns(){
    if [ $(expr $checker % 2) == 0 ]; then
      move "o"
    else
      move "x"
    fi
  }

  clear
  tic_tac_toe_draw play
  players_turns