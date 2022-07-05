# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

function [max , id] = vmax(vetor)
  id = 1;
  max = vetor(id);
  
  for i=2:length(vetor)
    if ( vetor(i) > max )
      max = vetor(i);
      id = i;
    endif
  endfor
  
endfunction