#!/bin/bash

#Criar usuário: 
cri(){
   clear; echo -e "Usuário(s) existente(s):\n_____________________________"
   egrep [1][0-9]{3} /etc/passwd | cut -d: -f2
   echo -en "_____________________________\n\nCrie um usuário: "
   read usuario

   pass(){
      read -p "Digite a senha: " -s senha
      echo ""
      read -p "Redigite a senha: " -s senha2
      echo -e "\n[processando...]"
   }
   pass

   while [ $senha != $senha2 ]; do
      clear
      echo " ____________________________________"
      echo "|A senha não é igual; tente novamente|"
      echo -e "|____________________________________|\n"
      pass
   done

   if ! sudo useradd -m $usuario -p $(openssl passwd -1 $senha) -s /bin/bash; then
      clear; echo "[Erro] ao criar o usuário $usuario"
   else
      sudo gpasswd -a $usuario sudo
      clear; echo "[Ok] usuário $usuario criado"
   fi
}
cri