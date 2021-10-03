package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_2027:Boolean;
      
      protected var var_2023:Boolean;
      
      protected var var_2178:String;
      
      protected var var_2026:Boolean;
      
      protected var var_2024:Boolean;
      
      protected var var_2025:Boolean;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2788:Boolean;
      
      protected var var_2789:String;
      
      protected var var_2790:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_2027 = false;
         this.var_2023 = false;
         this.var_2178 = "";
         this.var_2026 = false;
         this.var_2024 = false;
         this.var_2025 = false;
         this._confPartnerIntegration = false;
         this.var_2788 = false;
         this.var_2789 = "";
         this.var_2790 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  this.var_2027 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  this.var_2023 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  this.var_2026 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  this.var_2024 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  this.var_2025 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get coppa() : Boolean
      {
         return this.var_2027;
      }
      
      public function get voucher() : Boolean
      {
         return this.var_2023;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return this.var_2026;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return this.var_2024;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return this.var_2025;
      }
      
      public function get date() : String
      {
         return this.var_2178;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return this._confPartnerIntegration;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return this.var_2788;
      }
      
      public function get tracking_header() : String
      {
         return this.var_2789;
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return this.var_2790;
      }
   }
}
