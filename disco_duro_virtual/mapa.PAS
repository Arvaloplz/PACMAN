program mapa;
begin
asm
{----------------------------------------------------------------}
							{DIBUJO}
{-----------------------------------------------------------------}
call @score_live
call @cuadro_juego
call @arena
call @puntos
{--------------------------------------}
xor ax,ax

@cuadro_juego:{---------------------------------------------------}
							{CUADRO DE JUEGO}
{-----------------------------------------------------------------}
	{---------------- vorde superior---------------------------------}
	mov bh,$0{-------aqui se utiliza BX para determinar la pagina 0}
	mov bl,$9{-------se determina el colo del cuadro de juego}
	mov al,$da{-----caracter------}
	mov dh,$1{----cordenada fila----}
	mov dl,$13{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$c4
	mov dh,$1
	mov dl,$14
	mov cx,$3a
	call @mov_cursor
	call @dibuja
	mov al,$bf
	mov dh,$1
	mov dl,$4e
	mov cx,$1
	call @mov_cursor
	call @dibuja
	{-------------------------------vorde izquierdo---------------------------}
	mov al,$b3
	mov dh,$2 
	mov dl,$13
	mov cx,$1 
	call @mov_cursor
	call @dibuja
	mov dh,$3 
	mov dl,$13
	mov cx,$1  
	call @mov_cursor
	call @dibuja
	mov al,$b3
	mov dh,$4 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$5 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$6 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$7 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$8 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$9 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$a 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$b 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$c 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$d 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$e 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$f 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$10 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$11 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$12 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$13 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$14 
	mov dl,$13 
	call @mov_cursor 
	call @dibuja
	mov dh,$15 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$16 
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	mov dh,$17
	mov dl,$13 
	call @mov_cursor
	call @dibuja
	{ ----------------------------vorde derecho --------------------------------}
	mov dh,$2 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$3 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$4 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$5 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$6 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$7 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$8 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$9 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$a 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$b 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$c 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$d 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$e 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$f 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$10 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$11 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$12 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$13 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$14 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$15 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$16 
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	mov dh,$17
	mov dl,$4e 
	call @mov_cursor
	call @dibuja
	{-------------------------- vorde inferior---------------------------------}
	mov al,$c0
	mov dh,$17 
	mov dl,$13
	mov cx,$1 
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$c4
	mov dh,$17
	mov dl,$14
	mov cx,$3a
	call @mov_cursor
	call @dibuja
	mov al,$d9
	mov dh,$17
	mov dl,$4e
	mov cx,$1
	call @mov_cursor
	call @dibuja
	call @cursor_off
ret
 		@mov_cursor: {mover cursor de la pantalla. Coordenadas se establecen en DX, previamente ingresadas}
		{===================================================}
			push ax
			push bx
			
			mov ah,$02 	{Int 10/AH=02h - VIDEO - SET CURSOR POSITION}	
			mov bx,$00 	{Numero de pagina}
			int $10 	{func call}
			
			pop bx
			pop ax
		ret
		@dibuja:{se imprime el caracter color especifico luego de mover el cursor}
		{===================================================}
 			mov ah,$09 	{Int 10/AH=02h - VIDEO - SET CURSOR POSITION}	
			int $10 	{func call}
		ret
@score_live:{-------------------------------------------------------------------------------}
												{SCORE}
{------------------------------------------------------------------------------------------}
	mov bh,$0{-------aqui se utiliza BX para determinar la pagina 0}
	mov bl,$f{-------se determina el colo del cuadro de juego}
	mov al,'P'{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$6{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
    mov al,'U'
    mov dl,$7
    call @mov_cursor
    call @dibuja 
    mov al,'N'
    mov dl,$8
    call @mov_cursor
    call @dibuja 
    mov al,'T'
    mov dl,$9
    call @mov_cursor
    call @dibuja
    mov al,'A'
    mov dl,$a
    call @mov_cursor
    call @dibuja 
    mov al,'J'
    mov dl,$b
    call @mov_cursor
    call @dibuja 
    mov al,'E'
    mov dl,$c
    call @mov_cursor
    call @dibuja 
    mov al,':'
    mov dl,$d
    call @mov_cursor
    call @dibuja 
{-----------------------------------------------------------------------------------------}
											{LIFE}
{------------------------------------------------------------------------------------------}
	mov al,'V'{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$6{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
    mov al,'I'
    mov dl,$7
    call @mov_cursor
    call @dibuja 
    mov al,'D'
    mov dl,$8
    call @mov_cursor
    call @dibuja 
    mov al,'A'
    mov dl,$9
    call @mov_cursor
    call @dibuja
    mov al,'S'
    mov dl,$a
    call @mov_cursor
    call @dibuja 
    mov al,':'
    mov dl,$b
    call @mov_cursor
    call @dibuja 
{-----------------------------------------------------------------------------------------}
											{PAC MEN VIDA}
{------------------------------------------------------------------------------------------}
	mov al,$02{-----caracter------}
	mov bl,$e
	mov dh,$14{----cordenada fila----}
	mov dl,$7{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov dh,$14{----cordenada fila----}
	mov dl,$9{----cordenada fila----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov dh,$14{----cordenada fila----}
	mov dl,$b{----cordenada fila----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja

ret
{-----------------------------------------------------------------------------------------}
											{ARENA}
{------------------------------------------------------------------------------------------}
@arena:
	mov bh,$0{-------aqui se utiliza BX para determinar la pagina 0}
	mov bl,$1{-------se determina el colo del cuadro de juego}
	mov al,$c9{-----caracter------}
	mov dh,$2{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$2
	mov dl,$15
	mov cx,$1a
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$2
	mov dl,$2f
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$c9
	mov dh,$2
	mov dl,$32
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$2
	mov dl,$33
	mov cx,$1a
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$2
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba{-----caracter------}
	mov dh,$3{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba
	mov dh,$3
	mov dl,$2f
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$3
	mov dl,$32
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$3
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba{-----caracter------}
	mov dh,$4{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}

	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$c9{-----caracter------}
	mov dh,$4{----cordenada fila----}
	mov dl,$16{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$4
	mov dl,$17
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$4
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c9{-----caracter------}
	mov dh,$4{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$4
	mov dl,$1e
	mov cx,$f
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$4
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$ba
	mov dh,$4
	mov dl,$2f
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$4
	mov dl,$32
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$c9{-----caracter------}
	mov dh,$4{----cordenada fila----}
	mov dl,$34{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$4
	mov dl,$35
	mov cx,$f
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$4
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c9{-----caracter------}
	mov dh,$4{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$4
	mov dl,$47
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$4
	mov dl,$4b
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$4
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja









	mov al,$ba{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$c8{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$16{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$5
	mov dl,$17
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$5
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c8{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$5
	mov dl,$1e
	mov cx,$f
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$5
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$c8
	mov dh,$5
	mov dl,$2f
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$5
	mov dl,$30
	mov cx,$2
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$5
	mov dl,$32
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$c8{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$34{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$5
	mov dl,$35
	mov cx,$f
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$5
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c8{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$5
	mov dl,$47
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$5
	mov dl,$4b
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$5
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$ba{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor
	call @dibuja

	mov al,$ba
	mov dh,$5
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja





	mov al,$ba{-----caracter------}
	mov dh,$6{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov al,$ba
	mov dh,$6
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja




    mov al,$ba{-----caracter------}
	mov dh,$7{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$c9{-----caracter------}
	mov dh,$7{----cordenada fila----}
	mov dl,$16{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$7
	mov dl,$17
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$7
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c9{-----caracter------}
	mov dh,$7{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$7
	mov dl,$1e
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$7
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c9{-----caracter------}
	mov dh,$7{----cordenada fila----}
	mov dl,$21{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$7
	mov dl,$22
	mov cx,$1e
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$7
	mov dl,$40
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c9{-----caracter------}
	mov dh,$7{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$7
	mov dl,$43
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$7
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c9{-----caracter------}
	mov dh,$7{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$7
	mov dl,$47
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$7
	mov dl,$4b
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$7
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja








    mov al,$ba{-----caracter------}
	mov dh,$8{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$c8{-----caracter------}
	mov dh,$8{----cordenada fila----}
	mov dl,$16{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$8
	mov dl,$17
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$8
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba{-----caracter------}
	mov dh,$8{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba{-----caracter------}
	mov dh,$8
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c8{-----caracter------}
	mov dh,$8{----cordenada fila----}
	mov dl,$21{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$8
	mov dl,$22
	mov cx,$b
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$8
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$c9
	mov dh,$8
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$8
	mov dl,$35
	mov cx,$b
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$8
	mov dl,$40
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$8{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba
	mov dh,$8
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c8{-----caracter------}
	mov dh,$8{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$8
	mov dl,$47
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$8
	mov dl,$4b
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$ba
	mov dh,$8
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja







    mov al,$ba{-----caracter------}
	mov dh,$9{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$ba{-----caracter------}
	mov dh,$9{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba{-----caracter------}
	mov dh,$9
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$9
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$9
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$9{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba
	mov dh,$9
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$9
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja









	mov al,$c8{-----caracter------}
	mov dh,$a{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$a
	mov dl,$15
	mov cx,$6
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$a
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba{-----caracter------}
	mov dh,$a{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$c8{-----caracter------}
	mov dh,$a{----cordenada fila----}
	mov dl,$1f{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$a
	mov dl,$20
	mov cx,$9
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$a
	mov dl,$29
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba
	mov dh,$a
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$a
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja


	call @mov_cursor
	call @dibuja
	mov al,$c9
	mov dh,$a
	mov dl,$38
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$a
	mov dl,$39
	mov cx,$9
	call @mov_cursor
	call @dibuja










	mov al,$bc{-----caracter------}
	mov dh,$a{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba
	mov dh,$a
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c9{-----caracter------}
	mov dh,$a{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$a
	mov dl,$47
	mov cx,$7
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$a
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja











	mov al,$ba
	mov dh,$b
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$b{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$c9{-----caracter------}
	mov dh,$b{----cordenada fila----}
	mov dl,$1f{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$b
	mov dl,$20
	mov cx,$9
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$b
	mov dl,$29
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c8
	mov dh,$b
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$b
	mov dl,$2e
	mov cx,$6
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$b
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja



	call @mov_cursor
	call @dibuja
	mov al,$c8
	mov dh,$b
	mov dl,$38
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$b
	mov dl,$39
	mov cx,$9
	call @mov_cursor
	call @dibuja
	mov al,$bb{-----caracter------}
	mov dh,$b{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$ba
	mov dh,$b
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$b{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}








	mov al,$c9{-----caracter------}
	mov dh,$c{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$c
	mov dl,$15
	mov cx,$6
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$c
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c8{-----caracter------}
	mov dh,$c{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$c
	mov dl,$1e
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$c
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c8{-----caracter------}
	mov dh,$c{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$c
	mov dl,$43
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$c
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c8{-----caracter------}
	mov dh,$c{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$c
	mov dl,$47
	mov cx,$7
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$c
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja







{eje sadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd}


	mov al,$ba{-----caracter------}
	mov dh,$d{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov al,$ba
	mov dh,$d
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$c8{-----caracter------}
	mov dh,$e{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$e
	mov dl,$15
	mov cx,$6
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$e
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c9{-----caracter------}
	mov dh,$e{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$e
	mov dl,$1e
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$e
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c9{-----caracter------}
	mov dh,$e{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$e
	mov dl,$43
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$e
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c9{-----caracter------}
	mov dh,$e{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$e
	mov dl,$47
	mov cx,$7
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$e
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja








	mov al,$ba
	mov dh,$f
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$f{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$c8{-----caracter------}
	mov dh,$f{----cordenada fila----}
	mov dl,$1f{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$f
	mov dl,$20
	mov cx,$9
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$f
	mov dl,$29
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c9
	mov dh,$f
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$f
	mov dl,$2e
	mov cx,$6
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$f
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja



	call @mov_cursor
	call @dibuja
	mov al,$c9
	mov dh,$f
	mov dl,$38
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$f
	mov dl,$39
	mov cx,$9
	call @mov_cursor
	call @dibuja
	mov al,$bc{-----caracter------}
	mov dh,$f{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$ba
	mov dh,$f
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$f{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}









	mov al,$c9{-----caracter------}
	mov dh,$10{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$10
	mov dl,$15
	mov cx,$6
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$10
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba{-----caracter------}
	mov dh,$10{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$c9{-----caracter------}
	mov dh,$10{----cordenada fila----}
	mov dl,$1f{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$10
	mov dl,$20
	mov cx,$9
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$10
	mov dl,$29
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba
	mov dh,$10
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$10
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja


	call @mov_cursor
	call @dibuja
	mov al,$c8
	mov dh,$10
	mov dl,$38
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$10
	mov dl,$39
	mov cx,$9
	call @mov_cursor
	call @dibuja










	mov al,$bb{-----caracter------}
	mov dh,$10{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba
	mov dh,$10
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c8{-----caracter------}
	mov dh,$10{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$10
	mov dl,$47
	mov cx,$7
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$10
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja



    mov al,$ba{-----caracter------}
	mov dh,$11{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$ba{-----caracter------}
	mov dh,$11{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba{-----caracter------}
	mov dh,$11
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$11
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$11
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$11{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba
	mov dh,$11
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$11
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja













   

    mov al,$ba{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$c9{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$16{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$12
	mov dl,$17
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$12
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$ba{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba{-----caracter------}
	mov dh,$12
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c9{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$21{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$12
	mov dl,$22
	mov cx,$b
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$12
	mov dl,$2d
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$c8
	mov dh,$12
	mov dl,$34
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$12
	mov dl,$35
	mov cx,$b
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$12
	mov dl,$40
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$ba
	mov dh,$12
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c9{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$12
	mov dl,$47
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$12
	mov dl,$4b
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$ba
	mov dh,$12
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$ba{-----caracter------}
	mov dh,$13{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}


	mov al,$c8{-----caracter------}
	mov dh,$13{----cordenada fila----}
	mov dl,$16{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$13
	mov dl,$17
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$13
	mov dl,$1b
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c8{-----caracter------}
	mov dh,$13{----cordenada fila----}
	mov dl,$1d{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$13
	mov dl,$1e
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$13
	mov dl,$1f
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$c8{-----caracter------}
	mov dh,$13{----cordenada fila----}
	mov dl,$21{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$13
	mov dl,$22
	mov cx,$1e
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$13
	mov dl,$40
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c8{-----caracter------}
	mov dh,$13{----cordenada fila----}
	mov dl,$42{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$13
	mov dl,$43
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$13
	mov dl,$44
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$c8{-----caracter------}
	mov dh,$13{----cordenada fila----}
	mov dl,$46{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$13
	mov dl,$47
	mov cx,$4
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$13
	mov dl,$4b
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba
	mov dh,$13
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$ba{-----caracter------}
	mov dh,$14{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov al,$ba
	mov dh,$14
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$ba{-----caracter------}
	mov dh,$15{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$c9
	mov dh,$15
	mov dl,$2f
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$15
	mov dl,$30
	mov cx,$2
	call @mov_cursor
	call @dibuja
	mov al,$bb
	mov dh,$15
	mov dl,$32
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$ba
	mov dh,$15
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$c8{-----caracter------}
	mov dh,$16{----cordenada fila----}
	mov dl,$14{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$cd
	mov dh,$16
	mov dl,$15
	mov cx,$1a
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$16
	mov dl,$2f
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$c8
	mov dh,$16
	mov dl,$32
	mov cx,$1
	call @mov_cursor
	call @dibuja
	mov al,$cd
	mov dh,$16
	mov dl,$33
	mov cx,$1a
	call @mov_cursor
	call @dibuja
	mov al,$bc
	mov dh,$16
	mov dl,$4d
	mov cx,$1
	call @mov_cursor
	call @dibuja


ret

{-------------------------------------------------------------------------------------}
								{PUNTOS}
{--------------------------------------------------------------------------------------}

 @puntos:{}
	mov bl,$f{-------se determina el colo del cuadro de juego}
	mov al,$7{-----caracter------}
	mov dh,$3{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1a {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$7
	mov dh,$3
	mov dl,$33
	mov cx,$1a
	call @mov_cursor
	call @dibuja


	mov al,$7{-----caracter------}
	mov dh,$4{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1 {----repeticion----}

	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$7
	mov dh,$4
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$4
	mov dl,$2e
	mov cx,$1
	call @mov_cursor
	call @dibuja





	mov al,$7
	mov dh,$4
	mov dl,$33
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7
	mov dh,$4
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$7
	mov dh,$4
	mov dl,$4c
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$7{-----caracter------}
	mov dh,$5{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1 {----repeticion----}

	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$7
	mov dh,$5
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$5
	mov dl,$2e
	mov cx,$1
	call @mov_cursor
	call @dibuja





	mov al,$7
	mov dh,$5
	mov dl,$33
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7
	mov dh,$5
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$7
	mov dh,$5
	mov dl,$4c
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$7{-----caracter------}
	mov dh,$6{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$38{----repeticion----}
	call @mov_cursor
	call @dibuja

	mov al,$7{-----caracter------}
	mov dh,$7{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1 {----repeticion----}

	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$7
	mov dh,$7
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$7
	mov dl,$20
	mov cx,$1
	call @mov_cursor
	call @dibuja





	mov al,$7
	mov dh,$7
	mov dl,$41
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7
	mov dh,$7
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$7
	mov dh,$7
	mov dl,$4c
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7{-----caracter------}
	mov dh,$8{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$7
	mov dh,$8
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$8
	mov dl,$20
	mov cx,$1
	call @mov_cursor
	call @dibuja





	mov al,$7
	mov dh,$8
	mov dl,$41
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7
	mov dh,$8
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$7
	mov dh,$8
	mov dl,$4c
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$7{-----caracter------}
	mov dh,$9{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$8 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$7
	mov dh,$9
	mov dl,$20
	mov cx,$d
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$9
	mov dl,$35
	mov cx,$d
	call @mov_cursor
	call @dibuja
	mov al,$7
	mov dh,$9
	mov dl,$45
	mov cx,$8
	call @mov_cursor
	call @dibuja



	
	mov al,$7
	mov dh,$a
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$7
	mov dh,$a
	mov dl,$2a
	mov cx,$3
	call @mov_cursor
	call @dibuja

	mov al,$7
	mov dh,$a
	mov dl,$35
	mov cx,$3
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$a
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7{-----caracter------}
	mov dh,$b{----cordenada fila----}
	mov dl,$1c{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov al,$7
	mov dh,$b
	mov dl,$2a 
	mov cx,$3
	call @mov_cursor
	call @dibuja
	mov al,$7
	mov dh,$b
	mov dl,$35
	mov cx,$3
	call @mov_cursor
	call @dibuja

	call @mov_cursor
	call @dibuja
	mov dh,$b 
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja



    mov al,$7{-----caracter------}
	mov dh,$c{----cordenada fila----}
	mov dl,$1c{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov al,$7
	mov dh,$c
	mov dl,$20
	mov cx,$22
	call @mov_cursor
	call @dibuja


	mov dh,$c 
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja
{ --------------------mitad ----------------------------------}
	mov al,$7{-----caracter------}
	mov dh,$d{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$13{----repeticion----}
	call @mov_cursor
	call @dibuja
	mov al,$7{-----caracter------}
	mov dh,$d{----cordenada fila----}
	mov dl,$3a{----cordenada fila----}
	mov cx,$13{----repeticion----}
	call @mov_cursor
	call @dibuja



    mov al,$7{-----caracter------}
	mov dh,$e{----cordenada fila----}
	mov dl,$1c{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov al,$7
	mov dh,$e
	mov dl,$20
	mov cx,$22
	call @mov_cursor
	call @dibuja


	mov dh,$e 
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7{-----caracter------}
	mov dh,$f{----cordenada fila----}
	mov dl,$1c{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja
	mov al,$7
	mov dh,$f
	mov dl,$2a 
	mov cx,$3
	call @mov_cursor
	call @dibuja
	mov al,$7
	mov dh,$f
	mov dl,$35
	mov cx,$3
	call @mov_cursor
	call @dibuja

	call @mov_cursor
	call @dibuja
	mov dh,$f 
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$7
	mov dh,$10
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$7
	mov dh,$10
	mov dl,$2a
	mov cx,$3
	call @mov_cursor
	call @dibuja

	mov al,$7
	mov dh,$10
	mov dl,$35
	mov cx,$3
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$10
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja


		mov al,$7{-----caracter------}
	mov dh,$11{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$8 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$7
	mov dh,$11
	mov dl,$20
	mov cx,$d
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$11
	mov dl,$35
	mov cx,$d
	call @mov_cursor
	call @dibuja
	mov al,$7
	mov dh,$11
	mov dl,$45
	mov cx,$8
	call @mov_cursor
	call @dibuja


		mov al,$7{-----caracter------}
	mov dh,$12{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1 {----repeticion----}
	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}

	mov al,$7
	mov dh,$12
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$12
	mov dl,$20
	mov cx,$1
	call @mov_cursor
	call @dibuja





	mov al,$7
	mov dh,$12
	mov dl,$41
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7
	mov dh,$12
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$7
	mov dh,$12
	mov dl,$4c
	mov cx,$1
	call @mov_cursor
	call @dibuja


		mov al,$7{-----caracter------}
	mov dh,$13{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1 {----repeticion----}

	call @mov_cursor{----mueve el cursor a la pocicion de las cordenadas---}
	call @dibuja{---imprime el dibujo---}
	mov al,$7
	mov dh,$13
	mov dl,$1c
	mov cx,$1
	call @mov_cursor
	call @dibuja


	mov al,$7
	mov dh,$13
	mov dl,$20
	mov cx,$1
	call @mov_cursor
	call @dibuja





	mov al,$7
	mov dh,$13
	mov dl,$41
	mov cx,$1
	call @mov_cursor
	call @dibuja




	mov al,$7
	mov dh,$13
	mov dl,$45
	mov cx,$1
	call @mov_cursor
	call @dibuja



	mov al,$7
	mov dh,$13
	mov dl,$4c
	mov cx,$1
	call @mov_cursor
	call @dibuja

	mov al,$7{-----caracter------}
	mov dh,$14{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1a{----repeticion----}
	call @mov_cursor
	call @dibuja
	mov al,$7{-----caracter------}
	mov dh,$14{----cordenada fila----}
	mov dl,$33{----cordenada fila----}
	mov cx,$1a{----repeticion----}
	call @mov_cursor
	call @dibuja
	mov al,$7{-----caracter------}
	mov dh,$15{----cordenada fila----}
	mov dl,$15{----cordenada fila----}
	mov cx,$1a{----repeticion----}
	call @mov_cursor
	call @dibuja
	mov al,$7{-----caracter------}
	mov dh,$15{----cordenada fila----}
	mov dl,$33{----cordenada fila----}
	mov cx,$1a{----repeticion----}
	call @mov_cursor
	call @dibuja
	call @cursor_off


 ret
      @cursor_off:
      PUSH AX
       PUSH CX
       MOV CH,$32
       MOV AH,$1
       INT $10
       POP AX
       POP CX
       RET
end;
end.