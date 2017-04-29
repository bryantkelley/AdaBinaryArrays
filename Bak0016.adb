with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Bak0016 is

-- REQUIRED FEATURES

-- Converts a BINARY_ARRAY to an INTEGER
function Bin_To_Int(bin_array : BINARY_ARRAY) return INTEGER is
   Output_Integer : INTEGER := 0;
begin
   for Index in 0..15 loop
      Output_Integer := Output_Integer + (INTEGER (bin_array(Index)) * 2**(15 - Index));
   end loop;
   
   return Output_Integer;
end Bin_To_Int;

-- Converts an INTEGER to a BINARY_ARRAY
function Int_To_Bin(in_int : INTEGER) return BINARY_ARRAY is
   output : BINARY_ARRAY;
   remain : INTEGER;
begin
   remain := in_int rem 2**16;
   if in_int >= 2**16 then
      Put_Line ("Input is too big to fully convert.");
      Put_Line ("Making best attempt.");
   end if;
   for Index in 0..15 loop
      output(Index) := BINARY_NUMBER (remain / 2**(15 - Index));
      remain := remain rem 2**(15 - Index);
   end loop;

   return output;
end Int_To_Bin;

-- Adds one BINARY_ARRAY to another
function "+"(one : BINARY_ARRAY; two : BINARY_ARRAY) return BINARY_ARRAY is
   output_array : BINARY_ARRAY;
   carry_bit : BINARY_NUMBER := 0;
   sum : INTEGER := 0;
begin
   for Index in 0..15 loop
      sum := INTEGER(carry_bit) + INTEGER(one(15 - Index)) + INTEGER (two(15 - Index));   
      if sum = 0 then
         carry_bit := 0;
         output_array(15 - Index) := 0;
      elsif sum = 1 then
         carry_bit := 0;
         output_array(15 - Index) := 1;
      elsif sum = 2 then
         carry_bit := 1;
         output_array(15 - Index) := 0;
      else
         carry_bit := 1;
         output_array(15 - Index) := 1;
      end if;
   end loop;
   return output_array;
end "+";

-- Adds an INTEGER to a BINARY_ARRAY
function "+"(one : BINARY_ARRAY; two : INTEGER) return BINARY_ARRAY is
   output_array : BINARY_ARRAY;
   converted_array : BINARY_ARRAY;
begin
   converted_array := Int_To_Bin(two);
   output_array := "+"(one, converted_array);
   return output_array;
end "+";

-- Subtracts one BINARY_ARRAY from another
function "-"(one : BINARY_ARRAY; two : BINARY_ARRAY) return BINARY_ARRAY is
   output_array : BINARY_ARRAY;
   two_back : BINARY_ARRAY;
   sum_one_two_back : BINARY_ARRAY;
   single : BINARY_ARRAY := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
begin
   two_back := Compliment_Array(two);
   sum_one_two_back := "+"(one, two_back);
   output_array := "+"(sum_one_two_back, single);
   return output_array;
end "-";

-- Subtracts an INTEGER from a BINARY_ARRAY
function "-"(one : BINARY_ARRAY; two : INTEGER) return BINARY_ARRAY is
   output_array : BINARY_ARRAY;
   converted_array : BINARY_ARRAY;
begin
   converted_array := Int_To_Bin(two);
   output_array := "-"(one, converted_array);
   return output_array;
end "-";

-- Reverses a BINARY_ARRAY
procedure Reverse_Bin_Arr(bin_array : BINARY_ARRAY) is
   output : BINARY_ARRAY;
begin
   for Index in 0..15 loop
      output(15 - Index) := bin_array(Index);
   end loop;
   Print_Bin_Arr(output);
end Reverse_Bin_Arr;

-- Prints a BINARY_ARRAY
procedure Print_Bin_Arr(bin_array : BINARY_ARRAY) is
   output : String := "                ";
begin
   for Index in 0..15 loop
      if bin_array(Index) = 1 then
         output(Index + 1) := '1';
      else
         output(Index + 1) := '0';
      end if;
   end loop;
   Put_Line(output);
end Print_Bin_Arr;

-- EXTRA FEATURES

-- Returns a BINARY_ARRAY with random values
function Random_Array return BINARY_ARRAY is
   package Random_Bit is new Ada.Numerics.Discrete_Random (BINARY_NUMBER);
   use Random_Bit;
   G : Generator;
   
   out_array : BINARY_ARRAY;
begin
   Reset (G);
   for Index in 0..15 loop
      out_array(Index) := Random(G); 
   end loop;
   return out_array;
end Random_Array;

function Compliment_Array(bin_array : BINARY_ARRAY) return BINARY_ARRAY is
   output : BINARY_ARRAY;
begin
   for Index in 0..15 loop
      if bin_array(Index) = 0 then
         output(Index) := 1;
      else
         output(Index) := 0;
      end if;
   end loop;
   return output;
end Compliment_Array;

end Bak0016;
