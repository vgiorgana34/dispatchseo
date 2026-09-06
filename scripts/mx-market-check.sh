#!/bin/sh
# Verifica que el parche de México esté presente en los dos archivos que
# deben ir en sincronía (ver comentario de cabecera en src/lib/market.ts).
set -e
cd "$(dirname "$0")/.."
grep -q 'location_code: 2484' src/lib/market.ts || { echo "FALTA: 2484 en market.ts"; exit 1; }
grep -q 'label: "Mexico"' src/lib/market.ts || { echo "FALTA: label Mexico en market.ts"; exit 1; }
grep -q '2484: "mx"' src/lib/serp.ts || { echo "FALTA: 2484 -> mx en serp.ts"; exit 1; }
echo "OK: mercado México presente en market.ts y serp.ts"
