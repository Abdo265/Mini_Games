function[result]=Rookpaperscissors
totalGameTimeLimit = 10; 
while true
    % Display the choices and get user input
    startTime = tic;
    disp("Choose Rock, Paper, or Scissors:");
    disp("1: Rock");
    disp("2: Paper");
    disp("3: Scissors");

    computerchoice = randi(3);
    yourchoice = input("Enter the corresponding number for your choice: ");
    disp(["Your choice: " num2str(yourchoice)]);
    clc;
    switch yourchoice
        case 1
            yourchoice_str = "Rock";
            disp("Your choice:");
            disp("    _______");
            disp("---'   ____)");
            disp("      (_____)");
            disp("      (_____)");
            disp("      (____) ");
            disp("---.__(___) ");
        case 2
            yourchoice_str = "Paper";
            disp("Your choice:");
            disp("     _______");
            disp("---'    ____)____");
            disp("           ______)");
            disp("          _______)");
            disp("         _______)");
            disp("---.__________)");
        case 3
            yourchoice_str = "Scissors";
            disp("Your choice:");
            disp("    _______");
            disp("---'   ____)____");
            disp("          ______)");
            disp("       __________)");
            disp("      (____)");
            disp("---.__(___)");
    end

    switch computerchoice
        case 1
            computerchoice_str = "Rock";
            disp("Computer's choice:");
            disp("    _______");
            disp("---'   ____)");
            disp("      (_____)");
            disp("      (_____)");
            disp("      (____) ");
            disp("---.__(___) ");
        case 2
            computerchoice_str = "Paper";
            disp("Computer's choice:");
            disp("     _______");
            disp("---'    ____)____");
            disp("           ______)");
            disp("          _______)");
            disp("         _______)");
            disp("---.__________)");
        case 3
            computerchoice_str = "Scissors";
            disp("Computer's choice:");
            disp("    _______");
            disp("---'   ____)____");
            disp("          ______)");
            disp("       __________)");
            disp("      (____)");
            disp("---.__(___)");
    end

    % Determine the winner
    disp(["Result: " yourchoice_str " vs " computerchoice_str]);
    if yourchoice == computerchoice
        disp("It's a tie!");
    elseif (yourchoice == 1 && computerchoice == 3) || ...
            (yourchoice == 2 && computerchoice == 1) || ...
            (yourchoice == 3 && computerchoice == 2)
        disp('You win!');
        result=true
        break; % Exit the loop on winning
    else
        disp('Computer wins!');
        fprintf('\n \n \n');
    end

    % Check if the time limit is exceeded
    elapsedTime = toc(startTime);
    if elapsedTime > totalGameTimeLimit
        disp('Time limit exceeded. Game over.');
        break; % Exit the loop on time limit exceeded
    end
end
