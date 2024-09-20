programa
{
	inclua biblioteca Arquivos --> a
	inclua biblioteca Texto --> txt
	inclua biblioteca Tipos --> tp
	
	cadeia produtos[99999][6]
	//inteiro bancoProdutos = a.abrir_arquivo("./produtos", MODO_ACRESCENTAR)

	funcao menu(){
		inteiro opc
		escreva("  - Digite a opção que você  deseja fazer \n")
		escreva("1 - Registrar/Atualizar produtos\n")
		escreva("2 - Contagem de produtos \n")
		escreva("3 - Alerta de estoque baixo\n")
		escreva("4 - Leitura de código de barras \n")
		escreva("5 - Geração de relatórios \n")
		escreva("0 - Sair")
		leia(opc)
		se(opc == 1){
			registrarProdutos()
			}
		se(opc == 2){
			contarProdutos()
			}
		se(opc == 3){
			
			}
		se(opc == 4){
			
			}
		se(opc == 5){
			
			}
		se(opc == 0){
			
			}
			
		}

	funcao contarProdutos(){
		cadeia codigo
		inteiro i = 0
		escreva("Insira o código de barras \n")
		leia(codigo)

		para(i = 0; i < 999999; i++){
			se (codigo == produtos[i][1]){
				escreva("O total de produtos em estoque do produto ", produtos[i][0], " é de: ",produtos[i][2])
				i = 999999
				}
			}
		
		}
	
	funcao registrarProdutos(){
		cadeia codigo 
		inteiro i = 0
		inteiro aux = 0
		inteiro vendas = 0
		inteiro bancoProdutos 
		inteiro auxiliar = 0
		cadeia nome
		cadeia descricao
		cadeia categoria
		cadeia preco
		
		
		escreva("Registrar/Atualizar produtos \n")
		escreva("Digite o código do produto\n")
		leia(codigo)
		para (i = 0; i < 999998 e produtos[i][1] != ""; i++){
		se (codigo == produtos[i][1]){
			auxiliar = 3
			aux = i
			i = 1000000
			}senao{
				auxiliar = 2
				}
 			
			}
				se (auxiliar == 3){
 				escreva("Produto: ", produtos[aux][0], "\n")
 				escreva("Codigo: ", produtos[aux][1], "\n")
 				escreva("Descrição: ", produtos[aux][2], "\n")
 				escreva("Categoria: ", produtos[aux][3], "\n")
 				escreva("Preço: ", produtos[aux][4], "\n")
 				escreva("Vendas até agora ", produtos[aux][5], "\n")
 				escreva("Digite abaixo o número de vendas atualizado \n")
 				leia(produtos[aux][5])
 				i = 0
 				bancoProdutos = a.abrir_arquivo("./produtos.txt", a.MODO_ESCRITA)
 				enquanto (produtos[i][0] != ""){
				a.escrever_linha(produtos[i][0]+";"+produtos[i][1]+";"+produtos[i][2]+";"+produtos[i][3]+";"+produtos[i][4]+";"+produtos[i][5], bancoProdutos)
 					i = i++
 					}
 					a.fechar_arquivo(bancoProdutos)
 					}senao{
 					bancoProdutos = a.abrir_arquivo("./produtos.txt", a.MODO_ACRESCENTAR)
 					escreva("Insira o nome do produto \n")
 					leia(nome)
 					escreva("Insira a descrição do produto \n")
 					leia(descricao)
 					escreva("Insira a categoria\n")
 					leia(categoria)
 					escreva("Insira o preço \n")
 					leia(preco)
 					escreva("Insira a quantidade de vendas feitas, se já aconteceram \n")
 					leia(vendas)
 					a.escrever_linha(nome+";"+codigo+";"+descricao+";"+categoria+";"+preco+";"+vendas, bancoProdutos)
 					a.fechar_arquivo(bancoProdutos)
 					}
 				carregarProdutos()
		
		}
	funcao carregarProdutos(){
		inteiro bancoProdutos = a.abrir_arquivo("./produtos.txt", a.MODO_LEITURA)
		inteiro i = 0
		inteiro caracteresRestantes = 0
		enquanto(nao a.fim_arquivo(bancoProdutos)){

			cadeia linha = a.ler_linha(bancoProdutos)

			se(linha != ""){
		inteiro posicaoAnterior = 0
	 	inteiro posicaoSeparador = txt.posicao_texto(";", linha, 0)
	 	produtos[i][0] = txt.extrair_subtexto(linha, posicaoAnterior, posicaoSeparador)
	 	
	 	posicaoAnterior = posicaoSeparador + 1
	 	posicaoSeparador = txt.posicao_texto(";", linha, posicaoAnterior)
		produtos[i][1] = txt.extrair_subtexto(linha, posicaoAnterior, posicaoSeparador)
		
		posicaoAnterior = posicaoSeparador + 1
	 	posicaoSeparador = txt.posicao_texto(";", linha, posicaoAnterior)
		produtos[i][2] = txt.extrair_subtexto(linha, posicaoAnterior, posicaoSeparador)
		
		posicaoAnterior = posicaoSeparador + 1
	 	posicaoSeparador = txt.posicao_texto(";", linha, posicaoAnterior)
		produtos[i][3] = txt.extrair_subtexto(linha, posicaoAnterior, posicaoSeparador)

		posicaoAnterior = posicaoSeparador + 1
	 	posicaoSeparador = txt.posicao_texto(";", linha, posicaoAnterior)
		produtos[i][4] = txt.extrair_subtexto(linha, posicaoAnterior, posicaoSeparador)

		posicaoAnterior = posicaoSeparador + 1
		posicaoSeparador = txt.numero_caracteres(linha)
		caracteresRestantes = txt.numero_caracteres(linha) - posicaoAnterior
		produtos[i][5] = txt.extrair_subtexto(linha, (txt.numero_caracteres(linha)-caracteresRestantes), txt.numero_caracteres(linha))
				}
			i = i+1
			}
			a.fechar_arquivo(bancoProdutos)
		}
	funcao inicio()
	{
		carregarProdutos()
		registrarProdutos()
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1029; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {produtos, 7, 8, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */