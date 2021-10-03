package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2044:String;
      
      private var var_2046:int;
      
      private var var_2045:int;
      
      private var var_2047:String;
      
      private var var_2048:int;
      
      private var var_1807:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2044 = param1.readString();
         this.var_2046 = param1.readInteger();
         this.var_2045 = param1.readInteger();
         this.var_2047 = param1.readString();
         this.var_2048 = param1.readInteger();
         this.var_1807 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2044;
      }
      
      public function get unitPort() : int
      {
         return this.var_2046;
      }
      
      public function get worldId() : int
      {
         return this.var_2045;
      }
      
      public function get castLibs() : String
      {
         return this.var_2047;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2048;
      }
      
      public function get nodeId() : int
      {
         return this.var_1807;
      }
   }
}
