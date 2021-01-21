-- simple small package for the print stmt
package body Printer is

   function Pr_Str (M : Types.Lovelace_Handle) return String is
   begin
     if Types.Is_Null (M) then
        return "";
     else
        return Types.To_String (Types.Deref (M).all);
     end if;
   end Pr_Str;

end Printer;
