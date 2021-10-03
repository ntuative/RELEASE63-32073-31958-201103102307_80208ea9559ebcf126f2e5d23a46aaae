package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1521:int;
      
      private var var_2041:int;
      
      private var var_1015:int;
      
      private var var_488:Number;
      
      private var var_2042:Boolean;
      
      private var var_2043:int;
      
      private var var_1522:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2041 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2043 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2042 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1015;
         if(this.var_1015 == 1)
         {
            this.var_488 = param1;
            this.var_1521 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1015);
            this.var_488 = this.var_488 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2042 && param3 - this.var_1521 >= this.var_2041 && this.var_1522 < this.var_2043)
         {
            _loc5_ = 1000 / this.var_488;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1522;
            this.var_1521 = param3;
            this.var_1015 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
