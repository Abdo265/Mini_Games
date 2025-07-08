function [x]= memoryMatch()
x=false;  

% Create a 2x2 grid with pairs of custom symbols
    NumOfSymopls = 2 ;
    dim=sqrt(NumOfSymopls*2);
%symbols = ["🌟", "🎈", "🍎", "🚗", "🐱", "🌈", "⚽", "🎸"];
    symbols = ["🚗", "🐱"];
    %selecting symbols randomly 
    % why making 2 groubs of symbols? -> as it's matching(need a pair)
    grid = reshape([symbols(randperm(NumOfSymopls)), symbols(randperm(NumOfSymopls))], dim, dim);
    %grid is the matrix which has the true places 
disp(grid);
 readyResponse = upper(input('Are you ready to play Memory Match? (yes/no): ', 's'));
    
    if ~strcmp(readyResponse, 'YES')
        disp('Game aborted.');
        return;
    end
    clc;
    % Initialize the game board [empty grid] 
    board = strings(2,2);   %char array
    %board is the grid made up by the user 

    % Display the initial board
    displayBoard(board);

    % Set a time limit for the entire game (in seconds)
    totalGameTimeLimit = 20; 

    % Get the current time
    startTime = tic;    % set a time

    % Main game loop
    while any(board == "")      % game is on, while there is any empty cell
        %% check the time
        % Get user input for the first card
        timeExceeded = checkTimeSpent(startTime, totalGameTimeLimit);
        if timeExceeded
            break; % End the game loop
        end
        [row1, col1] = getUserInput();
        while board(row1, col1) ~= ""
            disp('Card already flipped. Try again.');
                % check the time
                % Get user input for the first card
                timeExceeded = checkTimeSpent(startTime, totalGameTimeLimit);
                if timeExceeded
                    break; % End the game loop
                end
            [row1, col1] = getUserInput();
        end
        board(row1, col1) = grid(row1, col1);   % assign the new value

        % Display the updated board [disp. after each assing.]
        displayBoard(board);

        %% Check the time
        % Get user input for the second card
        timeExceeded = checkTimeSpent(startTime, totalGameTimeLimit);
        if timeExceeded
            break; % End the game loop
        end
        [row2, col2] = getUserInput();
        while board(row2, col2) ~= ""
            disp('Card already flipped. Try again.');
            % check the time
            % Get user input for the first card
            timeExceeded = checkTimeSpent(startTime, totalGameTimeLimit);
             if timeExceeded
               board(row2,col2)="";
               break; % End the game loop
             end
            [row2, col2] = getUserInput();
        end
        board(row2, col2) = grid(row2, col2);   %assign

        % Display the updated board
        displayBoard(board);                    %disp

        % Check if the cards match
        if grid(row1, col1) == grid(row2, col2)
            disp('Match! Well done.');
        else
            disp('No match. Try again.');
            % Flip the unmatched cards back [no match]
            board(row1, col1) = "";
            board(row2, col2) = "";
            % Display the board after flipping back
            displayBoard(board);
        end
    end

    % Check if all pairs are matched
    if all(board ~= "")                 % you have won as; while loop condition is broken [prove by the last pair]
        fprintf('congrats! you match all pairs in %d seconds \n \n', round(toc(startTime)));
        
        x=true;
    end
end

%***functions implement-start*****
function displayBoard(board)
    disp('Current Board:');
    disp(' ---------');
    for i = 1:2
        fprintf('|');   %every new line
        for j = 1:2
            if board(i, j) == ""
                fprintf('    |');   %through the line 
            else
                fprintf(' %s |', board(i, j));  %through the line 
            end
        end
        fprintf('\n ---------\n');
    end
end


function [row, col] = getUserInput()
     x = input('Enter row (1-2)  : ');
     y = input('Enter col (1-2)  : ');
    while (x<1 | x>2 | y<1 | y>2)
        disp("please enter row and col again");
        x = input('Enter row (1-2)  : ');
        y = input('Enter col (1-2)  : ');
    end
    row = x;
    col = y;
end


function timeExceeded = checkTimeSpent(st, totalGameTimeLimit)
    elapsedTime = toc(st);   %get the time spent from the last tic [current moment - set moment]
    timeExceeded = elapsedTime > totalGameTimeLimit;
    if timeExceeded
        disp('Time limit exceeded. Game over.');
    end
end
%****functions implement-end********