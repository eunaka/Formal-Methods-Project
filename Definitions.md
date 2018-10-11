Bug Tracking
============

>Identificar e corrigir bugs é uma tarefa essencial no desenvolvimento de bons programas. Considere que uma empresa possui um repositório de códigos-fonte e que esta deseja implementar uma política mais eficiente de eliminação de bugs de software. O repositório da empresa está organizado de acordo com os clientes da empresa. Cada cliente pode ter um ou mais projetos em andamento. Cada projeto é organizado em uma pasta, a qual contém subpastas com as diferentes versões do código do referido projeto. A empresa irá atribuir um time de caçadores de bugs para vasculhar no repositório os projetos em andamento que possuem bugs. O time irá atuar da seguinte forma: a cada dia irão selecionar um projeto de um cliente diferente para trabalharem; sempre irão atuar na versão mais recente do projeto; e não podem trabalhar dois dias consecutivos para identificar bugs de um mesmo cliente. A cada bug identificado, há um relatório descrevendo o bug, a gravidade (1 a 3, sendo 3 muito grave). Todos os bugs devem ser corrigidos pela equipe de desenvolvimento em uma semana. Somente após todos os bugs corrigidos é que o projeto volta a estar apto a uma nova revisão pela equipe caçadora de bugs.

## Requisitos

- Definição de 5 predicados e 3 funções
- Definição de 5 operações que simulam o comportamento do sistema 
- Definição e verificação de 3 asserts (testes sobre o sistema)

## Sugestões

> Vocês podem ter como referência o catálogo de endereços que vimos ao longo de várias aulas. A especificação deste catálogo foi sendo aperfeiçoada ao longo das aulas e chegamos a definir operações que refletem o seu comportamento (como add e remove), assertions, funcões etc; ou seja, tudo o que está sendo requerido na especificação do projeto acima. No entanto, a especificação é um pouco mais complexa.

> Dúvidas foram levantadas a respeito da diferença entre predicados, funções e operações que simulem o comportamento do sistema. Você pode ter predicados e funções usados como auxiliares para as operações que simulem o comportamento, ou seja, são invocados ou expandidas a partir das operações que simulam o comportamento do sistema, que tipicamente são representados por predicados (ou fatos). As assertions retratam verificações que serão feitas sobre o modelo de vocês. Por exemplo, vocês podem fazer assertions para testar se estão cumprindo o que está especificado. Nelas, também podem ser usadas funções ou predicados auxiliares mas não é obrigado. No caso das operações que retratem o comportamento do sistema também não seria obrigado mas é praticamente impossível fazer sem que se tenha predicados ou funções auxiliares.

> Conselho geral: não foquem nos números, foquem na especificação (como atingi-la) que naturalmente o quantitativo de operações, predicados, funções e assertions virão.