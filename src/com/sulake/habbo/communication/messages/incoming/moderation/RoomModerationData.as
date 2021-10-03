package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_334:int;
      
      private var var_2091:int;
      
      private var var_2092:Boolean;
      
      private var var_2093:int;
      
      private var _ownerName:String;
      
      private var var_115:RoomData;
      
      private var var_693:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_334 = param1.readInteger();
         this.var_2091 = param1.readInteger();
         this.var_2092 = param1.readBoolean();
         this.var_2093 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_115 = new RoomData(param1);
         this.var_693 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_115 != null)
         {
            this.var_115.dispose();
            this.var_115 = null;
         }
         if(this.var_693 != null)
         {
            this.var_693.dispose();
            this.var_693 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_334;
      }
      
      public function get userCount() : int
      {
         return this.var_2091;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2092;
      }
      
      public function get ownerId() : int
      {
         return this.var_2093;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_115;
      }
      
      public function get event() : RoomData
      {
         return this.var_693;
      }
   }
}
