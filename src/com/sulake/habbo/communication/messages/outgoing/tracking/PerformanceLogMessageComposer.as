package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2225:int = 0;
      
      private var var_1391:String = "";
      
      private var var_1757:String = "";
      
      private var var_2228:String = "";
      
      private var var_2224:String = "";
      
      private var var_1627:int = 0;
      
      private var var_2226:int = 0;
      
      private var var_2229:int = 0;
      
      private var var_1390:int = 0;
      
      private var var_2227:int = 0;
      
      private var var_1393:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2225 = param1;
         this.var_1391 = param2;
         this.var_1757 = param3;
         this.var_2228 = param4;
         this.var_2224 = param5;
         if(param6)
         {
            this.var_1627 = 1;
         }
         else
         {
            this.var_1627 = 0;
         }
         this.var_2226 = param7;
         this.var_2229 = param8;
         this.var_1390 = param9;
         this.var_2227 = param10;
         this.var_1393 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2225,this.var_1391,this.var_1757,this.var_2228,this.var_2224,this.var_1627,this.var_2226,this.var_2229,this.var_1390,this.var_2227,this.var_1393];
      }
   }
}
