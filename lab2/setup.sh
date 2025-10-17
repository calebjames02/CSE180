#!/bin/bash

CONTAINER="container-psql"

FILES=(
  create_lab2.sql
  load_lab2.sql
  query1.sql
  query2.sql
  query3.sql
  query4.sql
  query5.sql
)

# Loop through each file and copy it into the container
for FILE in "${FILES[@]}"; do
  if [ -f "$FILE" ]; then
    echo "Copying $FILE to $CONTAINER..."
    docker cp "$FILE" "$CONTAINER":.
  else
    echo "Warning: $FILE not found!"
  fi
done

echo "All done!"

#docker cp create_lab2.sql container-psql:.
#docker cp load_lab2.sql container-psql:.
#docker cp query1.sql container-psql:.
#docker cp query2.sql container-psql:.
#docker cp query3.sql container-psql:.
#docker cp query4.sql container-psql:.
#docker cp query5.sql container-psql:.
