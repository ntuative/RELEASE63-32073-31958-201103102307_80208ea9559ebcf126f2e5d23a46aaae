package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2445:int;
      
      private var var_2443:int;
      
      private var var_2510:String;
      
      private var var_2509:int;
      
      private var var_2511:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2445 = param1;
         this.var_2443 = param2;
         this.var_2510 = param3;
         this.var_2509 = param4;
         this.var_2511 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2445,this.var_2443,this.var_2510,this.var_2509,int(this.var_2511)];
      }
      
      public function dispose() : void
      {
      }
   }
}
