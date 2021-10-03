package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_2651:String = "";
      
      private var var_2516:Number = 1.0;
      
      private var _scale:Number = 1.0;
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         this.var_2651 = param1;
         this._scale = param2;
         this.var_2516 = param3;
      }
      
      public function get heightScale() : Number
      {
         return this.var_2516;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
   }
}
