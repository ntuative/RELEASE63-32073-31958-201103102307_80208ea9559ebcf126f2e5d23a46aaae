package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1761:IID;
      
      private var var_665:Boolean;
      
      private var var_1143:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1761 = param1;
         this.var_1143 = new Array();
         this.var_665 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1761;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_665;
      }
      
      public function get receivers() : Array
      {
         return this.var_1143;
      }
      
      public function dispose() : void
      {
         if(!this.var_665)
         {
            this.var_665 = true;
            this.var_1761 = null;
            while(this.var_1143.length > 0)
            {
               this.var_1143.pop();
            }
            this.var_1143 = null;
         }
      }
   }
}
