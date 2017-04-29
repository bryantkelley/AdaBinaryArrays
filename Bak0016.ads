-- Bryant Kelley

generic

package Bak0016 is

-- BINARY_NUMBER can be of value 0 or 1
type BINARY_NUMBER is range 0..1;

-- BINARY_ARRAY is indexed from 0 to 15 for a total of 16 elements of type BINARY_NUMBER
-- The most significant digit is stored at 0 and the least significant is stored at 15.
type BINARY_ARRAY is array (0..15) of BINARY_NUMBER;

-- package Bak0016 is

-- Converts a BINARY_ARRAY to an INTEGER
function Bin_To_Int(bin_array : BINARY_ARRAY) return INTEGER;

-- Converts an INTEGER to a BINARY_ARRAY
function Int_To_Bin(in_int : INTEGER) return BINARY_ARRAY;

-- Adds one BINARY_ARRAY to another
function "+"(one : BINARY_ARRAY; two : BINARY_ARRAY) return BINARY_ARRAY;

-- Adds an INTEGER to a BINARY_ARRAY
function "+"(one : BINARY_ARRAY; two : INTEGER) return BINARY_ARRAY;

-- Subtracts one BINARY_ARRAY from another
function "-"(one : BINARY_ARRAY; two : BINARY_ARRAY) return BINARY_ARRAY;

-- Subtracts an INTEGER from a BINARY_ARRAY
function "-"(one : BINARY_ARRAY; two : INTEGER) return BINARY_ARRAY;

-- Reverses a BINARY_ARRAY
procedure Reverse_Bin_Arr(bin_array : BINARY_ARRAY);

-- Prints a BINARY_ARRAY
procedure Print_Bin_Arr(bin_array : BINARY_ARRAY);

-- Returns a BINARY_ARRAY with random values
function Random_Array return BINARY_ARRAY;

-- Returns the compliment of the input BINARY_ARRAY
function Compliment_Array(bin_array : BINARY_ARRAY) return BINARY_ARRAY;

end Bak0016;
