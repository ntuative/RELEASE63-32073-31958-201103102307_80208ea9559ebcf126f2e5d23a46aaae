package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_142:String = "hex";
      
      public static const const_41:String = "int";
      
      public static const const_229:String = "uint";
      
      public static const const_227:String = "Number";
      
      public static const const_38:String = "Boolean";
      
      public static const const_55:String = "String";
      
      public static const const_252:String = "Point";
      
      public static const const_259:String = "Rectangle";
      
      public static const const_151:String = "Array";
      
      public static const const_215:String = "Map";
       
      
      private var var_563:String;
      
      private var var_173:Object;
      
      private var _type:String;
      
      private var var_2190:Boolean;
      
      private var var_2797:Boolean;
      
      private var var_2191:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_563 = param1;
         this.var_173 = param2;
         this._type = param3;
         this.var_2190 = param4;
         this.var_2797 = param3 == const_215 || param3 == const_151 || param3 == const_252 || param3 == const_259;
         this.var_2191 = param5;
      }
      
      public function get key() : String
      {
         return this.var_563;
      }
      
      public function get value() : Object
      {
         return this.var_173;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2190;
      }
      
      public function get range() : Array
      {
         return this.var_2191;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_142:
               return "0x" + uint(this.var_173).toString(16);
            case const_38:
               return Boolean(this.var_173) == true ? "true" : "false";
            case const_252:
               return "Point(" + Point(this.var_173).x + ", " + Point(this.var_173).y + ")";
            case const_259:
               return "Rectangle(" + Rectangle(this.var_173).x + ", " + Rectangle(this.var_173).y + ", " + Rectangle(this.var_173).width + ", " + Rectangle(this.var_173).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_215:
               _loc3_ = this.var_173 as Map;
               _loc1_ = "<var key=\"" + this.var_563 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_151:
               _loc4_ = this.var_173 as Array;
               _loc1_ = "<var key=\"" + this.var_563 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_252:
               _loc5_ = this.var_173 as Point;
               _loc1_ = "<var key=\"" + this.var_563 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_259:
               _loc6_ = this.var_173 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_563 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_142:
               _loc1_ = "<var key=\"" + this.var_563 + "\" value=\"" + "0x" + uint(this.var_173).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_563 + "\" value=\"" + this.var_173 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
