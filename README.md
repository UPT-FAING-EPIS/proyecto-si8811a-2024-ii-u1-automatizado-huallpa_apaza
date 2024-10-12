# DIAGRAMAS 

En esta rama se generan los diagramas de infraestructura del repositorio proyecto-si8811a-2024-ii-u1-desarrollo-api-back y develop, la rama donde están los archivos TF.

## Diagrama de Infraestructura
![Diagrama de Infraestructura](Brainboard%20-%20diagrama.png)

## Diagrama de Infraestructura
```mermaid
graph TD;
    grafana_cloud_stack --> AWS
```

## Diagrama de Estructura de Archivos
```mermaid
graph TD;
    Root --> terraform_repo
    terraform_repo --> modules
    modules --> grafana
    modules --> mongodb
    modules --> mobile_app
    modules --> web_app
    modules --> docker_host
    terraform_repo --> .github
    .github --> workflows
    terraform_repo --> .git
    .git --> info
    .git --> branches
    .git --> refs
    refs --> heads
    refs --> remotes
    remotes --> origin
    refs --> tags
    .git --> logs
    logs --> refs
    refs --> heads
    refs --> remotes
    remotes --> origin
    .git --> objects
    objects --> info
    objects --> f2
    objects --> 99
    objects --> 0d
    objects --> 7f
    objects --> 50
    objects --> da
    objects --> 3c
    objects --> 53
    objects --> pack
    objects --> 88
    objects --> 1c
    objects --> de
    objects --> 9b
    objects --> e6
    objects --> c8
    objects --> f7
    objects --> 15
    objects --> d0
    objects --> 60
    objects --> 5e
    objects --> eb
    objects --> 19
    objects --> 21
    objects --> ff
    objects --> 79
    objects --> 80
    objects --> 0c
    objects --> f8
    objects --> f0
    objects --> 74
    .git --> hooks
    grafana --> variables.tf
    grafana --> main.tf
    grafana --> outputs.tf
    mongodb --> variables.tf
    mongodb --> outputs.tf
    mobile_app --> variables.tf
    mobile_app --> outputs.tf
    web_app --> variables.tf
    web_app --> outputs.tf
    docker_host --> variables.tf
    docker_host --> outputs.tf
    terraform_repo --> graph_dot
    terraform_repo --> tfplan.json
    terraform_repo --> terraform.tfvars.template
    terraform_repo --> diagrama.drawio
    workflows --> terraform.yml
    terraform_repo --> README.md
    terraform_repo --> variables.tf
    info --> exclude
    .git --> HEAD
    .git --> config
    .git --> description
    .git --> index
    heads --> develop
    origin --> develop
    logs --> HEAD
    heads --> develop
    origin --> develop
    f2 --> 180d68bbeae7de85cb63afe2b84a648555fa68
    99 --> 6f2f7d0b9ee9917205aa72077616c149e15aff
    0d --> befb67f23c5964dcb4de15613b68b23b9d25e0
    7f --> 08ba0e6f486cfc4730c05d39d5da59a164110c
    50 --> 57c9dd88be527c26099172050e71bb3e03a32a
    da --> 8ed2bc72340ba7cefc3867f007d5f81b9a3032
    3c --> d1b90689598bf1a847fb1110a3acdd3d5f678a
    3c --> fb9d582fac49781ccb3e6967cd27667360bb0c
    53 --> 2e5cc0588dec359896af1ba495354d128c8a7e
    88 --> 5e03a0af6af495b7ef7e480f18eed4bf19927e
    1c --> 53d96254216afcd5d5e8ae16ab8ad1911344ad
    de --> c90b4f061171af0988e71cc28e3a8db6c210d2
    9b --> bf54b484ef0293668496bb19ed808d2628b338
    e6 --> 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
    c8 --> b80d72bdad4780a2ee5409f73c79ee18691ed9
    f7 --> 918ae166ac54fdf98bf99cea09fe9cf3533e9e
    15 --> c4a99f0524ef2c00661f48cbe8160295888bf1
    d0 --> 806a5d3e3aaf2999cf9a3ead4a73fd414a28ce
    60 --> 06670925f1b4d88bcf39876b4098c81ecedae7
    5e --> 530994fa852b48b1c0a7791f5000575012238c
    eb --> e00bb3bb7de77cde8cea1f16d0d50b21669a5d
    19 --> 98130a65e8f0bfc874ca1c3d5958ac94c3b598
    21 --> 280aa498e236d181789f1d071a8d8acf2c9f53
    ff --> b86cb69cff8a3cac7c8d909d40e98bf6e594e6
    79 --> 806f8c88aacd4db0166e2f9dfb0d357821eaf1
    80 --> de20b2302ba1391533d014ca2bf0922fea360c
    0c --> ead1182fe4490d1dc80d1dbc3e82e159d30ac8
    f8 --> 1158a28f0c7febc6d9af4b2c243ffeb60367a3
    f0 --> dfce682a22b1f08edcf9dcd9bde590b6c46f11
    74 --> 4b623461fa15a9815a2ad4e5a774c7b305b9c8
    .git --> FETCH_HEAD
    hooks --> prepare-commit-msg.sample
    hooks --> post-update.sample
    hooks --> fsmonitor-watchman.sample
    hooks --> sendemail-validate.sample
    hooks --> pre-rebase.sample
    hooks --> pre-commit.sample
    hooks --> commit-msg.sample
    hooks --> pre-merge-commit.sample
    hooks --> pre-push.sample
    hooks --> applypatch-msg.sample
    hooks --> push-to-checkout.sample
    hooks --> pre-receive.sample
    hooks --> update.sample
    hooks --> pre-applypatch.sample
    .git --> shallow
    terraform_repo --> outputs.tf
    terraform_repo --> .txt
    terraform_repo --> tfplan
```

## Archivos Terraform Analizados

- terraform_repo/modules/grafana/variables.tf
- terraform_repo/modules/grafana/main.tf
- terraform_repo/modules/grafana/outputs.tf
- terraform_repo/modules/mongodb/variables.tf
- terraform_repo/modules/mongodb/outputs.tf
- terraform_repo/modules/mobile_app/variables.tf
- terraform_repo/modules/mobile_app/outputs.tf
- terraform_repo/modules/web_app/variables.tf
- terraform_repo/modules/web_app/outputs.tf
- terraform_repo/modules/docker_host/variables.tf
- terraform_repo/modules/docker_host/outputs.tf
- terraform_repo/variables.tf
- terraform_repo/outputs.tf
## Recursos Utilizados
- MongoDB
- Grafana
- Aplicaciones Web y Móviles
- API Backend
