# Guia de experimentos e análise

Execute cada uma das quatro versões pelo menos 10 vezes para cada cenário. Como a lógica padrão é determinística, as repetições validam estabilidade; para avaliar escalabilidade, aumente a quantidade de buyers e varie os limites.

## Cenários sugeridos

| Cenário | Buyers | Preço inicial | Incremento | Limites |
|---|---:|---:|---:|---|
| C1 | 3 | 50 | 10 | 100,130,160 |
| C2 | 5 | 50 | 10 | 80,100,120,140,160 |
| C3 | 10 | 50 | 10 | distribuir entre 80 e 200 |
| C4 | 20 | 50 | 10 | distribuir entre 80 e 250 |

Registre: protocolo, arquitetura (A/AE), número de compradores, rodadas, mensagens, preço final, vencedor e tempo total de execução (cronômetro externo, se necessário).

## Critérios de comparação
1. Correção do protocolo.
2. Número de mensagens.
3. Número de rodadas.
4. Preço final alcançado.
5. Separação de responsabilidades entre agentes e ambiente.
6. Facilidade de manutenção/extensão.
7. Escalabilidade quando cresce o número de compradores.

A análise conceitual completa está no relatório.
