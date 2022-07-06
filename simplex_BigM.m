# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional
# Programa GNU - Octave - versão 6.1.0

###############################
# Realiza BigM:
###############################
function [ base xA ] = simplex_BigM(A, b, c, base, M, i, limite_i)
  
  fprintf('INICIO BigM ------------------- \n');
  fprintf('Pivotamento: %d \n', i);
  flag_bigM = 1;
  [m, n] = size(A);
  ini_n = n - length(base)+1;
  xA = c(ini_n:n);
  #Atingiu o limite de pivotamento
  if (i <= limite_i)
    B = A(:, base);
    xB = inv(B) * b;
    c_t = c';
    cb_t = c(base)';
    wi = cb_t * inv(B);
    s = c_t - wi * A;
    [valor, entra] = vmin(s);
    y = inv(B) * A(: , entra);
    
    #Se for ilimitado
    ilimitado = verificar_ilimitado(A, base, entra);
    if (ilimitado == 1)
      i = limite_i;
    else
      if (max(y) >= 0)
        #Se todos os valores positivos ou nulos
        [valor, sai] = taxa_minima(xB, y, A, B, entra, flag_bigM);
        # Não pode retornar posicao zero:
        #significa que não encontrou candidato para entrar na base
        if (sai > 0)
          factivel = verificar_factibilidade(A, b, c, base, flag_bigM);
          if ((factivel != 1) && i <= limite_i);
            base(sai) = entra
            i = i + 1;
            # Recursividade
            [ base xA ] = simplex_BigM(A, b, c, base, M, i, limite_i);
          endif
        endif
      endif
    endif
  else
    fprintf('Limite de pivotamento atingido: %d ', i);
  endif
  fprintf('FIM BigM ---------------------- \n');
endfunction