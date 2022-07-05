# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

function [valor , id] = taxa_minima(xB, y, A, B, entra, flag_bigM)
  id = 0;
  valor = 0;
  cand = 0;
  fprintf('\nTaxa Minima: ');
  for i=1:length(y)
    if (y(i) > 0)
      #Nao faz se for negativo
      cand = xB(i) ./ y(i);
      if (id == 0)
        id = i;
        valor = cand;
      else
        if ( cand < valor )
          id = i;
          valor = cand;
        elseif (cand == valor)
          id = lexografico(i, id, A, B, entra);
        endif
      endif
    endif
    
    if (flag_bigM == 1)
      #Se é Big-M
      if (id == 0)
        if (y(i) == 0 && xB(i) >= 0)
          id = i
          xB
        elseif (y(i) < 0 && xB(i) < 0)
          id = i
          cand = xB(i) ./ y(i)
          valor = cand
        endif
      endif
    endif
    
  endfor
  #Verificar se encontrou algum candidato para sair da base
  if (id > 0)
    fprintf('Venceu x%d = %d \n', id, valor);
  else
    fprintf('Nenhum candidato xi para sair da base \n');
  endif
endfunction