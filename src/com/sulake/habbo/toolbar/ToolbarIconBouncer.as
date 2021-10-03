package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2232:Number;
      
      private var var_1666:Number;
      
      private var var_853:Number;
      
      private var var_854:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2232 = param1;
         this.var_1666 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_853 = param1;
         this.var_854 = 0;
      }
      
      public function update() : void
      {
         this.var_853 += this.var_1666;
         this.var_854 += this.var_853;
         if(this.var_854 > 0)
         {
            this.var_854 = 0;
            this.var_853 = this.var_2232 * -1 * this.var_853;
         }
      }
      
      public function get location() : Number
      {
         return this.var_854;
      }
   }
}
