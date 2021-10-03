package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1871:String = "";
      
      private var var_1805:String = "";
      
      private var var_2162:String = "";
      
      private var var_2166:Number = 0;
      
      private var var_2164:Number = 0;
      
      private var var_2080:Number = 0;
      
      private var var_2078:Number = 0;
      
      private var var_2167:Boolean = false;
      
      private var var_2165:Boolean = false;
      
      private var var_2163:Boolean = false;
      
      private var var_2161:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1871 = param2;
         this.var_1805 = param3;
         this.var_2162 = param4;
         this.var_2166 = param5;
         this.var_2164 = param6;
         this.var_2080 = param7;
         this.var_2078 = param8;
         this.var_2167 = param9;
         this.var_2165 = param10;
         this.var_2163 = param11;
         this.var_2161 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1871;
      }
      
      public function get canvasId() : String
      {
         return this.var_1805;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2162;
      }
      
      public function get screenX() : Number
      {
         return this.var_2166;
      }
      
      public function get screenY() : Number
      {
         return this.var_2164;
      }
      
      public function get localX() : Number
      {
         return this.var_2080;
      }
      
      public function get localY() : Number
      {
         return this.var_2078;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2167;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2165;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2163;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2161;
      }
   }
}
