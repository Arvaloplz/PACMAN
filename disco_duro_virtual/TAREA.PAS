{===================================================
ICI342 - Arquitectura de comptuadores (2013)
Tarea #1 -Snake
Enzo Barbaguelatta Diaz
17.754.457-4
elsemi.en.i@gmail.com
===================================================}

program ICI342_tarea1;

begin
asm

{=================================================================================================}
											{PROGRAMA PRINCIPAL}
{=================================================================================================}
	call @login
	call @pausa
	call @cls
	call @apagar_cursor
	call @setear_arena_inicial
	call @main	
	call @fin

{=================================================================================================}
											{CODIGO FUNCIONALIDADES MISCELANEAS }
{=================================================================================================}
	{===================================================}
	@cls: {Limpia la pantalla, uso interrupcion 10h, ax=0600h}
	{===================================================}
		push ax
		push bx
		push cx
	
		mov ah,$06 	{INT= 10h/AX= 0600h, clear screen TODO buscar bien}
		mov al,$0 	{lineas a borrar=todas}
		mov bh,$07 	{atributo_a_usar_lineas_borradas=??? (Debe estar en $07, de lo contrario obtengo pantalla en blanco)}

		mov ch,$0 	{inicio fila=0}
		mov cl,$0 	{inicio columna=0}
		mov dh,$18 	{fin fila=18}
		mov dl,$4f 	{fin columna=4F=79d}

		int $10 	{func call}
		
		pop cx
		pop bx
		pop ax
	ret
	
	{===================================================}
	@escribir: {Escribo algo donde actualmente esta el cursor, caracter en AL}
	{===================================================}
		push ax
		mov ah,$0E 	{Int 10/AH=0Eh - VIDEO - TELETYPE OUTPUT}
		int $10		{func call}
		pop ax
	ret
	
	{===================================================}
	@pausa: {Pausa un programa, instando al usuario presionar una tecla para continuar}
	{===================================================}
		push ax
		mov ah,00	{Int 16/AH=00h - KEYBOARD - GET KEYSTROKE}
		int $16     {func call}
		pop ax
	ret
	
	{===================================================}
	@obtener_tecla_espera: {Obtiene una tecla, pausando al programa para obtenerla}
	{===================================================}
		mov ah,00 	{Int 16/AH=00h - KEYBOARD - GET KEYSTROKE}
		int $16		{func call}
	ret
	
	{===================================================}
	@mover_cursor_screen: {mover cursor de la pantalla. Coordenadas se establecen en DX, previamente ingresadas}
	{===================================================}
		push ax
		push bx
		
		mov ah,$02 	{Int 10/AH=02h - VIDEO - SET CURSOR POSITION}	
		mov bx,$00 	{Numero de pagina}
		int $10 	{func call}
		
		pop bx
		pop ax
	ret
	
	{===================================================}
	@apagar_cursor: {Apaga cursor de linea de comandos para el juego}
	{===================================================}
		push ax
		push cx
		
		mov ch,$32 	{bit 5 CH=0, ocultar}
		mov ah,$1 	{INT 10h / AH = 01h - set text-mode cursor shape.}
		int $10 	{func call}
		
		pop ax
		pop cx
	ret
	
	{===================================================}
	@prender_cursor: {Restaura cursor de linea de comandos para el juego}
	{===================================================}
		push ax
		push cx
		
		mov ch,$6 
		mov cl,$7 {bit 5 CH=0, ocultar}
		mov ah,$1 {INT 10h / AH = 01h - set text-mode cursor shape.}
		int $10 {func call}
		
		pop ax
		pop cx
	ret
	
	{===================================================}
	@random: {Otorga un numero aleatorio entre 0 y BH. Se entrega el resultado en BH.}
	{===================================================}
		push ax
		push cx
		push dx
		
		mov ah,$0 					{INT 1Ah / AH = 00h - get system time.}
		int $1a 					{func call}
		add dh,ch					{Se suman todas las cifras para garantizar mas alearizacion}
		add dh,cl	
		add dh,dl	
		
		@random_valido: 			{Se comprueba que el digito generado este dentro del rango.}
			cmp dh,bh
			ja @random_restar 		{En el caso de no estarlo, se ajustara restandose}
			jmp @random_valido_fin
				@random_restar:
				sub dh,bh
				jmp @random_valido
		@random_valido_fin:
		
		mov bh,dh					{Dejar resultado en BH}
		
		pop dx
		pop cx
		pop ax
	ret
	
	{===================================================}
	@sleep_01: {Realiza una espera de la CPU}
	{===================================================}
		push ax
		push cx
		push dx
		
		mov ah,$86 		{Int 15/AH=86h BIOS - WAIT (AT,PS)}
		mov dx,$1388	{Intervalo de espera. Puede ajustarse para configurar la velocidad de juego}
		mov cx,$0
		int $15			{func call}
		
		pop dx
		pop cx
		pop ax
		
	ret
	
	{===================================================}
	@ascii2num: {Obtengo en AH el numero ASCII en decimal.}
	{===================================================}
		mov ah,al
		sub ah,$30	{Eso se logra restando 30 al registro}
	ret
	
