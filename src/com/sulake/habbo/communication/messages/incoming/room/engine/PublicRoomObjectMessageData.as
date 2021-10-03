package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var _name:String = "";
      
      private var _type:String = "";
      
      private var _x:Number = 0;
      
      private var var_153:Number = 0;
      
      private var var_152:Number = 0;
      
      private var var_258:int = 0;
      
      private var var_455:int = 0;
      
      private var var_544:int = 0;
      
      private var var_186:Boolean = false;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function setReadOnly() : void
      {
         this.var_186 = true;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this.var_186)
         {
            this._type = param1;
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
      
      public function get sizeX() : int
      {
         return this.var_455;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_186)
         {
            this.var_455 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_544;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_186)
         {
            this.var_544 = param1;
         }
      }
   }
}
