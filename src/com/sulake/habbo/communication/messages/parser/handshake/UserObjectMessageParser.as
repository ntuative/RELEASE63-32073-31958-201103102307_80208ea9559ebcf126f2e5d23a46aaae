package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_864:String;
      
      private var var_2401:String;
      
      private var var_1696:String;
      
      private var var_2402:int;
      
      private var var_2398:String;
      
      private var var_2403:int;
      
      private var var_2399:int;
      
      private var var_2351:int;
      
      private var var_1192:int;
      
      private var var_766:int;
      
      private var var_2400:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_864 = param1.readString();
         this.var_2401 = param1.readString();
         this.var_1696 = param1.readString();
         this.var_2402 = param1.readInteger();
         this.var_2398 = param1.readString();
         this.var_2403 = param1.readInteger();
         this.var_2399 = param1.readInteger();
         this.var_2351 = param1.readInteger();
         this.var_1192 = param1.readInteger();
         this.var_766 = param1.readInteger();
         this.var_2400 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_864;
      }
      
      public function get customData() : String
      {
         return this.var_2401;
      }
      
      public function get realName() : String
      {
         return this.var_1696;
      }
      
      public function get tickets() : int
      {
         return this.var_2402;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2398;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2403;
      }
      
      public function get directMail() : int
      {
         return this.var_2399;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2351;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1192;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_766;
      }
      
      public function get identityId() : int
      {
         return this.var_2400;
      }
   }
}