{=================================================================================================}
											{CODIGO AUXILIAR DEL PROGRAMA}
{=================================================================================================}
	{===================================================}
	@refresco_teclas: {Lee las teclas in-game, las valida y las procesa}
	{===================================================}
		mov ah,$01 		{Int 16/AH=01h KEYBOARD - CHECK FOR KEYSTROKE}
		int $16 		{func call. Marca ZF y AX}
		jz @no_tecla 	{Al no presionar tecla, marcar como tecla no presionada}
		
		mov ah,$0 		{Int 16/AH=00h KEYBOARD - GET KEYSTROKE}
		int $16 		{func call. Marca ZF y AX}
		
		{===================================================}
		cmp ah,$48 		{arriba= scancode 48}
		je @t_arriba
		cmp ah,$50		{abajo= scancode 50}
		je @t_abajo
		cmp ah,$4b 		{izquierda= scancode 4B}
		je @t_izq
		cmp ah,$4d 		{derecha= scancode 4D}
		je @t_der
		cmp ah,$1 		{esc= scancode 01}
		je @t_esc
		
	{===================================================}
		@no_tecla: 		{No hay tecla presionada}
			mov ax,$0
		ret
		
		@t_arriba: 		{Tecla arriba}
			mov ax,$1
		ret
		
		@t_abajo: 		{Tecla abajo}
			mov ax,$2
		ret
		
		@t_izq: 		{Tecla izquierda}	
			mov ax,$3
		ret
		
		@t_der: 		{Tecla derecha}
			mov ax,$4
		ret
		
		@t_esc: 		{Tecla escape}
			mov ax,$5
		ret
	
	{===================================================}
	@caracter_valido: {Comprueba si el caracter ingresado en CX es valido como dígito de RUT}
	{===================================================}
		cmp cx,$9
		je @r_check_1
		cmp cx,$8
		je @r_check_2
		cmp cx,$7
		je @r_check_3
		cmp cx,$6
		je @r_check_4
		cmp cx,$5
		je @r_check_5
		cmp cx,$4
		je @r_check_6
		cmp cx,$3
		je @r_check_7
		cmp cx,$2
		je @r_check_8
		cmp cx,$1
		je @r_check_9
	ret
	
	
{=================================================================================================}
											{CODIGO DEL PROGRAMA}
{=================================================================================================}

		{	===================================================
			Teclas son interpretadas como sigue
			1 -Arriba 
			2 -Abajo
			3 -Izquierda
			4 -Derecha
			===================================================}

	{===================================================}
	@login: {Proceso de pantalla }
	{===================================================}
		call @cls 							{Limpieza pantalla}
		
		mov dh,$9 							{Set cursor fila}
		mov dl,$5 							{Set cursor columna}
		call @mover_cursor_screen 			{mover cursor de la pantalla}
		call @print_splash_xd 				{Imprimo texto de bienvenida}
		
		mov dh,$18 							{Set cursor fila}
		mov dl,$00 							{Set cursor columna}
		call @mover_cursor_screen 			{mover cursor de la pantalla}
		
		call @print_ingrese_rut 			{Imprimo mas texto de bienvenida}
		call @ingreso_rut 					{Ingreso rut, con el manejo del error si es necesario}
		mov dh,$18 							{Set cursor fila}
		mov dl,$00 							{Set cursor columna}
		call @mover_cursor_screen 			{mover cursor de la pantalla}
		call @print_rut_correcto			{Imprime que el RUT ingresado es el correcto}
		
	ret										{FIN}

	{===================================================}
	@ingreso_rut: {Rutina para el ingreso y validacion del rut}
	{===================================================}
		mov cx,$9
		@rut_input:
			call @obtener_tecla_espera 		{en AL tendre la tecla ingresada}
			call @ascii2num 				{Obtengo en AH el numero en decimal...carry? las pelotas}
			call @caracter_valido			{Es un caracter valido?}
			call @escribir					{Mostrarlo en pantalla si es asi}
		loop @rut_input						{Volver a repetir el proceso}
	ret
	
	{===================================================}
	@r_error : {Rutina a ejecutar si no ingresa bien el rut}
	{===================================================}
		call @cls 					{Limpieza pantalla}
		
		mov dh,$18 					{Set cursor fila}
		mov dl,$00 					{Set cursor columna}
		call @mover_cursor_screen 	{mover cursor de la pantalla}
		call @print_error_rut
		call @pausa
		call @fin
		
	{===================================================}
	@setear_arena_inicial: {Configura la arena de juego para poder posteriormente iniciar el juego}
	{===================================================}
		mov ax,$8000 	{Establecer datos en la direccion de memoria 9000:0}
		mov ds,ax
		
		mov ah,$28		{Establecer la posicion inicial de la cabeza del snake}
		mov al,$16
		mov [0000],ah	{Se guarda en memoria}
		mov [0001],al
		
		mov ax,$4		{Establecer la direccion predeterminada del snake, derecha}
		mov [0002],al
		
		mov ch,$e		{Se establece la posicion inicial de la primera comida}
		mov cl,$28
		
		mov al,$0		{Se establece el marcador de comida en falso}
		mov [0003],al
		
		mov ah,$27		{Se establecen 3 colas iniciales para el snake}
		mov al,$16
		mov [0004],al
		mov [0005],ah
		mov ah,$26
		mov al,$16
		mov [0006],al
		mov [0007],ah
		mov ah,$25
		mov al,$16
		mov [0008],al
		mov [0009],ah
		mov ah,$ff		{Se crea un marcado de fin para las colas del snake}
		mov [0010],ah
		
		mov dl,$c		{Forzar un refresco al empezar el juego}
	ret
	
	{===================================================}
	@main: {El ciclo principal del juego. El juego en si se desarrolla aqui}
	{===================================================}
		{DL - Temporizador para aguardar refrescos}
		{AX	- Buffer in-game de movimiento}
		{CX - Coordenada de la comida}
	
		{===================================================}
		{Interpretacion de teclado}
		{===================================================}
		call @refresco_teclas 	{Refresco de teclado si una tecla ha sido presionada}
		
		cmp ax,$0				{Si es una tecla >0}
		ja @cond_tecla_1
		jmp @cond_tecla_end
			@cond_tecla_1:
			cmp ax,$5				{Si es una tecla <5}
			jl @cond_tecla_2
			jmp @cond_tecla_end
				@cond_tecla_2:
				mov bx,ax				{Es una tecla valida para guardar en BX}
				call @update_dir
				@cond_tecla_end:
		
		cmp ax,$5 						{Si se presiona escape, salir del juego}
		je @main_salir
	
		{===================================================}
		{Espera ante el refresco}
		{===================================================}
	
		cmp dl,$c 						{Aguardar un cierto rango de espera. (Eso excluye lectura de teclado)}
		je @refresco
		
		call @sleep_01					{Si aun no toca refresco, seguir esperando}
		inc dl
		jmp @fin_refresco
	
		{===================================================}
		{Proceso de refresco}
		{===================================================}
		@refresco:
			call @update_dir
			call @update_cabeza
			call @update_cola
			call @dibujo
		
			mov dl,$0 					{reinicializo contador EL}
		{===================================================}
		{Ciclo repetitivo y control de salida}
		{===================================================}
	
		@fin_refresco:
			jmp @main 					{Volver a aplicar el ciclo}
		
		@main_salir:
	ret
	
	{===================================================}
	@update_dir: {Actualiza la direccion del snake}
	{===================================================}
		push bx
		mov bx,[0002]
		
		{===================================================}
		{Comprobacion de conflictos ante direcciones opuestas}
		{===================================================}
		cmp al,$1				{Arriba-Abajo}
		je @nul_dir12
		jmp @nul_dir12_end
		@nul_dir12:
			cmp bl,$2
			je @no_update_dir
		@nul_dir12_end:
		
		cmp al,$2				{Abajo-Arriba}
		je @nul_dir21
		jmp @nul_dir21_end
		@nul_dir21:
			cmp bl,$1
			je @no_update_dir
		@nul_dir21_end:
		
		cmp al,$3				{Izquierda-Derecha}
		je @nul_dir34
		jmp @nul_dir34_end
		@nul_dir34:
			cmp bl,$4
			je @no_update_dir
		@nul_dir34_end:
		
		cmp al,$4				{Derecha-Izquierda}
		je @nul_dir43
		jmp @nul_dir43_end
		@nul_dir43:
			cmp bl,$3
			je @no_update_dir
		@nul_dir43_end:
		
		{===================================================}
		
		cmp al,$0				{Omitir cambio de direccion si no se han puslado teclas}
		je @no_update_dir
			mov [0002],al		{Actualizar direccion del snake}
		@no_update_dir:
		
		pop bx
	ret

	{===================================================}
	@update_cabeza: {Actualiza la posicion de la cabeza del snake}
	{===================================================}
		push dx
		
		mov dx,[0000]	{Se rescata la posicion actual del Snake}
		mov bh,dl
		mov dx,[0001]
		mov bl,dl
		push bx			{Se guarda para la futura fase del refresco}
		
		mov bx,[0002]
		
		{===================================================}
		{Realizar movimiento y comprobar conflicto con bordes de pantalla}
		{===================================================}
		cmp bx,$1					{Comprobacion arriba}
		je	@upd_cabeza_arriba
		jmp @upd_cabeza_fin_arriba
		@upd_cabeza_arriba:
			mov bx,[0001]
			cmp bl,$0
			je @game_over
			dec bl
			mov [0001],bl
		@upd_cabeza_fin_arriba:
		
		cmp bx,$2					{Comprobacion abajo}
		je	@upd_cabeza_abajo
		jmp @upd_cabeza_fin_abajo
		@upd_cabeza_abajo:
			mov bx,[0001]
			cmp bl,$18
			je @game_over
			inc bl
			mov [0001],bl
		@upd_cabeza_fin_abajo:
		
		cmp bx,$3					{Comprobacion izquierda}
		je	@upd_cabeza_izq
		jmp @upd_cabeza_fin_izq
		@upd_cabeza_izq:
			mov bx,[0000]
			cmp bl,$0
			je @game_over
			dec bl
			mov [0000],bl
		@upd_cabeza_fin_izq:
		
		cmp bx,$4					{Comprobacion derecha}
		je	@upd_cabeza_der
		jmp @upd_cabeza_fin_der
		@upd_cabeza_der:
			mov bx,[0000]
			cmp bl,$4f
			je @game_over
			inc bl
			mov [0000],bl
		@upd_cabeza_fin_der:
		
		{===================================================}
		{Comprobar choque de la cabeza del Snake }
		{===================================================}
		mov bh,[0000]
		mov bl,[0001]
		call @disponible
		cmp bx,$0
		je @game_over
		
		{===================================================}
		{Comprobar alimento de Snake }
		{===================================================}
		mov bh,[0001]								{Obtengo las coordenadas de la cabeza del Snake}
		mov bl,[0000]
		cmp ch,bh
		je @comprobar_coordenada_comida_y			{Coincidencia en coordenada Y?}
		jmp @comprobar_coordenada_comida_y_end
		@comprobar_coordenada_comida_y:
			cmp cl,bl								{Coincidencia en coordenada X?}
			je @actualizar_comida
			jmp @comprobar_coordenada_comida_y_end
			
			@actualizar_comida:						{Snake ha comido algo}
			mov bl,$1								{Marcador de comida establecido para generar nueva cola}
			mov [0003],bl
			@posicionar_comida:						{Buscar nueva posicion para comida segun random}
				push bx
				mov bh,$4f
				call @random
				mov cl,bh
				mov bh,$18
				call @random
				mov ch,bh
				
				mov bx,cx							{Comprobar si la comida no choca con la cola del Snake}
				call @disponible
				cmp bx,$0
				je @posicionar_comida				{Sea el caso, buscar otra posicion}
			@fin_posicionar_comida:

			pop bx
		@comprobar_coordenada_comida_y_end:
				
		pop bx
		pop dx
	ret
	
	{===================================================}
	@update_cola:	{Tareas de refresco de los movimientos de la cola}
	{===================================================}
		push ax
		push cx
		push dx
		mov ax,bx			{Ajuste de movimiento de cabeza para dar lugar a otros usos de registros}
		
		mov dl,[0003]
		mov bx,$4
		
		{===================================================}
		{Buscar actual cola de Snake}
		{===================================================}
		@cola_ir_fin: 
			mov cl,[bx]				{Buscar marcador fin de cola}
			cmp cl,$ff
			je @cola_ir_fin_fin
			add bx,$2				{Seguir buscando}
			jmp @cola_ir_fin
		@cola_ir_fin_fin:
		
		{===================================================}
		{Ajuste cola, eliminacion y ajuste del resto de colas}
		{===================================================}
		cmp dl,$1
		je @crecer_snake			{Hacer crecer snake si se ha alimentado}
		sub bx,$2
		jmp @crecer_snake_fin
		
		@crecer_snake:				{Si se ha alimentado, crear una nueva cola}
			mov dl,0
			mov [0003],dl
			mov dl,$ff
			mov [bx+2],dl
		@crecer_snake_fin:
		
		{===================================================}
		{Ajuste hilo de colas}
		{===================================================}
		@loop_update_cola:
			cmp bx,$4
			jle @loop_update_cola_fin
			sub bx,$2 		{Mover coordenadas a las colas anteriores}
			mov ch,[bx]
			mov cl,[bx+1]
			add bx,$2
			mov [bx],ch
			mov [bx+1],cl
			
			sub bx,$2
			jmp @loop_update_cola
		@loop_update_cola_fin:
		
		mov [bx],ax			{Pongo posicion coordenada a la primera cola del Snake}
		pop dx
		pop cx
		pop ax
	ret
		
	{===================================================}
	@dibujo: {Tareas de refresco de escritura en pantalla}
	{===================================================}
		call @cls	{Limpieza de pantalla}
		
		push ax
		push dx
		push bx
		
		{===================================================}
		{Escritura de comida}
		{===================================================}
		mov dh,ch
		mov dl,cl
		call @mover_cursor_screen 			{mover cursor de la pantalla}
		mov al,$02
		call @escribir
		
		{===================================================}
		{Escritura de cabeza}
		{===================================================}
		mov dl,[0000]
		mov dh,[0001]
		call @mover_cursor_screen
		mov al,$db
		call @escribir
		
		{===================================================}
		{Escritura de Colas, avanzando cola por cola}
		{===================================================}
		mov bx,$4
		@dibujo_loop_colas:
			mov ax,[bx]
			cmp al,$ff					{Si es fin de colas, no escribir mas}
			je @dibujo_loop_colas_end
			mov dl,ah
			mov dh,al
			call @mover_cursor_screen
			mov al,$fe
			call @escribir
			add bx,$2
			jmp @dibujo_loop_colas
		@dibujo_loop_colas_end:
		
		pop bx
		pop dx
		pop ax
		
	ret
	
	{===================================================}
	@disponible: {Ve si la coordenada en BX esta libre de colas o no. Retorna BL 0 si no, o 1 si es que si}
	{===================================================}
		push ax
		push cx
		mov ax,bx
		mov bx,$0004

		@disponible_check:		{Comprueba por cada cola, si es que coincide con la coordenada en BX}
			mov cx,[bx]
			cmp cx,ax 			{Hago las comprobaciones de ambas coordenadas a la vez}
			je @no_disponible
			jmp @no_disponible_end
			@no_disponible:
				mov bx,0
				jmp @disponible_fin_check
			@no_disponible_end:
			add bx,$2			{Avanzo una cola mas para seguir... sin antes comprobar si no estoy cerca del fin}
			mov cl,[bx+2]
			cmp cl,$ff
			je @si_disponible
		jmp @disponible_check
		
		@si_disponible:
		mov bx,$1
		
		@disponible_fin_check:
		pop cx
		pop ax
	ret
	
	{===================================================}
	@game_over: {Rutina al ejecutar al finalizar el juego por perder}
	{===================================================}
		call @cls
		{Cuento mi puntaje segun el numero de colas que poseo}
		mov ax,$0
		mov bx,$4
		
		@loop_count:
			mov cx,[bx]
			cmp cl,$ff {Acumulo puntaje hasta llegar al fin de la cola}
			je @loop_count_end
			add ax,$1
			add bx,$2
			jmp @loop_count
		@loop_count_end:
		
		{Convertir la cantidad a decimal, descomponiendo la cifra en base 10}
		sub ax,$3
		mov dx,$0
		mov bx,$0
		mov [bx],ax

		@calc_decimal:
			mov cx,$0
			mov [bx+2],cx 
			mov ax,[bx]			{Comprobar si no hay mas para descomponer}
			cmp ax,$0
			je @calc_decimal_end
			add dx,$1
			@loop_calc_decimal:	{Descomponer cifra si actual es mayor a 9}
				mov ax,[bx]
				cmp ax,$9
				ja @sumar_decimal
				jmp @sumar_decimal_end
				@sumar_decimal:
					sub ax,$a			{Restar 10 a la cifra actual para ajustarla}
					mov [bx],ax
					mov ax,[bx+2]		{Sumarle 1 al sucesor}
					add ax,$1
					mov [bx+2],ax
					jmp @loop_calc_decimal
				@sumar_decimal_end:
			add bx,$2
			jmp @calc_decimal
		@calc_decimal_end: 
		
		{===================================================}
		{Imprimir puntaje por pantalla}
		{===================================================}
		mov cx,dx 
		mov dh,$b
		mov dl,$28
		call @mover_cursor_screen
		call @print_score_msg
		mov dh,$c							{Set cursor fila}
		mov dl,$28 							{Set cursor columna}
		call @mover_cursor_screen
		
		add cx,$1
		@print_puntaje:
			mov ax,[bx]		{Imprimir cada cifra hasta que no queden mas cifras}
			add ax,$30
			call @escribir
			add dl,$1
			call @mover_cursor_screen
			
			sub bx,$2
		loop @print_puntaje
		call @mover_cursor_screen 
		call @pausa
	call @fin
	
