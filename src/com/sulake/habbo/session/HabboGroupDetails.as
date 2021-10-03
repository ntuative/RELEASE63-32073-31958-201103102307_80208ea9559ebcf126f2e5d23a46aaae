package com.sulake.habbo.session
{
   public class HabboGroupDetails
   {
       
      
      private var _id:int = -1;
      
      private var var_282:String = "";
      
      private var _name:String = "";
      
      private var var_1568:String = "";
      
      private var _roomId:int = -1;
      
      private var var_904:String = "";
      
      public function HabboGroupDetails(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function dispose() : void
      {
         this._id = -1;
         this.var_282 = "";
         this._name = "";
         this.var_1568 = "";
         this._roomId = -1;
         this.var_904 = "";
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_282;
      }
      
      public function set badgeId(param1:String) : void
      {
         this.var_282 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1568;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1568 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get roomName() : String
      {
         return this.var_904;
      }
      
      public function set roomName(param1:String) : void
      {
         this.var_904 = param1;
      }
   }
}
