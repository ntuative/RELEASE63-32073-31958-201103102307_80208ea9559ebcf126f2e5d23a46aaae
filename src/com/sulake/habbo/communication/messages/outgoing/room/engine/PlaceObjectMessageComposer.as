package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_339:int;
      
      private var var_2050:int;
      
      private var var_2634:String;
      
      private var _x:int = 0;
      
      private var var_153:int = 0;
      
      private var var_258:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         this.var_339 = param1;
         this.var_2050 = param2;
         this.var_2634 = param3;
         this._x = param4;
         this.var_153 = param5;
         this.var_258 = param6;
         this._roomId = param7;
         this._roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(this.var_2050)
         {
            case RoomObjectCategoryEnum.const_30:
               return [this.var_339 + " " + this._x + " " + this.var_153 + " " + this.var_258];
            case RoomObjectCategoryEnum.const_27:
               return [this.var_339 + " " + this.var_2634];
            default:
               return [];
         }
      }
   }
}
