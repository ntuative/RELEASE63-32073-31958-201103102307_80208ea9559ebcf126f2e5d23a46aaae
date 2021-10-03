package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2145:int;
      
      private var var_1698:String;
      
      private var var_2356:String;
      
      private var var_2591:Boolean;
      
      private var var_2594:Boolean;
      
      private var var_2593:int;
      
      private var var_2357:String;
      
      private var var_2592:String;
      
      private var var_1696:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2145 = param1.readInteger();
         this.var_1698 = param1.readString();
         this.var_2356 = param1.readString();
         this.var_2591 = param1.readBoolean();
         this.var_2594 = param1.readBoolean();
         param1.readString();
         this.var_2593 = param1.readInteger();
         this.var_2357 = param1.readString();
         this.var_2592 = param1.readString();
         this.var_1696 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2145;
      }
      
      public function get avatarName() : String
      {
         return this.var_1698;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2356;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2591;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2594;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2593;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2357;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2592;
      }
      
      public function get realName() : String
      {
         return this.var_1696;
      }
   }
}
