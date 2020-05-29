//+------------------------------------------------------------------+
//|                                                    ESTUDO_EA.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
//---

enum ESTACOES_ANO
  {
   primavera = 77,   //PRIMAVERA
   verao =      2,   //VERÃO
   outono =     3,   //OUTONO
   inverno =    4,   //INVERNO
  };







//---
input int numeroPeriodos = 11;         //Nº DE PERÍODOS
input string Comentario = "";          //COMENTÁRIOS
input ESTACOES_ANO estacao = outono;   //ESTAÇÃO



//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(3);
   
   Print("Símbolo = ", _Symbol);
   Print("Período = ", _Period);
   Print("Pontos = ", _Point);
   Print("Dígitos = ", _Digits);
   
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
   //myFun(3,4);
   //myFun2(9,3);
   //Print("Div = ", myFun2(3,9));
   funcTeste();
   
   //Print("Var local = ",np1);
   Print("Var Global = ",vg1);
   
  }
//+------------------------------------------------------------------+

void myFun(double a, double b)
   {
      double soma = a+b;
      
      Print("Soma - ", soma);
}

double myFun2(double n, double d)
{
   double div = n/d;
   return div;
// comment to git
// comment to git 15032020
// COMMENT TO GIT 16032020
// coment to git 17032020
}

int vg1 = 22;

void funcTeste()
{
   int np1 = 7;
   
   int np2 = 2;
   
   myFun(np1,np2);
   
   Print("Multiplicãção = ", np1*np2);
}
//+------------------------------------------------------------------+
//|   OPERAÇÕES MATEMÁTICAS                                          |
//+------------------------------------------------------------------+

ing varA = 2+3;

double varB = 2.5 + varA;

double varC = varA - varB;

//---
//Multiplicação

int varD = 2*3;

double varE = 2.5 * varD;

//---
// Divisão

double varF = 5/2;

int varG = 5/2;


//--- LÓGICA

//A > B
//
//A < B
//
//A >= B
//
//A <= B
//
//A == B
//
//A != B

int A = 7;
int B = 7;
int C = 10;

   if(A == B && A+B == C)
{
   Print("OK!");
}

   if(A == B || A == C)
{
   Print(true);
}

if(A > B)
  {
   Print("A > B");
  }
  else
    {
     Print("A < B");
    }
    
if(A>B)
  {
   Print("A>B");
  }
  else if(A==B)
         {
          Print("A = B");
         }
   else if(A!=B)
          {
           Print("A!=B");
          }
          
else
  {
   Print("Nada!");
  }

  bool cond = true;
  
  bool resp = cond ? true: false;
  
  Print(resp);
  
  //editing to git
----
COMMIT TO GIT
