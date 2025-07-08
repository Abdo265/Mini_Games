fprintf('صلي علي محمد\n\n');
fprintf('Welcome to the guessing game:\n');
counter = 0;

while true
    if counter == 0
        result1 = guesswhat();
    end
    
    % Increment counter if guesswhat is successful
    if result1
        counter = 1;
    end
    
    if result1 && counter == 1
        fprintf('\n \n \n');
        %clc;
        result2 =  memoryMatch();
        
        % Increment counter if playHangman is successful, else reset to 1
        if result2
            counter = 2;
        else
            counter = 1;
        end
    end
    
    % Check if Rookpaperscissors should be executed
    if  result1 && counter == 2
        fprintf('\n \n \n');
        %clc;
        
        result3 = Rookpaperscissors();
        
        % Increment counter if Rookpaperscissors is successful, else reset to 2
        if result3
            counter = 3;
        else
            counter = 2;
        end
    end
    if  counter == 3
        fprintf('\n \n \n');
        %clc;
        
        result4 = Hangman();
        if result4
            counter = 4;
        else
            counter = 3;
        end
    end
    if counter == 4
        fprintf('\n \n \n');
        clc;
        
        connectFour();
        disp('الحمد لله');
        break;
    end
end
