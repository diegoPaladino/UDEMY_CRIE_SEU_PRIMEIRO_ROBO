//+------------------------------------------------------------------+
//|                                                 INDICADOR_EA.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
//---

int mm_Handle;
double mm_Buffer[];



//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(60);
//---

   mm_Handle = iMA(_Symbol,_Period,21,0,MODE_SMA,PRICE_CLOSE);
   
   if(mm_Handle < 0)
     {
      Alert("Erro ao carregar handle do indicador - ", GetLastError());
      return(-1);
     }
     
//---
ChartIndicatorAdd(0,0,mm_Handle);

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
   CopyBuffer(mm_Handle,0,0,3,mm_Buffer);
   
   ArraySetAsSeries(mm_Buffer,true);
   
   Print("Valor MM=", mm_Buffer[0]);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+
