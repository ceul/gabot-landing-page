#!/usr/bin/env bash
# Legal pages required by Meta to publish the WhatsApp app (privacy, terms, data deletion).
# Run: bash tests/legal-pages.sh
cd "$(dirname "$0")/.." || exit 1
fail=0
check() { if eval "$2"; then echo "ok   $1"; else echo "FAIL $1"; fail=1; fi; }

for page in privacidad.html terminos.html eliminacion-datos.html; do
  check "$page exists" "[ -f $page ]"
  check "$page names the data controller" "grep -q 'Carlos Enrique Urrego Leon' $page 2>/dev/null"
  check "$page shows NIT" "grep -q '700044317-8' $page 2>/dev/null"
  check "$page shows contact email" "grep -q 'gabot@gabblabs.com' $page 2>/dev/null"
  check "$page is Spanish" "grep -q '<html[^>]*lang=\"es\"' $page 2>/dev/null"
  check "$page links home" "grep -q 'href=\"/\"' $page 2>/dev/null"
done

check "privacy cites Ley 1581" "grep -q 'Ley 1581 de 2012' privacidad.html 2>/dev/null"
check "privacy discloses WhatsApp/Meta" "grep -q 'WhatsApp' privacidad.html 2>/dev/null && grep -q 'Meta' privacidad.html 2>/dev/null"
check "privacy discloses OpenAI" "grep -q 'OpenAI' privacidad.html 2>/dev/null"
check "privacy links data deletion" "grep -q 'href=\"/eliminacion-datos.html\"' privacidad.html 2>/dev/null"
check "deletion page explains how to request" "grep -qi 'solicitud' eliminacion-datos.html 2>/dev/null"

check "footer links privacy" "grep -q 'href=\"/privacidad.html\"' index.html"
check "footer links terms" "grep -q 'href=\"/terminos.html\"' index.html"
check "footer links data deletion" "grep -q 'href=\"/eliminacion-datos.html\"' index.html"
check "app icon exists" "[ -f app-icon-1024.png ]"

exit $fail
