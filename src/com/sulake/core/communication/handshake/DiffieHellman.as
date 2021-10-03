package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_928:BigInteger;
      
      private var var_2733:BigInteger;
      
      private var var_1944:BigInteger;
      
      private var var_2734:BigInteger;
      
      private var var_1496:BigInteger;
      
      private var var_1945:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1496 = param1;
         this.var_1945 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1496.toString() + ",generator: " + this.var_1945.toString() + ",secret: " + param1);
         this.var_928 = new BigInteger();
         this.var_928.fromRadix(param1,param2);
         this.var_2733 = this.var_1945.modPow(this.var_928,this.var_1496);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1944 = new BigInteger();
         this.var_1944.fromRadix(param1,param2);
         this.var_2734 = this.var_1944.modPow(this.var_928,this.var_1496);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2733.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2734.toRadix(param1);
      }
   }
}
