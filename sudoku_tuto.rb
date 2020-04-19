sudoku = File.open("sudoku_2.txt", "r+")
sudoku = sudoku.read.split('')
sudoku = sudoku - ["-", "+", "\n", " ", "|"]

# on crée notre base de donnée de notre sudoku
def parse_board(sudoku)
    result = []

    for i in 0...sudoku.length do
    if i % 9 == 0
      result.push(sudoku[i...i + 9].map(&:to_i))
    end
  end

  result
end

board = parse_board(sudoku)

# on capture dans un tableau la position des chiffres manquants
def find_empty_positions(board)

    empty_positions = []

  for rrow in 0...board.length
    for col in 0...board[rrow].length
      if board[rrow][col] == 0
        empty_positions << [rrow, col]
      end
    end
  end

  empty_positions
end

empty_positions = find_empty_positions(board)


# on vérifie si notre chiffre existe dans la ligne
def check_row(board, rrow, number)

    for col in 0...board[rrow].length
        if board[rrow][col] == number
        return false
        end
    end

    true
end


# on vérifie si notre chiffre existe dans la colonne
def check_col(board, col, number)

  for rrow in 0...board.length
    if board[rrow][col] == number
      return false
    end
  end

  true
end


# on vérifie si notre chiffre existe dans le carré
def check_block(board, rrow, col, number)
    lower_row = 3 * (rrow / 3)
    lower_col = 3 * (col / 3)
    upper_row = lower_row + 3
    upper_col = lower_col + 3

    for r in lower_row...upper_row
        for c in lower_col...upper_col
            if board[r][c] == number
                return false
            end
        end
    end
    
    true

end

# on vérifie si le chiffre qu'on ajoute existe déjà
def check_value(board, rrow, col, number)
    check_row(board, rrow, number) &&
    check_col(board, col, number) &&
    check_block(board, rrow, col, number)
end

# on trouve les chiffres qui manquent
def solve_sudoku(board, empty_positions)
    i = 0

    while i < empty_positions.length
        rrow = empty_positions[i][0]
        ccolumn = empty_positions[i][1]
        number = board[rrow][ccolumn] + 1
        found = false

        while !found && number <= 9
            if check_value(board, rrow, ccolumn, number)
            found = true
            board[rrow][ccolumn] = number
            i += 1
            else
                number += 1
            end
        end

        if !found
        board[rrow][ccolumn] = 0
        i -= 1
        end
    end
  
  board
end

# sudoku rempli
def solve(board)
  empty_positions = find_empty_positions(board)
  solve_sudoku(board, empty_positions)
end

sudoku_solved = solve(board)


print sudoku_solved