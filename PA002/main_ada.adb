with Ada.Text_IO; use Ada.Text_IO;

--  Main
procedure main_ada is
   --  Set A to false to see if it skips
   A : Boolean := False;

   -- Function that prints a string when we don't have short-circuit evaluation. 
   function print_answer return Boolean is
   begin
      Put_Line("We DO NOT have short-circuit evaluation!");
      return True;
   end print_answer;

begin
   --  If they are both true print that they are both true
   --  Else print a string to helpdetermine if w have short circuit evaluation. 
   if A and print_answer then
      Put_Line("Both A and B are true");
   else
      Put_Line("If you only see this then we DO have short circuit evaluation");
   end if;
end main_ada;
