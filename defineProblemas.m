# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional 1 - Método Simplex
# Programa GNU - Octave - versão 6.1.0

#Apendice C
#http://www.dt.fee.unicamp.br/~ricfow/IA881/dadosTrabalho2021.mat

#ERRO: Ao realizar a leitura das variaveis do arquivo, em algumas
# continha a sctring: 
# 'scalar structure containing the fields'
#Gerando erro para o programa simplex
#Encontrado problema :
#https://stackoverflow.com/questions/13512743/display-struct-fields-without-the-mess

function defineProblemas()
  
  fprintf('Limite de Iteracoes definido com: ');
  limite_i = 14;
  fprintf('Caso deseje mais iteracoes alterar a variavel limite_i em defineProblemas.m \n');
  fprintf('Porem o passo-a-passo eh liberado se limite_i estiver abaixo de um limite maximo (limite_max). \n');
  fprintf('Pressione qualquer tecla para continuar. \n');
  pause;
  %load('dadosTrabalho2021.mat')
  %for i=1:6
  %  A=BASE{i}, A
  %  b=BASE{i}, b
  %  c=BASE{i}, c
  %  base=BASE{i}, base
    
    % aplique aqui o metodo simplex
  %  simplex(A, b, c, base, limite_i)
  %endfor
  
  #Exemplo:
  #fprintf('Exemplo 1 - pressione qualquer tecla. \n')
  #A = [1 1 1 0 0;1 -1 0 1 0;-1 1 0 0 1]
  #b = [6;4;4]
  #c = [-1;-2;0;0;0]
  #base = [3 4 5]
  #pause
  #simplex(A, b, c, base, limite_i)
  #fprintf('--------------------FIM-------------------------- \n')
  
  #Exercicio 1: Ilimitado
  fprintf('Iniciando Exercicio 1 - pressione qualquer tecla. \n');
  A = [1.00 -2.00 1.00 0.00 0.00;-1.00 1.00 0.00 1.00 0.00;-1.50 1.00 0.00 0.00 1.00]
  b = [4.00;3.00;1.00]
  c = [-1.00;-3.00;0.00;0.00;0.00]
  base = [3 4 5]
  simplex(A, b, c, base, limite_i);
  
  #Exercicio 2: 6¨
  fprintf('Iniciando Exercicio 2 - pressione qualquer tecla. \n');
  A = [1.00 1.00 -1.00 0.00 0.00;-1.00 1.00 0.00 -1.00 0.00;0.00 1.00 0.00 0.00 1.00]
  b = [2.00;1.00;3.00]
  c = [1.00;-2.00;0.00;0.00;0.00]
  base = [1 2 5]
  simplex(A, b, c, base, limite_i);
  
  #Exercicio 3:
  fprintf('Iniciando Exercicio 3 - pressione qualquer tecla. \n');
  A = [-2.00 0.00 3.00 1.00 0.00 0.00 0.00 0.00;2.00 1.00 2.00 0.00 1.00 0.00 0.00 0.00;0.00 -1.00 3.00 0.00 0.00 1.00 0.00 0.00;3.00 3.00 0.00 0.00 0.00 0.00 1.00 0.00;1.00 -1.00 -3.00 0.00 0.00 0.00 0.00 1.00]
  b = [6.00;7.00;7.00;8.00;9.00]
  c = [-2.00;0.00;-3.00;0.00;0.00;0.00;0.00;0.00]
  base = [4 5 6 7 8]
  simplex(A, b, c, base, limite_i);
  
  #Exercicio 4:
  fprintf('Iniciando Exercicio 4 - pressione qualquer tecla. \n');
  A = [1.00 0.00 0.00 0.25 -8.00 -1.00 9.00;0.00 1.00 0.00 0.50 -12.00 -0.50 3.00;0.00 0.00 1.00 0.00 0.00 1.00 0.00]
  b = [0.00;0.00;1.00]
  c = [0.00;0.00;0.00;-0.75;20.00;-0.50;6.00]
  base = [1 2 3]
  simplex(A, b, c, base, limite_i);
  
  #Exercicio 5: Ilimitado
  fprintf('Iniciando Exercicio 5 - pressione qualquer tecla. \n');
  A = [0.00 -2.00 0.00 1.00 0.00 0.00;-1.00 0.00 1.00 0.00 1.00 0.00;-2.00 1.00 3.00 0.00 0.00 1.00]
  b = [7.00;3.00;2.00]
  c = [3.00;-3.00;1.00;0.00;0.00;0.00]
  #base infactivel
  base = [1 3 2]
  #base factivel
  %base = [4 5 6]
  simplex(A, b, c, base, limite_i);

  
  #Exercicio 6: INfactivel
  fprintf('Iniciando Exercicio 6 - pressione qualquer tecla. \n');
  A = [1.00 1.00 1.00 0.00;2.00 3.00 0.00 -1.00]
  b = [4.00;18.00]
  c = [-3.00;4.00;0.00;0.00]
  #base infactivel
  base = [3 4]
  simplex(A, b, c, base, limite_i);
endfunction