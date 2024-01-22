# README do NftTokenGame

## Visão Geral

O NftTokenGame.sol é um contrato inteligente Solidity para criar e gerenciar NFTs (Tokens Não-Fungíveis) que representam monstros de jogo. O contrato é construído no padrão ERC-721 e utiliza a biblioteca OpenZeppelin para a implementação do ERC-721.

## Informações sobre o Contrato Inteligente

- **Nome do Contrato:** NftTokenGame
- **Símbolo:** NTG
- **Licença:** GPL-3.0
- **Versão do Solidity:** ^0.8.0
- **Versão do OpenZeppelin:** Referenciada a partir da biblioteca em "@openzeppelin/contracts/token/ERC721/ERC721.sol"

## Recursos

1. **Estrutura do Monstro**: O contrato define uma estrutura `Monstro` que representa monstros de jogo, incluindo atributos como `nome`, `nível` e `img`.

2. **Propriedade do Token**: O padrão ERC-721 é utilizado para gerenciar a propriedade dos NFTs, garantindo que cada token de monstro seja único e de propriedade de um endereço específico.

3. **Proprietário do Jogo**: O contrato possui um proprietário de jogo designado, inicialmente configurado como o endereço que implantou o contrato.

4. **Funcionalidade de Batalha**: A função `battle` permite que os proprietários de monstros participem de batalhas. O vencedor ganha pontos de experiência, sendo que o atacante ganha mais pontos se tiver um nível mais alto que o defensor.

5. **Modificador de Validação de Propriedade**: O modificador `onlyOwnerOf` é usado para restringir determinadas funções apenas ao proprietário do respectivo monstro.

6. **Criar Novo Monstro**: A função `createNewMonster` permite ao proprietário do jogo criar novos monstros, especificando o nome do monstro, o URI da imagem e o endereço do destinatário.

## Funções

### `constructor()`

- Inicializa o contrato com o nome "NftTokenGame" e o símbolo "NTG."
- Define o proprietário do jogo como o endereço que implantou o contrato.

### `battle(uint _attackingMonster, uint _defendingMonster)`

- Permite que o proprietário do monstro atacante batalhe com o monstro defensor.
- Ajusta os níveis dos monstros com base no resultado da batalha.

### `createNewMonster(string memory _name, address _to, string memory _img)`

- Cria um novo monstro com o nome e URI da imagem fornecidos.
- Acessível apenas ao proprietário do jogo.
- Gera um novo NFT para o monstro criado e o atribui ao endereço especificado.

### `onlyOwnerOf(uint _monsterId)`

- Modificador que garante que a função seja acessível apenas ao proprietário do monstro especificado.

## Uso

Para usar este contrato:

1. Implante o contrato em uma rede Ethereum compatível.
2. Interaja com o contrato usando uma carteira Ethereum compatível ou script.
3. O proprietário do jogo pode criar novos monstros usando a função `createNewMonster`.
4. Proprietários de monstros podem participar de batalhas usando a função `battle`.

## Considerações de Segurança

- Certifique-se de que o contrato seja implantado em uma rede Ethereum segura e confiável.
- Tenha cautela ao modificar a lógica do contrato, especialmente funções relacionadas à propriedade e à criação de tokens.

## Licença

Este contrato inteligente é licenciado sob a Licença Pública Geral GNU v3.0 (GPL-3.0).

## Agradecimentos

- O contrato é construído no padrão ERC-721 e utiliza a biblioteca OpenZeppelin para a implementação do ERC-721.

---
