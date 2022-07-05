# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

###############################
# Verificar se o PL eh Factivel:
###############################
function factivel = verificar_factibilidade(A, b, c, base, flag_bigM)
  fprintf('Verificando se Base é Factivel: ');
  factivel = 1;
  Ab = [ A  b ];
  if (rank(A) != rank(Ab))
    fprintf('Infactível, pois rank de A é maior que o rank de A b!');
    factivel = 0;
  else
    # Se tem rank completo
    [m, n] = size(A);
    #Verificar se a Base é coerente com a Matriz A
    if ((length(base) > 0) && (length(base) == m) && max(base) <= n)
      if (flag_bigM == 1)
        # Se for para bigM
        #Verificar se as variáveis não adicionais sao zeros
        %fprintf('Adicionais de c: \n');
        xA = c(length(base)+1:n)';
        
        if ((min(xA) == 0) && (max(xA) == 0))
          fprintf('Factível! \n');
        else
          fprintf('Infactível! \n');
          factivel = 0;
        endif
      else
        #Senao for para bigM
        B = A(:, base);
        factivel_inicial = min(inv(B)*b);
        if (factivel_inicial < 0)
          fprintf('Infactível! \n');
          factivel = 0;
        endif
      endif
    else
      fprintf('Infactível, base vazia ou inválida para a dimensão m da Matriz A! \n');
      base
      factivel = 0;
    endif
  endif
endfunction