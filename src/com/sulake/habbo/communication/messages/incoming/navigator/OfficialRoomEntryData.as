package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1171:int = 1;
      
      public static const const_824:int = 2;
      
      public static const const_858:int = 3;
      
      public static const const_1542:int = 4;
       
      
      private var _index:int;
      
      private var var_2499:String;
      
      private var var_2497:String;
      
      private var var_2498:Boolean;
      
      private var var_2500:String;
      
      private var var_898:String;
      
      private var var_2496:int;
      
      private var var_2091:int;
      
      private var _type:int;
      
      private var var_2413:String;
      
      private var var_921:GuestRoomData;
      
      private var var_920:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2499 = param1.readString();
         this.var_2497 = param1.readString();
         this.var_2498 = param1.readInteger() == 1;
         this.var_2500 = param1.readString();
         this.var_898 = param1.readString();
         this.var_2496 = param1.readInteger();
         this.var_2091 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1171)
         {
            this.var_2413 = param1.readString();
         }
         else if(this._type == const_858)
         {
            this.var_920 = new PublicRoomData(param1);
         }
         else if(this._type == const_824)
         {
            this.var_921 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_921 != null)
         {
            this.var_921.dispose();
            this.var_921 = null;
         }
         if(this.var_920 != null)
         {
            this.var_920.dispose();
            this.var_920 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2499;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2497;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2498;
      }
      
      public function get picText() : String
      {
         return this.var_2500;
      }
      
      public function get picRef() : String
      {
         return this.var_898;
      }
      
      public function get folderId() : int
      {
         return this.var_2496;
      }
      
      public function get tag() : String
      {
         return this.var_2413;
      }
      
      public function get userCount() : int
      {
         return this.var_2091;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_921;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_920;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1171)
         {
            return 0;
         }
         if(this.type == const_824)
         {
            return this.var_921.maxUserCount;
         }
         if(this.type == const_858)
         {
            return this.var_920.maxUsers;
         }
         return 0;
      }
   }
}
