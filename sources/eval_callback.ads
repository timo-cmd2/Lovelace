with Envs;
with Types;

package Eval_Callback is

   type Eval_Func is access
     function (MH : Types.Lovelace_Handle; Env : Envs.Env_Handle) return Types.Lovelace_Handle;

   Eval : Eval_Func;

end Eval_Callback;
