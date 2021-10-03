package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1562:String;
      
      private var var_1563:int;
      
      private var var_2106:Boolean;
      
      private var var_2109:Boolean;
      
      private var var_2108:int;
      
      private var var_2105:int;
      
      private var var_2104:int;
      
      private var var_2103:int;
      
      private var var_2107:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1562 = param1.readString();
         this.var_1563 = param1.readInteger();
         this.var_2106 = param1.readBoolean();
         this.var_2109 = param1.readBoolean();
         this.var_2108 = param1.readInteger();
         this.var_2105 = param1.readInteger();
         this.var_2104 = param1.readInteger();
         this.var_2103 = param1.readInteger();
         this.var_2107 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1562;
      }
      
      public function get price() : int
      {
         return this.var_1563;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2106;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2109;
      }
      
      public function get periods() : int
      {
         return this.var_2108;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2105;
      }
      
      public function get year() : int
      {
         return this.var_2104;
      }
      
      public function get month() : int
      {
         return this.var_2103;
      }
      
      public function get day() : int
      {
         return this.var_2107;
      }
   }
}
