# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

###############################
# Teste Lexografico
###############################
function id_lexo = lexografico(i, id, A, B, entra)
  A = A(:, entra)
  fprintf('Teste Lexografico entre posicoes: %d e %d ', i, id);
  fprintf(': \n');
  for j=1:length(B)
    if (B(i,j)/A(i) < B(id,j)/A(id))
      id_lexo = i;
      break;
    elseif (B(i,j)/A(i) > B(id,j)/A(id))
      id_lexo = id;
      break;
    endif
  endfor
endfunction