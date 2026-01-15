```yml
      - name: Create ITSM Ticket
        uses: itsmng/itsm-ng_create_ticket_action@master
        with:
          titre: "Ticket test automatique"
          contenu: "Ce ticket est créé automatiquement à chaque commit."
          priority: 3
          entite_id: 15
          group_id: 22
          api_url: "https://support.itsm-ng.com/apirest.php"
          APP_TOKEN: ${{ secrets.APP_TOKEN }}
          USER_TOKEN: ${{ secrets.USER_TOKEN }}
```
