 
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Devices_A; use Devices_A;

procedure control2 is
     
  n: integer; -- variable para recibir valores de las funciones


  procedure Lanza_Tareas;  
   
  procedure Lanza_Tareas is
    task t1;
    task t2; 
    task t3;


    task body t1 is
       Valor, n : integer := 3;
       t1, t2: Time;
       tiempo_transcurrido_ms, Distancia_cm: float;

      begin
         t1 := clock;
         for i in 1..3 loop
           delay (To_duration(Milliseconds (100)));
         end loop;
         t2 := clock;  
         put ("se ejecuta t1: "); put (Valor, 3); New_Line;

         tiempo_transcurrido_ms := Float(To_Duration(t2 - t1));
         put ("Tiempo transcurrido: "); put (tiempo_transcurrido_ms,0,8,0); New_Line;

         put_line ("termina t1");
      end t1; 

    task body t2 is
         Valor : integer := 6;
      begin
         put ("se ejecuta t2: "); put (Valor, 3); New_Line;
         delay (0.05); -- espera 50 milisegundos
         put_line ("termina t2");
      end t2; 

    task body t3 is
         Valor : integer := 9;
      begin
         put_line ("se ejecuta t3: espera medio segundo"); 
         delay (0.5); -- espera medio segundo
         put_line ("termina t3");
      end t3; 

  begin 
     Put_Line ("Cuerpo del procedimiento Lanza_Tareas ");
  end Lanza_Tareas;
     
begin
    put_line ("Aaranca programa principal");
    n := Init_Devices_A;
    put ("Inicializados los dispositivos: "); put (n, 3); New_line;
    Lanza_Tareas;
end control2;
