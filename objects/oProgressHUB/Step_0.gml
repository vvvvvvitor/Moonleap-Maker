/// @description Insert description here
// You can write your code in this editor



timer_atual++;
if(timer_atual >= timer_transicao){
	timer_atual = 0;
	if(cor_progresso_atual < cor_progresso_maximo){
		cor_progresso_atual++;
	}
	
	if(cor_total_atual < cor_total_maximo){
		cor_total_atual++;
	}
}

cor_progresso = cores[cor_progresso_atual];
cor_total = cores[cor_total_atual];