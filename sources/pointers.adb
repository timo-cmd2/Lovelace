with Ada.Unchecked_Deallocation;

package body pointers is

   function New_Ptr (Base_Class : Base_Class_Accessor) return pointer is
   begin
      return pointer'
         (Ada.Finalization.Controlled with Pointer => Base_Class);
   end New_Ptr;

   function Deref (Ptr : pointer) return Base_Class_Accessor is
   begin
      return Ptr.Pointer;
   end Deref;

   overriding procedure Adjust (Object : in out pointer) is
   begin
      if Object.Pointer /= null then
         Object.Pointer.Ref_Count := Object.Pointer.Ref_Count + 1;
      end if;
   end Adjust;

   procedure Free is new Ada.Unchecked_Deallocation (Base_Class'Class, Base_Class_Accessor);

   overriding procedure Finalize (Object : in out pointer) is
   begin
      if Object.Pointer /= null then
         if Object.Pointer.Ref_Count > 0 then
            Object.Pointer.Ref_Count := Object.Pointer.Ref_Count - 1;
            if Object.Pointer.Ref_Count = 0 then
               Free (Object.Pointer);
            end if;
         end if;
      end if;
   end Finalize;

   function Is_Null (Ptr : pinter) return Boolean is
   begin
      return Ptr = Null_pointer;
   end Is_Null;

end pointers;
