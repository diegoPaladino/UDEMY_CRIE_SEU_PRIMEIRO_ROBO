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
//---
//+------------------------------------------------------------------+
//|  Variáveis para os indicadores                                   |
//+------------------------------------------------------------------+
//--- Médias Móveis
// RÁPIDA - menor período
int mm_rapida_Handle;      // Handle controlador da média móvel rápida
double mm_rapida_Buffer[]; // Buffer para armazenamento dos dados das médias

// LENTA - maior período
int mm_lenta_Handle;      // Handle controlador da média móvel lenta
double mm_lenta_Buffer[]; // Buffer para armazenamento dos dados das médias

//--- IFR
int ifr_Handle;           // Handle controlador para o IFR
double ifr_Buffer[];      // Buffer para armazenamento dos dados do IFR

//+------------------------------------------------------------------+
//| Variáveis para as funçoes                                        |
//+------------------------------------------------------------------+

int magic_number = 123456;   // Nº mágico do robô

MqlRates velas[];            // Variável para armazenar velas
MqlTick tick;                // variável para armazenar ticks 




//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   mm_rapida_Handle  = iMA(_Symbol,mm_tempo_grafico,mm_rapida_periodo,0,mm_metodo,mm_preco);
   mm_lenta_Handle   = iMA(_Symbol,mm_tempo_grafico,mm_lenta_periodo,0,mm_metodo,mm_preco);
   
   ifr_Handle - iRSI(_Symbol,ifr_tempo_grafico,ifr_periodo,ifr_preco);
   
   if(mm_rapida_Handle<0 || mm_lenta_Handle<0 || ifr_Handle<0)
     {
      Alert("Erro ao tentar criar Handles dpara o indiecador = erro: ", GetLastError(), "!");
      return(-1);
     }
     
     CopyRates(_Symbol,_Period,0,4,velas);
     ArraySetAsSeries(velas,true);
     
     //Para adicionar no gráfico o indicador;
     ChartIndicatorAdd(0,0,mm_rapida_Handle);
     ChartIndicatorAdd(0,0,mm_lenta_Handle);
     ChartIndicatorAdd(0,1,ifr_Handle);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   IndicatorRelease(mm_rapida_Handle);
   IndicatorRelease(mm_lenta_Handle);
   IndicatorRelease(ifr_Handle);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   desenhaLinhaVertical("L1", tick.time,clrRed);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|  FUNÇÕES PARA AUXILIAR NA VISUALIZAÇÃO DA ESTRATÉGIA                                                                |
//+------------------------------------------------------------------+

void desenhaLinhaVertical(string,nome,datetime dt, color cor = clrAliceBlue);
{
   ObjectDelete(0,nome);
   ObjectCreate(0,nome,OBJ_VLINE,0,dt,0);
   ObjectSetInteger(0,nome,OBJPROP_COLOR,cor);
}

//+------------------------------------------------------------------+
//|  FUNÇÃO PARA ENVIO DE ORDENS                                     |
//+------------------------------------------------------------------+

// COMPRA A MERCADO
void CompraAMercado() // bser na documentação ordem das variaveis!!
{
   MqlTradeRequest   requisicao;    // requisição
   MqlTradeResult    resposta;      // resposta
   
   ZeroMemory(requisicao);
   ZeroMemory(resposta);
   
   //-Caracteristicas da ordem de Compra
   requisicao.action       = TRADE_ACTION_DEAL;                            // Executa ordem a mercado
   requisicao.magic        =  magic_number;                                // Nº mágico da ordem
   requisicao.symbol       =  _Symbol;                                     // Símbolo do ativo
   requisicao.volume       = num_lots;                                     // Nº de Lotes
   requisicao.price        = NormalizeDouble(tick.ask,_Digits);            // Preço para a compra
   requisicao.sl           = NormalizeDouble(tick.ask - SL*_Point,_Digits);// Preço Stop Loss
   requisicao.tp           = NormalizeDouble(tick.ask + TK*_Point,_Digits);// Alvo de Ganho - Take Profit
   requisicao.deviation    = 0;                                            // Desvio Permitido do preço
   requisicao.type         = ORDER_TYPE_BUY;                               // Tipo de ordem
   requisicao.type_filling = ORDER_FILLING_FOK;                            // Tipo de Preenchimento da ordem
