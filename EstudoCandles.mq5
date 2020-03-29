//+------------------------------------------------------------------+
//|                                                EstudoCandles.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"




MqlRates velas[];


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(5);
   
   
   
   CopyRates(_Symbol,_Period,0,3,velas);
   
   ArraySetAsSeries(velas,TRUE);
   
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
   
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   Print("Preço Abertura = ", velas[0].open);
   Print("Preço Fechamento = ", velas[0].close);
   Print("Preço Máxima = ", velas[0].high);
   Print("Preço Mínima = ", velas[0].low);
   
   Print("========================================");
  }
//+------------------------------------------------------------------+

