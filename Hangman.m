function x = Hangman()
    x = false;
    y=false;
    while ~y %to replay until winning
    % Set a time limit for the entire game (in seconds)
    totalGameTimeLimit = 30; % Change this to your desired total game time limit

    % Get the current time
    startTime = tic;

    % Initialize the game
    secretWord = selectSecretWord();
    guessedWord = blanks(length(secretWord));
    incorrectGuesses = 0;
    maxIncorrectGuesses = 6;
    guessedLetters = [];

    while true
        % Display the game state
        disp(['Current Word: ' displayWord(guessedWord)]);
        disp(['Incorrect Guesses: ' num2str(incorrectGuesses)]);
        disp(['Guessed Letters: ' guessedLetters]);

        % Get user input
        guess = getGuess(guessedLetters);

        % Check if time limit is exceeded
        timeExceeded = checkTimeSpent(startTime, totalGameTimeLimit);
        if timeExceeded
            disp('Time limit exceeded. Game over.');
            y=false;
        end

        % Check if the guess is correct
        indices = (secretWord == guess);
        if any(indices)
            disp('Correct guess!');
            guessedWord(indices) = guess;
        else
            disp('Incorrect guess.');
            incorrectGuesses = incorrectGuesses + 1;
        end

        % Update guessed letters
        guessedLetters = [guessedLetters, guess];

        % Check for game end conditions
        if isequal(guessedWord, secretWord)
            disp(['Congratulations! You guessed the word: ' secretWord]);
            x = true;
            y=false;
            return
            break;
        elseif incorrectGuesses == maxIncorrectGuesses
            disp(['Sorry, you ran out of attempts. The word was: ' secretWord]);
            x=false;
            disp('Try again.');
            break;
        end

        % Display hangman
        drawHangman(incorrectGuesses);

        % Check if time limit is exceeded after displaying hangman
        timeExceeded = checkTimeSpent(startTime, totalGameTimeLimit);
        if timeExceeded
            disp('Time limit exceeded. Game over.');
            x=false;
            
            break;
        end
    end
    end
end
function Word = displayWord(word)
    % Display the word with underscores for unguessed letters
    Word = strrep(word, ' ', '_');
end

function secretWord = selectSecretWord()
    wordList = {'MATLAB', 'PLOT', 'SHEETS', 'BANANA', 'RANDOM', 'ENGINEER', 'BANHA', 'DRMONA'};
    n = length(wordList);
    secretWord = upper(wordList{randi(n)});
end

function guess = getGuess(guessedLetters)
    while true
        guess = upper(input('Enter a letter guess: ', 's'));

        if ischar(guess) && length(guess) == 1 && isletter(guess) && ~any(guessedLetters == guess)
            break;
        else
            disp('Invalid guess. Try again.');
        end
    end
end

function drawHangman(incorrectGuesses)
    hangmanArt = {
        '  +---+',
        '  |   |',
        '      |',
        '      |',
        '      |',
        '      |',
        '========='
    };

    switch incorrectGuesses
        case 1
            hangmanArt{3} = '  O   |';
        case 2
            hangmanArt{3} = '  O   |';
            hangmanArt{4} = '  |   |';
        case 3
            hangmanArt{3} = '  O   |';
            hangmanArt{4} = '  |   |';
            hangmanArt{5} = ' /|   |';
        case 4
            hangmanArt{3} = '  O   |';
            hangmanArt{4} = '  |   |';
            hangmanArt{5} = ' /|\  |';
        case 5
            hangmanArt{3} = '  O   |';
            hangmanArt{4} = '  |   |';
            hangmanArt{5} = ' /|\  |';
            hangmanArt{6} = ' /    |';
        case 6
            fprintf('\n Try again \n')
            y=true;
    end
    clc;
    disp(hangmanArt);
end

function timeExceeded = checkTimeSpent(st, totalGameTimeLimit)
    % Check if the total time limit is exceeded
    elapsedTime = toc(st);
    timeExceeded = elapsedTime > totalGameTimeLimit;
end
