package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2669:String;
      
      private var var_1887:String;
      
      private var var_2670:String;
      
      private var var_1888:Boolean;
      
      private var var_1886:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2669 = String(param1["set-type"]);
         this.var_1887 = String(param1["flipped-set-type"]);
         this.var_2670 = String(param1["remove-set-type"]);
         this.var_1888 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1886 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1886;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1886 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2669;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1887;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2670;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1888;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1888 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1887 = param1;
      }
   }
}
