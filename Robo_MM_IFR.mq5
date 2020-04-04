//+------------------------------------------------------------------+
//|                                                  Robo_MM_IFR.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
//---

enum ESTRATEGIA_ENTRADA
  {
   APENAS_MM,
   APENAS_IRF,
   MM_E_IFR
  };
  
  //---

// Variáveis Input
sinput string s0; //--------------Estratégia de Entrada-----------------
input ESTRATEGIA_ENTRADA estrategia    = APENAS_MM;   // Estratégia de Entrada Trader

sinput string s1; //--------------Médias Móveis-----------------
input int mm_rapida_periodo               = 12;             // Período Média Rápida
input int mm_lenta_periodo                = 32;             // Período Média Lenta
input ENUM_TIMEFRAMES mm_tempo_grafico    = PERIOD_CURRENT; // Tempo Gráfico
input ENUM_MA_METHOD mm_metodo            = MODE_EMA;       // Método
input ENUM_APPLIED_PRICE mm_preco         = PRICE_CLOSE;    // Preço Aplicado

sinput string s2; //--------------IFR-----------------
input int ifr_periodo                     = 5;              // Periodo IFR
input ENUM_TIMEFRAMES ifr_tempo_grafico   = PERIOD_CURRENT; // Tempo Gráfico
input ENUM_APPLIED_PRICE ifr_preco        = PRICE_CLOSE;    // Preço Aplicado

input int ifr_sobrecompra                 = 70;             // Nível de Sobrecompra
input int ifr_sobrevenda                  = 30;             // Nível de Sobrevenda

sinput string s3; //-------------------------------
input int num_lots                        = 100;            // Número de Lotes
input double TK                           = 60;             // Take Profit
input double SL                           = 30;             // Stop Loss

sinput string s4; //-------------------------------
input string hora_limite_fecha_op         = "17:40";        // Horário Limite Fechar Posição


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
