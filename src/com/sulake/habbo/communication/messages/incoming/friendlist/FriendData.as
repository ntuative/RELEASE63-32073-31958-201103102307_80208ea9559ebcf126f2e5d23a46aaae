package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_990:int;
      
      private var var_721:Boolean;
      
      private var var_1846:Boolean;
      
      private var _figure:String;
      
      private var var_1416:int;
      
      private var var_1845:String;
      
      private var var_1697:String;
      
      private var var_1696:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_990 = param1.readInteger();
         this.var_721 = param1.readBoolean();
         this.var_1846 = param1.readBoolean();
         this._figure = param1.readString();
         this.var_1416 = param1.readInteger();
         this.var_1845 = param1.readString();
         this.var_1697 = param1.readString();
         this.var_1696 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_990;
      }
      
      public function get online() : Boolean
      {
         return this.var_721;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1846;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get categoryId() : int
      {
         return this.var_1416;
      }
      
      public function get motto() : String
      {
         return this.var_1845;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1697;
      }
      
      public function get realName() : String
      {
         return this.var_1696;
      }
   }
}
