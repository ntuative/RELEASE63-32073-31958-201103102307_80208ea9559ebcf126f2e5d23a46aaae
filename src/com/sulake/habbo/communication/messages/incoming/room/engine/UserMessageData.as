package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1138:String = "M";
      
      public static const const_1586:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_153:Number = 0;
      
      private var var_152:Number = 0;
      
      private var var_258:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_864:String = "";
      
      private var _figure:String = "";
      
      private var var_2202:String = "";
      
      private var var_2176:int;
      
      private var var_2205:int = 0;
      
      private var var_2201:String = "";
      
      private var var_2204:int = 0;
      
      private var var_2203:int = 0;
      
      private var var_2727:String = "";
      
      private var var_186:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_186 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_186)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_153;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_186)
         {
            this.var_153 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_152;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_186)
         {
            this.var_152 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_258;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_186)
         {
            this.var_258 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_186)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_186)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_864;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_186)
         {
            this.var_864 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_186)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2202;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_186)
         {
            this.var_2202 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2176;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_186)
         {
            this.var_2176 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2205;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_186)
         {
            this.var_2205 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2201;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_186)
         {
            this.var_2201 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2204;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_186)
         {
            this.var_2204 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2203;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_186)
         {
            this.var_2203 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2727;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_186)
         {
            this.var_2727 = param1;
         }
      }
   }
}
