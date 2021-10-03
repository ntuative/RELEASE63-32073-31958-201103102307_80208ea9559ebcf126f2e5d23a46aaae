package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_181:String;
      
      private var var_339:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1405:int = 0;
      
      private var var_386:int;
      
      private var _shareId:String;
      
      private var var_2111:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_181;
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1405;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_386;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2111;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_181 = param1.readString();
         this.var_339 = param1.readInteger();
         this.var_386 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2111 = param1.readString();
         this.var_1405 = param1.readInteger();
         return true;
      }
   }
}
