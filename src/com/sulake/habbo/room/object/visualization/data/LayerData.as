package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_851:String = "";
      
      public static const const_453:int = 0;
      
      public static const const_526:int = 255;
      
      public static const const_889:Boolean = false;
      
      public static const const_561:int = 0;
      
      public static const const_460:int = 0;
      
      public static const const_512:int = 0;
      
      public static const const_1144:int = 1;
      
      public static const const_1194:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2413:String = "";
      
      private var var_1641:int = 0;
      
      private var var_2074:int = 255;
      
      private var var_2635:Boolean = false;
      
      private var var_2638:int = 0;
      
      private var var_2636:int = 0;
      
      private var var_2637:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2413 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2413;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1641 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1641;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2074 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2074;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2635 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2635;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2638 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2638;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2636 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2636;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2637 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2637;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
