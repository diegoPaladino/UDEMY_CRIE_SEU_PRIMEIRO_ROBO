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
   int ind = 2;

   Print("Preço Abertura = ", velas[ind].open);
   Print("Preço Fechamento = ", velas[ind].close);
   Print("Preço Máxima = ", velas[ind].high);
   Print("Preço Mínima = ", velas[ind].low);
   
   Print("========================================");
  }
//+------------------------------------------------------------------+

   int ind = 0;
   
   string leg_tela = "Preço Abertura = "+ DoubleToString(velas[ind].open)+"\n"+
                     "Preço Fechamento = "+DoubleToString(velas[ind].close)+"\n"+
                     "Preço Max = "+DoubleToString(velas[ind].high)+"\n"+
                     "Preço Min = "+DoubleToString(velas[ind].low)+"\n\n"+
                     "Tempo = "+tick.time+"\n"+
                     "Volume = "+tick.volume;
