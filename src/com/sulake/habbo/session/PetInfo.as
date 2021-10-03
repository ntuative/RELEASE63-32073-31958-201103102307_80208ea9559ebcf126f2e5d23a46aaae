package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1776:int;
      
      private var var_1263:int;
      
      private var var_2314:int;
      
      private var var_2147:int;
      
      private var var_2315:int;
      
      private var _energy:int;
      
      private var var_2311:int;
      
      private var _nutrition:int;
      
      private var var_2312:int;
      
      private var var_2093:int;
      
      private var _ownerName:String;
      
      private var var_2313:int;
      
      private var var_481:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1776;
      }
      
      public function get level() : int
      {
         return this.var_1263;
      }
      
      public function get levelMax() : int
      {
         return this.var_2314;
      }
      
      public function get experience() : int
      {
         return this.var_2147;
      }
      
      public function get method_1() : int
      {
         return this.var_2315;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2311;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2312;
      }
      
      public function get ownerId() : int
      {
         return this.var_2093;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2313;
      }
      
      public function get age() : int
      {
         return this.var_481;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1776 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1263 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2314 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2147 = param1;
      }
      
      public function set method_1(param1:int) : void
      {
         this.var_2315 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2311 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2312 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2093 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2313 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_481 = param1;
      }
   }
}
