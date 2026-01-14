```yml
jobs:
  test-create-ticket:
    uses: itsmng/itsm-ng_create_ticket_action/.github/workflows/create_ticket.yml@master
    with:
      titre: "Ticket test automatique"
      contenu: "Ce ticket est créé automatiquement à chaque commit."
      priority: 3
      entite_id: 2
      group_id: 26
      api_url: "https://demo-test.itsm-ng.org/apirest.php"
    secrets:
      GLPI_APP_TOKEN: ${{ secrets.APP_TOKEN }}
      GLPI_USER_TOKEN: ${{ secrets.USER_TOKEN }}
```
