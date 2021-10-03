package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2150:int;
      
      private var var_2154:int;
      
      private var var_721:Boolean;
      
      private var var_2153:int;
      
      private var var_2151:int;
      
      private var var_2149:int;
      
      private var var_2152:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2150 = param1.readInteger();
         this.var_2154 = param1.readInteger();
         this.var_721 = param1.readBoolean();
         this.var_2153 = param1.readInteger();
         this.var_2151 = param1.readInteger();
         this.var_2149 = param1.readInteger();
         this.var_2152 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2150;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2154;
      }
      
      public function get online() : Boolean
      {
         return this.var_721;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2153;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2151;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2149;
      }
      
      public function get banCount() : int
      {
         return this.var_2152;
      }
   }
}
