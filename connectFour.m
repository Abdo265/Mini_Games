function connectFour()
    % Initialize the game board
    board = zeros(6, 7);

    % Display the initial board
    displayBoard(board);

    % Main game loop
    currentPlayer = 1;
    while true
        % Get the player's move
        move = getPlayerMove(currentPlayer, board);

        % Make the move and update the board
        [board, row] = makeMove(board, move, currentPlayer);

        % Display the updated board
        clc;
        displayBoard(board);

        % Check for a win
        if checkWin(board, row, move, currentPlayer)
            fprintf('Player %d wins!\n', currentPlayer);
            break;
        end

        % Check for a draw
        if all(board(:) ~= 0)
            fprintf("It's a draw!\n");
            break;
        end

        % Switch to the other player
        currentPlayer = 3 - currentPlayer;
    end
end

function displayBoard(board)
    % Display the Connect Four board with ASCII art
    for row = 1:6
        fprintf('|');
        for col = 1:7
            if board(row, col) == 0
                fprintf('   |');
            elseif board(row, col) == 1
                fprintf(' X |');
            else
                fprintf(' O |');
            end
        end
        fprintf('\n+---+---+---+---+---+---+---+\n');
    end
    fprintf('  1   2   3   4   5   6   7\n');
end

function move = getPlayerMove(player, board)
    % Get the player's move (column number)
    while true
        fprintf('Player %d, enter your move (1-7): ', player);
        move = input('');

        % Check if the selected column is full
        if all(board(:, move) ~= 0)
            fprintf('Error: Column is full. Please choose another column.\n');
        else
            break; % Exit the loop if the column is not full
        end
    end
end

function [board, row] = makeMove(board, move, player)
    % Make the player's move and update the board
    row = find(board(:, move) == 0, 1, 'last');
    board(row, move) = player;
end

function isWin = checkWin(board, row, col, player)
    % Check if the last move resulted in a win
    isWin = checkDirection(board, row, col, player, 1, 0) || ...    % Horizontal
            checkDirection(board, row, col, player, 0, 1) || ...    % Vertical
            checkDirection(board, row, col, player, 1, 1) || ...    % Diagonal \
            checkDirection(board, row, col, player, 1, -1);         % Diagonal /
end

function isWin = checkDirection(board, row, col, player, dRow, dCol)
    % Check for a win in a specific direction
    count = 0;
    for i = -3:3
        r = row + i * dRow;
        c = col + i * dCol;
        if r >= 1 && r <= 6 && c >= 1 && c <= 7 && board(r, c) == player
            count = count + 1;
            if count == 4
                isWin = true;
                return;
            end
        else
            count = 0;
        end
    end
    isWin = false;
end