{=================================================================================================}
											{DATOS - MAPA DE TECLAS PARA RUT}
{=================================================================================================}
	@r_check_1:
		cmp ah,$1
		jne @r_error
	ret
	@r_check_2:
		cmp ah,$7
		jne @r_error
	ret
	@r_check_3:
		cmp ah,$7
		jne @r_error
	ret
	@r_check_4:
		cmp ah,$5
		jne @r_error
	ret
	@r_check_5:
		cmp ah,$4
		jne @r_error
	ret
	@r_check_6:
		cmp ah,$4
		jne @r_error
	ret
	@r_check_7:
		cmp ah,$5
		jne @r_error
	ret
	@r_check_8:
		cmp ah,$7
		jne @r_error
	ret
	@r_check_9:
		cmp ah,$4
		jne @r_error
	ret
	
{=================================================================================================}
											{DATOS - STRINGS}
{=================================================================================================}
	
	{===================================================}
	@print_ingrese_rut: 
	{===================================================}
	push ax
	
	mov al,'I'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'g'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'s'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'s'
	call @escribir
	mov al,'u'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'A'
	call @escribir
	mov al,'X'
	call @escribir
	mov al,'9'
	call @escribir
	mov al,'6'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'R'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'-'
	call @escribir
	mov al,'U'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'-'
	call @escribir
	mov al,'T'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'g'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'-'
	call @escribir
	mov al,'I'
	call @escribir
	mov al,'D'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'('
	call @escribir
	mov al,'R'
	call @escribir
	mov al,'U'
	call @escribir
	mov al,'T'
	call @escribir
	mov al,')'
	call @escribir
	mov al,':'
	call @escribir
	mov al,' '
	call @escribir
	
	pop ax
	ret
	
	
	{===================================================}
	@print_splash_xd: {LOMBRIZ SOLITARIA (AHORA CON UN 25% MAS DE BAJO PRESUPUESTO!!!111)}
	{===================================================}
	push ax
	
	mov al,'V'
	call @escribir
	mov al,'E'
	call @escribir
	mov al,'L'
	call @escribir
	mov al,'A'
	call @escribir
	mov al,'S'
	call @escribir
	mov al,'C'
	call @escribir
	mov al,'O'
	call @escribir
	mov al,$2
	call @escribir
	mov al,' '
	call @escribir
	mov al,'S'
	call @escribir
	mov al,'N'
	call @escribir
	mov al,'A'
	call @escribir
	mov al,'K'
	call @escribir
	mov al,'E'
	call @escribir
	mov al,'!'
	call @escribir
	mov al,'!'
	call @escribir
	mov al,'!'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'('
	call @escribir
	mov al,'T'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'#'
	call @escribir
	mov al,'1'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'-'
	call @escribir
	mov al,'E'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'z'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'B'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'b'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'g'
	call @escribir
	mov al,'u'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'l'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'D'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'z'
	call @escribir
	mov al,')'
	call @escribir

	
	pop ax
	ret
	{===================================================}
	@print_score_msg:
	{===================================================}
	push ax
	
	mov al,'V'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'m'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'s'
	call @escribir
	mov al,':'
	call @escribir
	
	pop ax
	ret
	
	{===================================================}
	@print_rut_correcto: {un aviso para el rut correcto}
	{===================================================}
	push ax
	
	mov al,'B'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'v'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'h'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'h'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'l'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'.'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'P'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'s'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'u'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'l'
	call @escribir
	mov al,'q'
	call @escribir
	mov al,'u'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'l'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'p'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'m'
	call @escribir
	mov al,'p'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'z'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'!'
	call @escribir

	
	pop ax
	ret
	
	{===================================================}
	@print_error_rut: {un error para el rut}
	{===================================================}
	push ax
	
	mov al,'A'
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'c'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'s'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'D'
	call @escribir
	mov al,'E'
	call @escribir
	mov al,'N'
	call @escribir
	mov al,'E'
	call @escribir
	mov al,'G'
	call @escribir
	mov al,'A'
	call @escribir
	mov al,'D'
	call @escribir
	mov al,'O'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'p'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'l'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'s'
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'l'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'r'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'.'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'Q'
	call @escribir
	mov al,'u'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'t'
	call @escribir
	mov al,'e'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'g'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,'s'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'u'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'l'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'n'
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'o'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'d'
	call @escribir
	mov al,'i'
	call @escribir
	mov al,'a'
	call @escribir
	mov al,' '
	call @escribir
	mov al,'^'
	call @escribir
	mov al,'^'
	call @escribir
	mov al,'!'
	call @escribir
	
	pop ax
	ret
	
	{=================================================================================================}
											{FIN DEL PROGRAMA}
	{=================================================================================================}
	
	{===================================================}
	@fin: {Finaliza el programa, acondiciona el entorno para retornar}
	{===================================================}
		call @prender_cursor
		call @cls
		mov dh,$9 					{Set cursor fila}
		mov dl,$0					{Set cursor columna}
		call @mover_cursor_screen 	{mover cursor de la pantalla}
	nop

end;
end.

{=================================================================================================}

	