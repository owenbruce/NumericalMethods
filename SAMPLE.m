%*************************************************
%  Sample .m file
%*************************************************  
%
%---General Comments:
%   ----------------
%        - recommend that you print this file and
%          try typing in the various commands to see
%          what happens.
%        - Matlab is case sensitive:  So the
%          variables:  'TEMP' and 'temp' are different
%        - Matlab commands are always lowercase
%        - you can enter commands directly (interactively)
%          using the command window or you can put commands
%          in a .m file (for example, this file is called
%          'sample.m') and then run the .m file by
%                    - setting the current directory to the
%                      directory containing the .m file
%                       i.e., >> cd c:\my_doc\ etc.
%                    - then typing the name of the .m file
%                      from the command window: i.e., type:  sample
%        - to put a comment line into a .m file, put a % in first column
%        - to continue a command line onto a second line, put a space
%          followed by three dots at the end of the first line:
%                 y = 3.0*sin(6.5) ...
%                      /cos(pi)
%
%--- Useful matlab commands:
%
%     >> clc    - clears the command window
%     >> clear  - clears all variables from memory (empties the workspace)
%     >> cd     - change directories (can use the tab key to complete
%                 the directory names)
%     >> pwd    - print working directory (shows you where you are)
%     >> help   - you can type help in the command window to get
%                 help with a certain command:  i.e., help if
%
%-- example of how to set the value of a variable:
%     note that the variable and its value will be
%     written to the screen.
%
DIA = 6.6
%
%-- example of how to do a mathematical calculation: 
%    note that 'pi' is a special number for matlab
%
AREA = (pi/4.0)*DIA^2
%
%-- to suppress printing the output to the screen, 
%   put a semicolon at the end of the line:
%
C = cos(pi/4);
% 
%-- to read in the value of a variable from the keyboard:
%
TEMP=input('Enter a value for temperature in deg F:  ');
%
%-- writing out a string of characters to the screen:
%   Just put quotes around the characters.
%    Note that Matlab will write it out with a label 'ANS ='
%    (since we didn't give the variable a name)
%
'Hello World'
%
%-- use the disp command to write out characters but suppress
%   the label:
%
disp('Hello World!')
%
%-- write out the value of variable TEMP using the disp
%   command. Note that only the value of TEMP is written
%   (i.e., the label 'TEMP' is suppressed):
%
disp('Writing out TEMP')
disp(TEMP)
%
%--you can also write the value of a variable by just typing in the 
%  variable name.  Labels for the variables C and TEMP will appear
%  along with their values.
%
C
TEMP
%
%--we can also assign a character string to a variable:
%  In this example, the variable's name is: title
%
title = 'temperature in degrees F' 
%
%--- example of how to do a loop in matlab using the 'for' 
%    command.  The variable 'i' is incremented from 2 to 10.  
%    The variables TF(i) and TC(i) are each 1x10 matrices 
%    (i.e., they each have one row and ten columns)
%
% in this example, temperature is converted from Fahrenheit to Celsius:
%
TF(1)=TEMP
TC(1)=(5.0/9.0)*(TF(1)-32.0)
for i = 2:10
    TF(i) = TF(i-1) +5.0;
    TC(i)=(5.0/9.0)*(TF(i)-32.0);
end
%
%--- writing to the screen the 1x10 (rowsxcolumns) matrix 'TC'
TC
%
%--- create new matrix combining TC and TF:
%    The matrices TC and TF are both 1x10.  The new
%    combined matrix is 2x10
TCTF = [TC;TF]
%
%
%--- to make the data more readable, we can change it into a
%    10x2 matrix (so it has two columns and ten rows) by 
%    defining a new matrix (called 'table') that is the transpose
%    of TCTF.
table=TCTF'
%
%--- simple matrix commands:
%    ======================
%    There are a different ways to enter matrices.  
%    Entries in a matrix are separated by blanks or commas,
%    rows in a matrix are entered on different lines or
%    are separated by semicolons. Square brackets [ ] indicate 
%    the start and end of a matrix.
%
%    In the example below, MATA is a 3x2 matrix (so 3 rows and two columns).  
%    It is entered by typing in each row on a separate line.
%
MATA = [1 2 
        3 4
        5 6]
%
%     MATB is a 2x3 matrix (so two rows and three columns).  It is
%     entered by separating the rows with a semicolon).
%
MATB = [3 2 1; 2 4 5]
%
%--- matrix multiplication can be performed easily.  We can multiply
%    MATA (3x2) * MATB (2x3) and get a 3x3 matrix by typing:
%
MATC = MATA*MATB
%
%--- can add two matrices together (note that they must have the same
%    number of rows and columns):
%
MATC = MATA + MATA
%
%--- can multiply each element of a matrix by a scalar:
%
MATD = 4.0*MATC
%
%--- can transpose a matrix using the ' command:
%
MATE = MATD'
%
%
%--- to write output to a file, the steps are:
%       1. open the file: the file here is called 'pig.dat' and
%          has 'write' priviliges
%       2. write out what you want.  Note that \n puts in a carriage
%          return
%       3. close the file
%
%--------here is how you open a file:
fid=fopen('pig.dat','w');
%
%--------example of writing out text to a file:
fprintf(fid,'This text will be written to pig.dat \n \n');
fprintf(fid,'This text should be on line3 in pig.dat \n');
fprintf(fid,'Temp in Degrees C, Temp in Degrees F \n');
%
%--------example of writing out a matrix to a file
%        Note that the data is formated so that the data in the
%        first column will have 3 decimal points and take up 8
%        spaces, 6 blank spaces between columns, and the data
%        in the second column takes up 10 spaces and has 5 decimal
%        points.
%        
fprintf(fid,'%8.3f      %10.5f \n',TCTF);
%
%--------now close the file:
fclose(fid);
%
%-------example of how to use the if/elseif/else/end command:
%       we will be comparing the values of variables A and B.
%
%       The relational operators in matlab are:
%              <  less than
%              <= less than or equal to
%              >  greater than
%              >= greater than or equal to
%              == equal to
%              ~= not equal to
%
%--- first need to enter (from the keyboard) values of A and B:
%
disp('Here is an example of using an "if" statement')
disp('You will need to enter values for A and B - try different value')
disp('to get different results')
A=input('Enter a value for A:   ')
B=input('Enter a value for B:   ')
%
if A > B
    'A is greater than B'
elseif A < B
    'A is smaller than B'
else
    'A is equal to B'
end
%    
%---How to make plots in Matlab:
%   ****************************
%   Use the following commands to create a plot.  When you type these commands
%   into the command window, you will create a plot that contains two curves.
%   The 'hold on' command allows for multiple curves to appear on a single
%   plot.  The 'TC' data will appear as a solid line (with no symbols)
%   where as the 'TF' data will be plotted using a + sign only.  This can
%   be easily modified after the plot is created using the commands 
%   available in the plot window.  To create this plot, type:
%
%   We first need to generate some 'x' data. Then we'll plot TC vs. x and
%   TF vs. x on the same plot.  Note that x, TC, and TF are all 1x10 matrices.
%
%          >> x = 1:10
%          >>  plot (x, TC)
%          >>  hold on
%          >>  plot (x, TF, '+')
%
%   You can add xtitle, ytitle through the insert command on the plot window.
%   Can change line types, symbols, etc. by clicking on the edit plot
%   (the arrow at the top of the screen that points towards 11:00) and then
%   double clicking on the curve you want to change.  To create a legend,
%   first double click on the curve, click on the 'Info' tab, and type
%   in a Tag.  Do this for all the curves, and then click insert - legend.
