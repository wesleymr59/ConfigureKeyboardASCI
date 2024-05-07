#!/bin/bash

# Dar permissão de execução ao script
chmod +x "$0"

# Criar o arquivo do modelo de teclado
sudo tee /usr/share/X11/xkb/symbols/abnt_custom <<EOF
default partial alphanumeric_keys
xkb_symbols "basic" {
    include "us(intl)"
    name[Group1]= "ABNT Custom";
};
EOF

# Adicionar entrada para o novo modelo de teclado no arquivo de regras do XKB
sudo tee -a /usr/share/X11/xkb/rules/evdev.xml <<EOF
<layout>
  <configItem>
    <name>abnt_custom</name>
    <shortDescription>ABNT Custom</shortDescription>
    <description>Custom ABNT Keyboard Layout</description>
    <languageList>
      <iso639Id>eng</iso639Id>
    </languageList>
  </configItem>
</layout>
EOF

# Reiniciar o servidor X ou fazer logout e login novamente
echo "Reiniciando o servidor X ou faça logout e login novamente para que as alterações entrem em vigor."
