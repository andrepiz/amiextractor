function ieee = ibm2ieee(ibm)
% Overall, this function performs the conversion from IBM floating-point format to IEEE floating-point format using bitwise operations and arithmetic calculations.

%Handling zero: If the input ibm is zero, the function returns 0.0.
if bin2dec(ibm) == 0
    ieee = 0;
    return
end

% Extracting sign bit: The sign bit is extracted from the most significant bit (bit 31) of the ibm number.
% If the sign bit is 1, it indicates a negative number.
% If the sign bit is 0, it indicates a positive number.
sign = bin2dec(ibm(1));

% Extracting exponent: The exponent is extracted from bits 24-30 of the ibm number.
% The exponent is adjusted by subtracting 64.
exponent = bin2dec(ibm(2:8)) - 2^6;

% Extracting mantissa: The mantissa is extracted from the least significant 24 bits of the ibm number.
%The 24 bits represent the fractional part of the number.
mantissa = bin2dec(ibm(9:32))/2^24;

% Combining the parts: The final IEEE floating-point number is calculated using the extracted sign, exponent, and mantissa. The formula used is:
% The sign bit determines whether the number is positive or negative.
% The mantissa represents the fractional part of the number.
% The exponent adjusts the magnitude of the number.

ieee = (1 - 2 * sign) * mantissa * 16^exponent;

end