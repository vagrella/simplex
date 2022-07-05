# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

function [min , id] = vmin(vetor)
  id = 1;
  min = vetor(id);
  
  for i=2:length(vetor)
    if ( vetor(i) < min )
      min = vetor(i);
      id = i;
    endif
  endfor
  
endfunction