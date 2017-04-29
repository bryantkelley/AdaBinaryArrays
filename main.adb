with Ada.Text_IO, Ada.Integer_Text_IO, Bak0016;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is
   package Bryant is new Bak0016;
   use Bryant;

   Array_One : BINARY_ARRAY;
--   Array_Extra : BINARY_ARRAY; -- Compliment of One
   Int_One : INTEGER;
   Array_Two : BINARY_ARRAY;
   Array_Three : BINARY_ARRAY;
   Array_Four : BINARY_ARRAY;
   Array_Five : BINARY_ARRAY;
   Array_Six : BINARY_ARRAY;
begin
   Put_Line("Creating random Binary Array...");
   Array_One := Bryant.Random_Array;
   Put_Line("Printing random Binary Array...");
   Bryant.Print_Bin_Arr(Array_One);
   New_Line(1);

--   This function is used for subtracting.
--   Put_Line("Complimenting Array...");
--   Array_Extra := Bryant.Compliment_Array(Array_One);
--   Bryant.Print_Bin_Arr(Array_Extra);
--   New_Line(1);

   Put_Line("Converting to Integer...");
   Int_One := Bryant.Bin_To_Int(Array_One);
   Put(Int_One);   
   New_Line(1);
   New_Line(1);

   Put_Line("Converting Integer 15341 to Binary Array...");
   -- Cannot be greater than 65535 without data loss.
   -- Integer 15341 was randomly selected by dice roll.
   Array_Two := Bryant.Int_To_Bin(15341);
   Bryant.Print_Bin_Arr(Array_Two);
   New_Line(1);

   Put_Line("Adding the Second Array to the First Array...");
   Put_Line("Adding two arrays that sum to more than 65535 will lose information.");
   Array_Three := "+"(Array_One, Array_Two); 
   Bryant.Print_Bin_Arr(Array_Three);
   New_Line(1);

   Put_Line("Adding Integer 15341 to First Binary Array...");
   Put_Line("Adding two an array and integer that sum to more than 65535 will lose information.");
   Array_Five := "-"(Array_One, 15341);
   Bryant.Print_Bin_Arr(Array_Five);
   New_Line(1);

   Put_Line("Subtracting the Second Array from the First Array...");
   Put_Line("If the Second Array is larger than the First Array this result will be incorrect.");
   Array_Four := "-"(Array_One, Array_Two);
   Bryant.Print_Bin_Arr(Array_Four);
   New_Line(1);

   Put_Line("Subtracting the Integer 15341 from the First Array...");
   Put_Line("If the Second Array is larger than the First Array this result will be incorrect.");
   Array_Six := "-"(Array_One, 15341);
   Bryant.Print_Bin_Arr(Array_Six);
   New_Line(1);

   Put_Line("Reversing the Fourth Array...");
   Bryant.Reverse_Bin_Arr(Array_Four);
   New_Line(1);
end Main;
