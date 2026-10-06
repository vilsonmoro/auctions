# Trabalho - English Auction e Japanese Auction em JaCaMo/Jason

Este pacote contém quatro implementações para permitir a comparação pedida no trabalho:

1. `japanese_A_jason` - Japanese Auction somente com agentes Jason.
2. `japanese_AE_cartago` - Japanese Auction com Jason + artefato CArtAgO.
3. `english_A_jason` - English Auction somente com agentes Jason.
4. `english_AE_cartago` - English Auction com Jason + artefato CArtAgO.

## Cenário padrão
- Produto: notebook
- Compradores: buyer1, buyer2 e buyer3
- Preço inicial: 50
- Incremento: 10
- Limites: buyer1=100, buyer2=130, buyer3=160

## Como executar
Entre na pasta da versão desejada e execute o arquivo `.jcm` pelo JaCaMo 1.3 (IDE/launcher que você já usa). Os projetos não dependem de uma task Gradle customizada nem de `gradlew.bat`.

## Resultado esperado
- Japanese: cada comprador permanece enquanto o preço <= seu limite; ao sair, não retorna. O último ativo vence.
- English: em cada rodada os compradores aptos podem fazer um lance acima do preço atual; o maior lance vira o preço corrente. Quando não há novo lance, vence o autor do maior lance válido.

## Métricas
Cada implementação imprime no console: rodadas, mensagens enviadas/recebidas e preço final. Isso permite executar a matriz experimental descrita no relatório.

Consulte `RELATORIO_Trabalho_Leiloes.docx` e `GUIA_EXPERIMENTOS.md`.
