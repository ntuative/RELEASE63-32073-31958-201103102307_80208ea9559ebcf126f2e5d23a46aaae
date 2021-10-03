package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1262:IHabboTracking;
      
      private var var_1530:Boolean = false;
      
      private var var_2716:int = 0;
      
      private var var_1921:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1262 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1262 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1530 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2716 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1530)
         {
            return;
         }
         ++this.var_1921;
         if(this.var_1921 <= this.var_2716)
         {
            this.var_1262.track("toolbar",param1);
         }
      }
   }
}
