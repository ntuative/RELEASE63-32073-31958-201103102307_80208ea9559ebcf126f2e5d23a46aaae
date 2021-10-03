package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2090:int;
      
      private var var_1342:String;
      
      private var var_2289:int;
      
      private var var_2290:int;
      
      private var _category:int;
      
      private var var_2004:String;
      
      private var var_1419:int;
      
      private var var_2291:int;
      
      private var var_2294:int;
      
      private var var_2292:int;
      
      private var var_2295:int;
      
      private var var_2293:Boolean;
      
      private var var_2849:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2090 = param1;
         this.var_1342 = param2;
         this.var_2289 = param3;
         this.var_2290 = param4;
         this._category = param5;
         this.var_2004 = param6;
         this.var_1419 = param7;
         this.var_2291 = param8;
         this.var_2294 = param9;
         this.var_2292 = param10;
         this.var_2295 = param11;
         this.var_2293 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2090;
      }
      
      public function get itemType() : String
      {
         return this.var_1342;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2289;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2290;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2004;
      }
      
      public function get extra() : int
      {
         return this.var_1419;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2291;
      }
      
      public function get creationDay() : int
      {
         return this.var_2294;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2292;
      }
      
      public function get creationYear() : int
      {
         return this.var_2295;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2293;
      }
      
      public function get songID() : int
      {
         return this.var_1419;
      }
   }
}
