function[result]= guesswhat
result = false;
% Get user input for difficulty level
disp('Choose difficulty level:');
disp('1: Easy');
disp('2: Medium');
disp('3: Hard');

level = input('Enter the difficulty level: ');

% Set maximum values based on difficulty level
switch level
    case 1
        totalGameTimeLimit = 8;
        maxNumber = 10;
    case 2
        maxNumber = 20;
        totalGameTimeLimit = 14;
    case 3
        maxNumber = 30;   
        totalGameTimeLimit = 20;

    otherwise
        disp('Invalid level!');
        
        return;
end

% Generate a random number for the computer
computerguess = randi(maxNumber);

% Set a time limit for the entire game (in seconds)

% Get the current time
startTime = tic;

% Get user input for the initial guess
yourguess = input('Enter your guess: ');

while ~result
    % Check if the guess is correct
    if yourguess < computerguess
        disp('Too low');
    elseif yourguess > computerguess
        disp('Too high');
    elseif yourguess == computerguess
        disp('Correct! You guessed it.');
        result = true; % Update result to exit the loop
        break;
    else
        disp('Invalid input. Please enter a valid guess.');
    end
    
    % Check if the time limit is exceeded
    elapsedTime = toc(startTime);
    if elapsedTime > totalGameTimeLimit
        disp('Time limit exceeded. Game over.');
        result=false;
        break;
    end
    
    % Get user input for the next guess
    yourguess = input('Try again: ');
end
end
