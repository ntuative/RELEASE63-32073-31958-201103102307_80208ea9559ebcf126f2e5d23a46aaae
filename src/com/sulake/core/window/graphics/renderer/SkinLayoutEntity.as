package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_557:uint = 0;
      
      public static const const_294:uint = 1;
      
      public static const const_443:uint = 2;
      
      public static const const_301:uint = 4;
      
      public static const const_1195:uint = 8;
       
      
      private var _id:uint;
      
      private var _name:String;
      
      private var var_816:Array;
      
      private var _color:uint;
      
      private var var_707:uint;
      
      private var var_2377:uint;
      
      private var var_2376:uint;
      
      private var _region:Rectangle;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._region = param3;
         this._color = param4;
         this.var_707 = param5;
         this.var_2377 = param6;
         this.var_2376 = param7;
         this.var_816 = new Array();
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get tags() : Array
      {
         return this.var_816;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get blend() : uint
      {
         return this.var_707;
      }
      
      public function get region() : Rectangle
      {
         return this._region;
      }
      
      public function get scaleH() : uint
      {
         return this.var_2377;
      }
      
      public function get scaleV() : uint
      {
         return this.var_2376;
      }
      
      public function dispose() : void
      {
         this._region = null;
         this.var_816 = null;
      }
   }
}
