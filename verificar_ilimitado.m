# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

###############################
# Verificar se o PL eh Ilimitado:
###############################
function ilimitado = verificar_ilimitado(A, base, entra)
  ilimitado = 0; # inicialmente não é
  B = A(:, base);
  y = inv(B) * A(: , entra);
  
  # Se todos forem negativo
  if (max(y) < 0)
    ilimitado = 1;
    fprintf('================================================= \n');
    fprintf('Resultado: PL ILIMITADO! \n');
    fprintf('================================================= \n');
    fprintf('--------------------FIM-------------------------- \n')
    fprintf('Pressione qualquer tecla para continuar. \n');
    pause;
  endif
endfunction
