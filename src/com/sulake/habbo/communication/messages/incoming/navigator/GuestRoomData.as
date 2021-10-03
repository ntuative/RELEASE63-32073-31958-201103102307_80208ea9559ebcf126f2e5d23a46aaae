package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_334:int;
      
      private var var_693:Boolean;
      
      private var var_904:String;
      
      private var _ownerName:String;
      
      private var var_2196:int;
      
      private var var_2091:int;
      
      private var var_2200:int;
      
      private var var_1568:String;
      
      private var var_2199:int;
      
      private var var_2195:Boolean;
      
      private var var_768:int;
      
      private var var_1416:int;
      
      private var var_2198:String;
      
      private var var_816:Array;
      
      private var var_2197:RoomThumbnailData;
      
      private var var_2194:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_816 = new Array();
         super();
         this.var_334 = param1.readInteger();
         this.var_693 = param1.readBoolean();
         this.var_904 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2196 = param1.readInteger();
         this.var_2091 = param1.readInteger();
         this.var_2200 = param1.readInteger();
         this.var_1568 = param1.readString();
         this.var_2199 = param1.readInteger();
         this.var_2195 = param1.readBoolean();
         this.var_768 = param1.readInteger();
         this.var_1416 = param1.readInteger();
         this.var_2198 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_816.push(_loc4_);
            _loc3_++;
         }
         this.var_2197 = new RoomThumbnailData(param1);
         this.var_2194 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_816 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_334;
      }
      
      public function get event() : Boolean
      {
         return this.var_693;
      }
      
      public function get roomName() : String
      {
         return this.var_904;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2196;
      }
      
      public function get userCount() : int
      {
         return this.var_2091;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2200;
      }
      
      public function get description() : String
      {
         return this.var_1568;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2199;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2195;
      }
      
      public function get score() : int
      {
         return this.var_768;
      }
      
      public function get categoryId() : int
      {
         return this.var_1416;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2198;
      }
      
      public function get tags() : Array
      {
         return this.var_816;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2197;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2194;
      }
   }
}
