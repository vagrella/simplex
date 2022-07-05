# Vornei Augusto Grella  - RA: 076350
# IA881 - FEEC - Unicamp - Prof. Ricardo
# Turma A: 1S/2022
# Trabalho Computacional 1 - Método Simplex
# Programa GNU - Octave - versão 6.1.0

# Verificar - Interessante:
# https://www.gnu.org/software/octave/index#
# x = A \ b : Resolve o problema de Ax = b

###############################
# Código base: Método Simplex
###############################
function simplex(A, b, c, base, limite_i)
  limite_max = 15;
  passo_a_passo = 0;
  i = 1;
  flag_bigM = 0;
  z = 0;
  [m, n] = size(A);
  xA = [0:0:m];
  # Por motivos de seguranca o programa deve ter um limitados
  # iteracoes limitadas
  fprintf('================================================= \n');
  fprintf('Metodo Simplex com Limite de Iteraçoes: %d \n', limite_i);
  if (limite_i < limite_max)
    fprintf('Limite inferior ao maximo, exibir passo-a-passo em cada iteracao. \n');
    passo_a_passo = 0;
  endif
  fprintf('Verifica se base inicial eh factivel, se nao for aplica BigM... \n');
  fprintf('================================================= \n');
  
  factivel = verificar_factibilidade(A, b, c, base, flag_bigM);
  if (factivel != 1)
    # Fazer BigM
    flag_bigM = 1;
    M = 10000;
    xA = ones(1,m)*-M;
    IA = eye(m); #Identidade Artificial
    temp_A = [A IA];
    temp_c = [c ; xA'];
    [temp_m, temp_n] = size(temp_A);
    ini_n = (temp_n - length(xA))+1;
    temp_base = [ini_n:temp_n];
    
    # Retorna o xA, caso encontre uma base, encontre o ótimo mas significa que a
    # variavel Adicional nao for zero, é porque ela que deixou ótimo
    [nova_base xA] = simplex_BigM(temp_A, b, temp_c, temp_base, M, i, limite_i);
    
    factivel = verificar_factibilidade(A, b, c, nova_base, flag_bigM);
    if (factivel == 1)
      fprintf('================================================= \n');
      fprintf('Nova Base encontrada: ');
      nova_base
      fprintf('================================================= \n');
      base = nova_base;
    endif
  endif
  
  if (flag_bigM == 1)
    factivel = verificar_factibilidade(A, b, c, base, flag_bigM);
  endif
  
  if (factivel == 1)
    z = 0;
    while (i <= limite_i)
      %fprintf('Interação: %d ', i);
      # Matriz basica B que eh uma submatriz de A
      B = A(:, base);
      # Calculando uma Solucao basica factivel
      xB = inv(B)*b;
      
      # Pode ser usado como c, ou c', dependendo de
      # como eh passado o c no simplex.
      # Nesse caso estou passando o c
      %c_t = c
      %cb_t = c(base)
      # Nesse caso estou passando o c transposto
      c_t = c';
      cb_t = c(base)';
      
      # Calcular variável Dual;
      %fprintf('Variáveis Duais: \n');
      wi = cb_t * inv(B);
      # dado por: c_transposto - wi * A
      # com o multiplicador simplex, na base
      s = c_t - wi * A;
      
      %fprintf('Custos Reduzidos Z (LD): \n');
      # Calcular o LD (que esta em z)
      z = cb_t * xB;
      
      desenha_tableu(A, b, c, base, i, wi, z);
      
      c_menor = min(s);
      # Teste de Otimalidade: Verificar se todos sao zeros ou positivos
      if (c_menor < 0)
        # Nao eh otimo, continuar
        fprintf('Z não é ótimo! ');
        # Decidir que entrara na base
        # vmin devolve o menor valor do vetor e sua posicao
        [valor, entra] = vmin(s);
        # eh o candidato a entrar na base
        fprintf('Entra na Base x%d - ', entra);
        fprintf('com valor = %d \n ', valor);
        
        # Definir quem sairah:
        y = inv(B) * A(: , entra)
        
        #Se for ilimitado
        ilimitado = verificar_ilimitado(A, base, entra);
        if (ilimitado == 1)
          i = limite_i;
          break;
        else
          # Definir quem saira: Teste da Taxa minima (ou teste da razao)
          # passar o A e B, pois em caso de empate
          # sera realizado o teste lexografico
          [valor, sai] = taxa_minima(xB, y, A, B, entra, flag_bigM);
          fprintf('Sai da Base x%d - ', base(sai));
          base(sai) = entra;
          fprintf('Entra da Base x%d \n ', base(sai));
          fprintf('---------------------------------------------------- \n');
        endif
        
        if (i >= limite_i)
          fprintf('================================================= \n');
          fprintf('ATENCAO: Programa chegou ao limite de interacoes: %d \n', limite_i);
          fprintf('Caso deseje mais, basta alterar a variavel limite_i (ultimo parametro) \n');
          fprintf('Porem o passo-a-passo eh liberado apenas com limite abaixo do maximo: %d \n', limite_max);
          fprintf('================================================= \n');
          fprintf('--------------------FIM-------------------------- \n')
          fprintf('Pressione qualquer tecla para continuar. \n');
          pause;
        endif
      else
        #Se no ótimo xA != 0, então o problema original é infactı́vel
        if (min(xA) == 0 && max(xA) == 0)
          fprintf('================================================= \n');
          fprintf('Resultado: PL INFACTIVEL! \n');
          fprintf('================================================= \n');
          fprintf('--------------------FIM-------------------------- \n')
          fprintf('Pressione qualquer tecla para continuar. \n');
          pause;
          break;
        else
          # Otimo encontrado
          i = limite_i;
          fprintf('================================================= \n');
          fprintf('Resultado: Ótimo encontrado! Z* : %d \n', z);
          fprintf('================================================= \n');
          fprintf('--------------------FIM-------------------------- \n')
          fprintf('Pressione qualquer tecla para continuar. \n');
          pause;
          break
        endif
      endif
      
      if (passo_a_passo == 1)
        fprintf('FIM DA Interação: %d \n', i);
        fprintf('Pressione qualquer tecla para continuar. \n');
        pause;
      endif
      i = i + 1;
    endwhile
  else
    fprintf('================================================= \n');
    fprintf('Resultado: PL INFACTIVEL! \n');
    fprintf('================================================= \n');
    fprintf('--------------------FIM-------------------------- \n')
    fprintf('Pressione qualquer tecla para continuar. \n');
    pause;
  endif
endfunction
