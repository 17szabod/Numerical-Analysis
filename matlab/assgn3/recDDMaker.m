function [ coeffs, newY ] = recDDMaker( X, Y, i, d, newY, coeffs )
%RECDDMAKER Recursively creates a divided differences table
%   @param X: the original X coordinates
%   @param Y: the Y values that make up the current column
%   @param i: the vertical index
%   @param d: the horizontal index
%   @param newY: the Y values of the column to the right (d+1)
%   @param coeffs: the current set of values in the first row
%   @return coeffs: the coefficients this table generates
%   @return newY: the next row to go to (used to recurse)
newY(i) = (Y(i+1)-Y(i))/(X(i+d)-X(i)); %Computes the new Divided Difference
if (i == 1) %Ready to move to the next row over
    coeffs(d) = newY(i); %Store this as one of the final coefficients
    if (length(newY)==1) %At the final square
        newY
        return %Start moving back up
    end
else
    [coeffs,newY]=recDDMaker(X,Y,i-1, d, newY, coeffs); %Vertical movement,
    %computes the row above
    %Note: We only really need newY, but because matlab does not pass by
    %reference we also have to take in coeffs
    if (i==length(Y)-1) %We are at the bottom of the table
        newY
        [coeffs,newY]=recDDMaker(X,newY,length(newY)-1,d+1, newY(1:end-1), coeffs);
        %Horizontal movement, computesthe next row over
    end
end
return
end

