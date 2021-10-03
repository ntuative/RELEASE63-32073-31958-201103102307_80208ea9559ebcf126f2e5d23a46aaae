package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2271:int;
      
      private var var_1342:String;
      
      private var _objId:int;
      
      private var var_1803:int;
      
      private var _category:int;
      
      private var var_2004:String;
      
      private var var_2270:Boolean;
      
      private var var_2267:Boolean;
      
      private var var_2269:Boolean;
      
      private var var_2272:Boolean;
      
      private var var_2268:int;
      
      private var var_1419:int;
      
      private var var_1943:String = "";
      
      private var var_2018:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2271 = param1;
         this.var_1342 = param2;
         this._objId = param3;
         this.var_1803 = param4;
         this._category = param5;
         this.var_2004 = param6;
         this.var_2270 = param7;
         this.var_2267 = param8;
         this.var_2269 = param9;
         this.var_2272 = param10;
         this.var_2268 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1943 = param1;
         this.var_1419 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2271;
      }
      
      public function get itemType() : String
      {
         return this.var_1342;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1803;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2004;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2270;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2267;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2269;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2272;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2268;
      }
      
      public function get slotId() : String
      {
         return this.var_1943;
      }
      
      public function get songId() : int
      {
         return this.var_2018;
      }
      
      public function get extra() : int
      {
         return this.var_1419;
      }
   }
}
