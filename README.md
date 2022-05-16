# PROJETO AWS VIA TERRAFORM

Requisitos
- Fazer o deploy dos recursos em: dev,staging,prod
- Estados separados por ambiente remotamente
- Deploy: dev -> stg -> master(prod) 

Projeto:
Usar uma maquina ec2 que pega um arquivo de uma pagina na internet e joga dentro de um bucket s3.

-Quando essa maquina for criada rodar um script em bash que faz isso


itens para criar
- maquina ec2
- s3 bucket para cada um dos 3 estados do terraform
- s3 para receber o arquivo
- policy para atachar na maquina
- maquina ec2 t2.micro