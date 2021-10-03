package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1776:int;
      
      private var _name:String;
      
      private var var_1263:int;
      
      private var var_2600:int;
      
      private var var_2147:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_2599:int;
      
      private var var_2597:int;
      
      private var var_2598:int;
      
      private var var_2313:int;
      
      private var var_2093:int;
      
      private var _ownerName:String;
      
      private var var_481:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1776;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1263;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2600;
      }
      
      public function get experience() : int
      {
         return this.var_2147;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2599;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2597;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2598;
      }
      
      public function get respect() : int
      {
         return this.var_2313;
      }
      
      public function get ownerId() : int
      {
         return this.var_2093;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_481;
      }
      
      public function flush() : Boolean
      {
         this.var_1776 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1776 = param1.readInteger();
         this._name = param1.readString();
         this.var_1263 = param1.readInteger();
         this.var_2600 = param1.readInteger();
         this.var_2147 = param1.readInteger();
         this.var_2599 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2597 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2598 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2313 = param1.readInteger();
         this.var_2093 = param1.readInteger();
         this.var_481 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
