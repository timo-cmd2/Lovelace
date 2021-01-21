with Types;

package Reader is

   -- This is the Scanner/Parser (returns an AST)
   function Read_Str (S : String) return Types.Scanner_Handle;

private

   procedure Lex_Init (S : String);

   function Read_Form return Types.Scanner_Handle;

end Reader;
