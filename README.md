# K8S - Digital Ocean

Esse repositório contém arquivos do terraform (.tf) para subir um cluster Kubernetes na Digital Ocean e fazer o deploy de um Wordpress via Helm chart no mesmo.

A configuração padrão do será: 
- versão `1.24.4-do.0` do Digital Ocean k8s, 
- nome do cluster: `do-k8s-cluster`;
- região: `nyc1`;
- nome do nodepool (worker): `pool1`;
- size (sku) do node (worker): `s-2vcpu-4gb`;
- quantidade de nodes (worker): `1`;
- usuário admin do wordpress: `admin`
- senha admin do wordpress: será gerada automaticamente e mostrada no final da execução do terraform;
- chart utilizado: bitnami wordpresss versão `15.2.6`.

Os valores das configurações padrões podem ser alterados no arquivo `vars.auto.tfvars`. 

# Requisitos
- Terraform cli: [terraform](https://developer.hashicorp.com/terraform/downloads).
- Digital Ocean Account: [digitalocean](https://www.digitalocean.com/).
- Digital Ocean Personal Access Token com permissão de `READ` e `WRITE`. Veja como criar um [aqui](https://docs.digitalocean.com/reference/api/create-personal-access-token/).

# Opcionais:
- kubectl para verificar status do pod: [kubectl](https://kubernetes.io/docs/tasks/tools/)
- helm para verificar status do chart: [helm](https://helm.sh/docs/intro/install/)

# How to
- Crie uma conta na Digital Ocean;
- Crie um Personal Access Token com permissões de `READ` e `WRITE`;
- Exporte o token gerado como uma variável de ambiente no shell que irá executar o terraform com o nome de `DIGITALOCEAN_TOKEN`.
  - No linux/MacOs:
    ```bash
    export DIGITALOCEAN_TOKEN="dop_v1_123123...213abcd"
    ```
  - No Windows:
    ```powershell
    $Env:DIGITALOCEAN_TOKEN="dop_v1_123123...213abcd"
    ```
- No shell, vá até o diretório onde encontram-se os arquivos do terraform: 
    ```bash
    cd doks
    ```
- Inicie o terraform:
    ```bash
    terraform init
    ```
- Faça o plan (como boa prática salvando para um arquivo):
    ```bash
    terraform plan -out 'k8s.tfplan'
    ```
- Faça o apply do plano salvo:
    ```bash
    terraform apply 'k8s.tfplan'
    ```
- Verifique o output do terraform, nele estará o IP público do Wordpress e a senha do usuário admin.
