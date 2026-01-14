#!/usr/bin/bash

# Récupération du session_token
SESSION_TOKEN=$(curl -s -X GET \
  -H "Content-Type: application/json" \
  -H "App-Token: $APP_TOKEN" \
  -H "Authorization: user_token $USER_TOKEN" \
  "$API_URL/initSession" | jq -r '.session_token')

if [ -z "$SESSION_TOKEN" ] || [ "$SESSION_TOKEN" = "null" ]; then
  echo "❌ Erreur : impossible de récupérer le session_token"
  exit 1
fi

echo "✅ Session ouverte : $SESSION_TOKEN"

# Création du ticket
TICKET_RESPONSE=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Session-Token: $SESSION_TOKEN" \
  -H "App-Token: $APP_TOKEN" \
  -d "{
    \"input\": {
      \"name\": \"$TITRE\",
      \"content\": \"$CONTENU\",
      \"priority\": $PRIORITY,
      \"entities_id\": $ENTITE_ID,
      \"_groups_id_assign\": $GROUP_ID
    }
  }" \
  "$API_URL/Ticket")

TICKET_ID=$(echo "$TICKET_RESPONSE" | jq -r '.id')
echo "🎫 Ticket créé avec l'ID : $TICKET_ID dans l'entité $ENTITE_ID et assigné au groupe $GROUP_ID"

# Fermeture de la session
curl -s -X GET \
  -H "Content-Type: application/json" \
  -H "Session-Token: $SESSION_TOKEN" \
  -H "App-Token: $APP_TOKEN" \
  "$API_URL/killSession" > /dev/null

echo "🔒 Session fermée"
