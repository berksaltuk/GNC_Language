#                                  
#  CS 315 Project Part - A         
#                                  
#  gnc.l                           
#  Lex file for the GNC language   
#                                  
#  Gülçin Özkahya     - 21903129   
#  Berk Saltuk Yılmaz - 21903419   
#  Emre Caniklioğlu   - 21803577  
#      

OUT_NAME = programme.exe
OUT_PATH = ./out

LEX_FILE_NAME = gnc_latest.l
LEX_COMPILER  = lex



programme: lex.yy.c
	gcc -o $(OUT_PATH)/$(OUT_NAME) $(OUT_PATH)/lex.yy.c

lex.yy.c: $(LEX_FILE_NAME)
	$(LEX_COMPILER) -o $(OUT_PATH)/lex.yy.c $(LEX_FILE_NAME)

clean:
	rm -f $(OUT_PATH)/lex.yy.c $(OUT_PATH)/$(OUT_NAME)