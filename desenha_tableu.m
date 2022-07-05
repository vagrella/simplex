# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

function desenha_tableu(A, b, c, base, i, w, z)
  [m, n] = size(A);
  B = A(:, base);
  xA = inv(B)*A;
  xB = inv(B)*b;
  
  
  fprintf('Tableu ================================ \n');
  fprintf('Iteração: %d \n', i);
  fprintf('--------------------------------------- \n');
  # desenha cabeçalho: xi | LD | wi
  fprintf('  |');
  # escreve xi
  for i=1:length(c)
    fprintf("x%d | ", i);
  endfor
  # escreve LD
  fprintf('= LD  |====|');
  # escreve wi
  for i=1:length(b)
    fprintf("w%d | ", i);
  endfor
  fprintf('\n');
  fprintf('--------------------------------------- \n');
  # desenha valores: c' | Z | wi
  fprintf('Z |');
  # escreve c'
  for i=1:length(c)
    fprintf("%d | ", c(i));
  endfor
  # escreve z
  fprintf('= %d  |====|', z);
  # escreve c'
  for i=1:length(w)
    fprintf("%d | ", w(i));
  endfor
  fprintf('\n');
  # desenha base | matrix A | b 
  for i=1:m
    # escreve base
    fprintf('x%d |', base(i));
    # escreve A
    for j=1:n
      fprintf('%d |', xA(i,j));
    endfor
    # escreve b
    fprintf('= %d  |====|', xB(i));
    fprintf('\n');
  endfor
  fprintf('====================================== \n');
endfunction