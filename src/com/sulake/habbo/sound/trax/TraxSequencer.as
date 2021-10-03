package com.sulake.habbo.sound.trax
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Timer;
   
   public class TraxSequencer implements IHabboSound
   {
      
      private static const const_274:uint = 8192;
      
      private static const const_1298:uint = 88200;
      
      private static const const_1297:uint = 88200;
       
      
      private var var_101:Vector.<Number> = null;
      
      private var _events:IEventDispatcher;
      
      private var _volume:Number;
      
      private var var_1109:Sound;
      
      private var _soundChannel:SoundChannel;
      
      private var var_1706:TraxData;
      
      private var var_1704:Map;
      
      private var var_1002:Boolean;
      
      private var var_2018:int;
      
      private var var_216:uint;
      
      private var var_723:Array;
      
      private var var_1705:Boolean;
      
      private var var_881:Boolean;
      
      private var _length:uint;
      
      private var var_1367:uint;
      
      private var var_1110:Boolean;
      
      private var var_1108:Boolean;
      
      private var var_880:int;
      
      private var var_724:int;
      
      private var var_883:int;
      
      private var var_882:int;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1367 = uint(const_274 / 44.1);
         super();
         this._events = param4;
         this.var_2018 = param1;
         this._volume = 1;
         this.var_1109 = new Sound();
         this._soundChannel = null;
         this.var_1704 = param3;
         this.var_1706 = param2;
         this.var_1704 = param3;
         this.var_1002 = true;
         this.var_216 = 0;
         this.var_723 = [];
         this.var_1705 = false;
         this._length = 0;
         this.var_881 = false;
         this.var_1110 = false;
         this.var_1108 = false;
         this.var_880 = 0;
         this.var_724 = 0;
         this.var_883 = 0;
         this.var_882 = 0;
         this.var_101 = new Vector.<Number>(const_274,true);
      }
      
      public function set position(param1:Number) : void
      {
         this.var_216 = uint(param1 * 44100);
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function get position() : Number
      {
         return this.var_216 / 44100;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1002;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1002 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_881;
      }
      
      public function get fadeOut() : Number
      {
         return this.var_724 / 44100;
      }
      
      public function set fadeOut(param1:Number) : void
      {
         this.var_724 = int(param1 * 44100);
      }
      
      public function get fadeIn() : Number
      {
         return this.var_880 / 44100;
      }
      
      public function set fadeIn(param1:Number) : void
      {
         this.var_880 = int(param1 * 44100);
      }
      
      public function play() : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         if(this._soundChannel != null)
         {
            this.stop();
         }
         if(this.var_880 > 0)
         {
            this.var_1110 = true;
            this.var_883 = 0;
         }
         this.var_1108 = false;
         this.var_881 = false;
         this.var_1109.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this._soundChannel = this.var_1109.play();
         return true;
      }
      
      private function prepare() : Boolean
      {
         if(!this.var_1002)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_1705)
         {
            if(!this.prepareSequence())
            {
               Logger.log("Cannot start playback, prepare sequence failed!");
               return false;
            }
         }
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_881)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         var _loc1_:* = null;
         if(this.var_724 > 0)
         {
            this.var_1108 = true;
            this.var_882 = 0;
            _loc1_ = new Timer(this.var_1367 + this.var_724 / 44.1,1);
            _loc1_.start();
            _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
         else
         {
            if(this._soundChannel != null)
            {
               this._soundChannel.stop();
            }
            this.var_1109.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
            this._soundChannel = null;
         }
         return true;
      }
      
      public function set volume(param1:Number) : void
      {
         this._volume = param1;
         if(this._soundChannel != null)
         {
            this._soundChannel.soundTransform = new SoundTransform(this._volume);
         }
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      private function getSampleBars(param1:uint) : int
      {
         return Math.ceil(param1 / const_1298);
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1706.channels.length)
         {
            _loc2_ = new Map();
            _loc3_ = this.var_1706.channels[_loc1_] as TraxChannel;
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc3_.itemCount)
            {
               _loc7_ = _loc3_.getItem(_loc6_).id;
               _loc8_ = this.var_1704.getValue(_loc7_) as TraxSample;
               if(_loc8_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc9_ = this.getSampleBars(_loc8_.length);
               _loc10_ = _loc3_.getItem(_loc6_).length / _loc9_;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  if(_loc7_ != 0)
                  {
                     _loc2_.add(_loc4_,_loc8_);
                  }
                  _loc5_ += _loc9_;
                  _loc4_ = uint(_loc5_ * const_1297);
                  _loc11_++;
               }
               if(this._length < _loc4_)
               {
                  this._length = _loc4_;
               }
               _loc6_++;
               return false;
            }
            this.var_723.push(_loc2_);
            _loc1_++;
         }
         this.var_1705 = true;
         return true;
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:Number = NaN;
         var _loc23_:int = 0;
         var _loc24_:Number = NaN;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc2_:* = [];
         var _loc3_:* = [];
         var _loc4_:* = [];
         var _loc5_:* = null;
         var _loc6_:int = this.var_723.length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc2_.push(this.var_723[_loc7_].getKeys());
            _loc11_ = 0;
            while(_loc11_ < _loc2_[_loc7_].length && _loc2_[_loc7_][_loc11_] < this.var_216)
            {
               _loc11_++;
            }
            if(_loc11_ > 0)
            {
               _loc11_--;
               _loc4_.push(_loc11_);
            }
            else
            {
               _loc4_.push(-1);
            }
            _loc12_ = this.var_723[_loc7_].getWithIndex(_loc11_);
            _loc13_ = this.var_216 - _loc2_[_loc7_][_loc11_];
            if(_loc12_ == null)
            {
               _loc3_.push(null);
            }
            else if(_loc12_.id == 0 || _loc13_ < 0)
            {
               _loc3_.push(null);
            }
            else
            {
               _loc5_ = new TraxChannelSample(_loc12_,_loc13_);
               _loc3_.push(_loc5_);
            }
            _loc7_++;
         }
         _loc7_ = _loc6_ - 1;
         while(_loc7_ >= 0)
         {
            _loc5_ = _loc3_[_loc7_] as TraxChannelSample;
            _loc14_ = _loc2_[_loc7_] as Array;
            _loc15_ = _loc4_[_loc7_];
            _loc16_ = const_274;
            if(this._length - this.var_216 < _loc16_)
            {
               _loc16_ = this._length - this.var_216;
            }
            _loc17_ = 0;
            while(_loc17_ < _loc16_)
            {
               _loc18_ = _loc16_;
               if(_loc15_ < _loc14_.length - 1)
               {
                  if(_loc16_ + this.var_216 >= _loc14_[_loc15_ + 1])
                  {
                     _loc18_ = _loc14_[_loc15_ + 1] - this.var_216;
                  }
               }
               if(_loc16_ - _loc17_ < _loc18_)
               {
                  _loc18_ = _loc16_ - _loc17_;
               }
               _loc19_ = 0;
               if(_loc7_ == _loc6_ - 1)
               {
                  if(_loc5_ != null)
                  {
                     _loc5_.setSample(this.var_101,_loc17_,_loc18_);
                     _loc17_ += _loc18_;
                  }
                  else
                  {
                     _loc19_ = 0;
                     while(_loc19_ < _loc18_)
                     {
                        var _loc27_:*;
                        this.var_101[_loc27_ = _loc17_++] = 0;
                        _loc19_++;
                     }
                  }
               }
               else
               {
                  if(_loc5_ != null)
                  {
                     _loc5_.addSample(this.var_101,_loc17_,_loc18_);
                  }
                  _loc17_ += _loc18_;
               }
               if(_loc17_ < _loc16_)
               {
                  if(_loc15_ < this.var_723[_loc7_].length - 1)
                  {
                     _loc20_ = this.var_723[_loc7_].getWithIndex(++_loc15_);
                     if(_loc20_.id == 0)
                     {
                        _loc5_ = null;
                     }
                     else
                     {
                        _loc5_ = new TraxChannelSample(_loc20_,0);
                     }
                  }
                  else
                  {
                     _loc5_ = null;
                  }
               }
            }
            _loc7_--;
         }
         var _loc8_:* = 0;
         var _loc9_:int = const_274;
         if(this._length - this.var_216 < _loc9_)
         {
            _loc9_ = this._length - this.var_216;
            if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
         }
         if(!this.var_1110 && !this.var_1108)
         {
            _loc21_ = 0;
            while(_loc21_ < _loc9_)
            {
               _loc8_ = Number(this.var_101[_loc21_] * this.volume);
               param1.data.writeFloat(_loc8_);
               param1.data.writeFloat(_loc8_);
               _loc21_++;
            }
         }
         else if(this.var_1110)
         {
            _loc23_ = 0;
            while(_loc23_ < _loc9_)
            {
               _loc22_ = Math.min(this.var_883 / Number(this.var_880),1);
               ++this.var_883;
               _loc8_ = Number(this.var_101[_loc23_] * this.volume * _loc22_);
               param1.data.writeFloat(_loc8_);
               param1.data.writeFloat(_loc8_);
               _loc23_++;
            }
            if(this.var_883 > this.var_880)
            {
               this.var_1110 = false;
            }
         }
         else
         {
            _loc25_ = 0;
            while(_loc25_ < _loc9_)
            {
               _loc24_ = Math.max(1 - this.var_882 / Number(this.var_724),0);
               ++this.var_882;
               _loc8_ = Number(this.var_101[_loc25_] * this.volume * _loc24_);
               param1.data.writeFloat(_loc8_);
               param1.data.writeFloat(_loc8_);
               _loc25_++;
            }
            if(this.var_882 > this.var_724)
            {
               this.var_1108 = false;
            }
         }
         var _loc10_:int = _loc9_;
         while(_loc10_ < const_274)
         {
            _loc8_ = 0;
            param1.data.writeFloat(_loc8_);
            param1.data.writeFloat(_loc8_);
            _loc10_++;
         }
         this.var_216 += const_274;
         if(this._soundChannel != null)
         {
            this.var_1367 = param1.position / 44.1 - this._soundChannel.position;
         }
         if(this.var_216 > this._length + this.var_1367 * 44.1 && !this.var_881)
         {
            this.var_881 = true;
            _loc26_ = new Timer(2,1);
            _loc26_.start();
            _loc26_.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         }
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.stop();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.const_874,this.var_2018));
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         if(this._soundChannel != null)
         {
            this._soundChannel.stop();
         }
         this.var_1109.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this._soundChannel = null;
      }
   }
}
