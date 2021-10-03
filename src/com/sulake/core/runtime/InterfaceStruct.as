package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1439:IID;
      
      private var var_1835:String;
      
      private var var_99:IUnknown;
      
      private var var_761:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1439 = param1;
         this.var_1835 = getQualifiedClassName(this.var_1439);
         this.var_99 = param2;
         this.var_761 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1439;
      }
      
      public function get iis() : String
      {
         return this.var_1835;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_99;
      }
      
      public function get references() : uint
      {
         return this.var_761;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_99 == null;
      }
      
      public function dispose() : void
      {
         this.var_1439 = null;
         this.var_1835 = null;
         this.var_99 = null;
         this.var_761 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_761;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_761) : uint(0);
      }
   }
}
