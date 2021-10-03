package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_541:String = "RWTDUE_TEASER_DATA";
      
      public static const const_617:String = "RWTDUE_GIFT_DATA";
      
      public static const const_695:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_339:int;
      
      private var _data:String;
      
      private var var_386:int;
      
      private var var_181:String;
      
      private var var_2111:String;
      
      private var var_2112:Boolean;
      
      private var var_1405:int = 0;
      
      private var var_2648:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_386;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2111;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2112;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2648;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1405;
      }
      
      public function set status(param1:int) : void
      {
         this.var_386 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2111 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2112 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2648 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_339 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_181;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_181 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1405 = param1;
      }
   }
}
