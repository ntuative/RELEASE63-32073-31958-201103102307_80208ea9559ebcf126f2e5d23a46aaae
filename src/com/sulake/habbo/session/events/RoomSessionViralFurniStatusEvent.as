package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_489:String = "RSVFS_STATUS";
      
      public static const const_527:String = "RSVFS_RECEIVED";
       
      
      private var var_181:String;
      
      private var var_339:int;
      
      private var var_386:int = -1;
      
      private var _shareId:String;
      
      private var var_2111:String;
      
      private var var_2112:Boolean;
      
      private var var_1405:int = 0;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.var_386 = this.status;
         this._shareId = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
      
      public function get status() : int
      {
         return this.var_386;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2111;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2112;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1405;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_339 = param1;
      }
      
      public function set status(param1:int) : void
      {
         this.var_386 = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this._shareId = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2111 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2112 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1405 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_181;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_181 = param1;
      }
   }
}
